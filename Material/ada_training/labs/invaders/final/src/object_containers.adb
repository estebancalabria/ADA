-----------------------------------------------------------------------
--                              Ada Labs                             --
--                                                                   --
--                 Copyright (C) 2008-2012, AdaCore                  --
--                                                                   --
-- Labs is free  software; you can redistribute it and/or modify  it --
-- under the terms of the GNU General Public License as published by --
-- the Free Software Foundation; either version 2 of the License, or --
-- (at your option) any later version.                               --
--                                                                   --
-- This program is  distributed in the hope that it will be  useful, --
-- but  WITHOUT ANY WARRANTY;  without even the  implied warranty of --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU --
-- General Public License for more details. You should have received --
-- a copy of the GNU General Public License along with this program; --
-- if not,  write to the  Free Software Foundation, Inc.,  59 Temple --
-- Place - Suite 330, Boston, MA 02111-1307, USA.                    --
-----------------------------------------------------------------------

with GNAT.Strings; use GNAT.Strings;

package body Object_Containers is

   ----------
   -- Cell --
   ----------

   --  [NOTE] This is the completion of the cell type declared in the private
   --  spec.
   type Cell is record
      Prev, Next : Cursor;

      --  [NOTE] The use of an anonymous access type is particularly
      --  appropriate here because we don't want the cell to make any
      --  assumption on how the container is managed. As seen later in the
      --  implementation, it will be perfectly possible to get a container
      --  on the stack referenced through this object.
      Container  : access constant Object_Container;

      Name       : String_Access;

      --  [NOTE] This element is aliased in order to allow to write access to
      --  it later on.
      Element    : aliased Base_Object_Access;

      To_Be_Deleted : Boolean := False;
   end record;

   --------------------
   -- Iterators spec --
   --------------------

   use Iterators;

   --  [NOTE] Interrestingly, there's possibly very little information to give
   --  to the iterator. The position, or cursor, will be given by the Next
   --  and Prev primitives. However, in order to implement First and Last, the
   --  container need to be accessible. Note the potential memory corruption
   --  issue - an iterator cannot live longer than the container. A safe
   --  implementation would use a reference mechanism, that we will avoid here
   --  for the sake of simplicity.
   type Iterator is new Reversible_Iterator with record
      Container : access constant Object_Container;

      --  [NOTE] We'll allow the iteration to filter on children of a certain
      --  tag, hence this field.
      Child_Of : Tag := No_Tag;

      Start_Position     : Cursor := null;
      Use_Start_Position : Boolean := False;
   end record;

   overriding
   function First
     (Object : Iterator) return Cursor;

   overriding
   function Next
     (Object   : Iterator;
      Position : Cursor) return Cursor;

   overriding
   function Last
     (Object : Iterator) return Cursor;

   overriding
   function Previous
     (Object   : Iterator;
      Position : Cursor) return Cursor;

   ------------
   -- Append --
   ------------

   procedure Append
     (This  : aliased in out Object_Container;
      Value : Base_Object_Access;
      Key   : String := "")
   is
      New_Cell : Cursor := new Cell;
   begin
      --  [IMPLEMENTER NOTE] Ada 2012 should probably allow this to work with a
      --  regular access instead of unchecked access, as the accessiblity level
      --  would be computed dynamically. To be checked with latest RM
      --  developments.
      New_Cell.Container := This'Unchecked_Access;
      New_Cell.Element := Value;

      if Key /= "" then
         New_Cell.Name := new String'(Key);
      end if;

      if This.First = null then
         This.First := New_Cell;
         This.Last := New_Cell;
      else
         New_Cell.Prev := This.Last;
         This.Last.Next := New_Cell;
         This.Last := New_Cell;
      end if;
   end Append;

   ----------
   -- Next --
   ----------

   function Next (C : Cursor) return Cursor is
   begin
      return C.Next;
   end Next;

   -------------
   -- Element --
   -------------

   function Element
     (Key : Cursor) return Base_Object_Access is
   begin
      return Key.Element;
   end Element;

   -------------
   -- Element --
   -------------

   function Element
     (This : Object_Container; Key : Cursor) return Base_Object_Access
   is
   begin
      return Key.Element;
   end Element;

   -------------
   -- Element --
   -------------

   function Element
     (This : Object_Container; Key : String) return Base_Object_Access
   is
   begin
      for C in This.Iterate loop
         if C.Name /= null and then C.Name.all = Key then
            return C.Element;
         end if;
      end loop;

      raise Container_Error with Key & " not found in the container.";
   end Element;

   ------------------------
   -- Schedule_To_Delete --
   ------------------------

   procedure Schedule_To_Delete (C : in out Cursor) is
   begin
      C.To_Be_Deleted := True;
   end Schedule_To_Delete;

   ------------------------
   -- Schedule_To_Delete --
   ------------------------

   procedure Schedule_To_Delete
     (Container : Object_Container; C : Base_Object_Access)
   is
   begin
      for I in Container.Iterate loop
         if Container.Element (I) = C then
            I.To_Be_Deleted := True;
         end if;
      end loop;
   end Schedule_To_Delete;

   ----------------------
   -- Delete_Scheduled --
   ----------------------

   procedure Delete_Scheduled (Container : in out Object_Container) is
      I : Cursor;
      N : Cursor;
   begin
      I := Container.First;

      while I /= null loop
         N := I.Next;

         if I.To_Be_Deleted then
            if I = Container.First then
               Container.First := Container.First.Next;
            end if;

            if I = Container.Last then
               Container.Last := Container.Last.Prev;
            end if;

            if I.Prev /= null then
               I.Prev.Next := I.Next;
            end if;

            if I.Next /= null then
               I.Next.Prev := I.Prev;
            end if;
         end if;

         I := N;
      end loop;
   end Delete_Scheduled;

   -----------------
   -- Has_Element --
   -----------------

   function Has_Element (V : Cursor) return Boolean is
   begin
      return V /= null;
   end Has_Element;

   -----------------
   -- Ref_Element --
   -----------------

   function Ref_Element
     (This : Object_Container; Key : Cursor) return Ref_Object
   is
   begin
      return Ref_Object'(Elem => Key.Element'Access);
   end Ref_Element;

   -----------------
   -- Ref_Element --
   -----------------

   function Ref_Element
     (This : in out Object_Container; Key : String) return Ref_Object
   is
   begin
      for C in This.Iterate loop
         if C.Name /= null and then C.Name.all = Key then
            return Ref_Object'(Elem => C.Element'Access);
         end if;
      end loop;

      --  If no element has been found, then just add an empty one

      This.Append (null, Key);

      return Ref_Element (This, This.Last);
   end Ref_Element;

   -------------
   -- Iterate --
   -------------

   function Iterate
     (This : aliased Object_Container)
      return Iterators.Reversible_Iterator'Class
   is
   begin
      return Iterator'(Container => This'Unchecked_Access, others => <>);
   end Iterate;

   -------------
   -- Iterate --
   -------------

   function Iterate
     (This : aliased Object_Container; Child_Of : Tag)
      return Iterators.Reversible_Iterator'Class
   is
   begin
      return Iterator'
        (Container          => This'Unchecked_Access,
         Child_Of           => Child_Of,
         Start_Position     => null,
         Use_Start_Position => False);
   end Iterate;

   -------------
   -- Iterate --
   -------------

   function Iterate
     (This : aliased Object_Container; From : Cursor)
      return Iterators.Reversible_Iterator'Class
   is
   begin
      return Iterator'
        (Container          => This'Unchecked_Access,
         Start_Position     => From,
         Use_Start_Position => True,
         others             => <>);
   end Iterate;

   --------------
   -- Is_Valid --
   --------------

   function Is_Valid (Object : Iterator; C : Cursor) return Boolean is
     (not Has_Element (C)
      or else
        (not C.To_Be_Deleted
         and then
           (Object.Child_Of = No_Tag
            or else (C.Element /= null
                     and then Is_Descendant_At_Same_Level
                       (C.Element'Tag, Object.Child_Of)))));

   -----------
   -- First --
   -----------

   overriding
   function First
     (Object : Iterator) return Cursor
   is
      Res : Cursor;
   begin
      if not Object.Use_Start_Position then
         Res := Object.Container.First;
      else
         Res := Object.Start_Position;
      end if;

      if not Is_Valid (Object, Res) then
         Res := Next (Object, Res);
      end if;

      return Res;
   end First;

   ----------
   -- Next --
   ----------

   overriding
   function Next
     (Object   : Iterator;
      Position : Cursor) return Cursor
   is
      Res : Cursor;
   begin
      Res := Position.Next;

      while not Is_Valid (Object, Res) loop
         Res := Res.Next;
      end loop;

      return Res;
   end Next;

   ----------
   -- Last --
   ----------

   overriding
   function Last
     (Object : Iterator) return Cursor
   is
      Res : Cursor;
   begin
      if not Object.Use_Start_Position then
         Res := Object.Container.Last;
      else
         Res := Object.Start_Position;
      end if;

      if not Is_Valid (Object, Res) then
         Res := Previous (Object, Res);
      end if;

      return Res;
   end Last;

   --------------
   -- Previous --
   --------------

   overriding
   function Previous
     (Object   : Iterator;
      Position : Cursor) return Cursor
   is
      Res : Cursor;
   begin
      Res := Position.Prev;

      while not Is_Valid (Object, Res) loop
         Res := Res.Prev;
      end loop;

      return Res;
   end Previous;

end Object_Containers;
