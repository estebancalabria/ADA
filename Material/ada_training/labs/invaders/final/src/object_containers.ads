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

with Ada.Tags; use Ada.Tags;
with Ada.Finalization; use Ada.Finalization;
with Ada.Iterator_Interfaces;

generic

   type Base_Object (<>) is abstract tagged limited private;
   type Base_Object_Access is access all Base_Object'Class;
   with procedure Free (This : in out Base_Object) is abstract;

package Object_Containers is

   Container_Error : exception;

   type Object_Container is tagged private
   with Default_Iterator => Iterate,
     Iterator_Element    => Base_Object_Access,
     Constant_Indexing   => Element,
     Variable_Indexing   => Ref_Element;

   --  [NOTE] The fact that the This parameter is aliased is redundant. Tagged
   --  types are always passed by reference, thus always aliased. However, as
   --  we will manipulate an access to this container in the subprogram,
   --  marking it explicitly aliased make things more apparent.
   procedure Append
     (This  : aliased in out Object_Container;
      Value : Base_Object_Access;
      Key   : String := "");

   type Cursor is private;

   function Next (C : Cursor) return Cursor;

   function Element
     (Key : Cursor) return Base_Object_Access;

   function Element
     (This : Object_Container; Key : Cursor) return Base_Object_Access;

   function Element
     (This : Object_Container; Key : String) return Base_Object_Access
   with Pre => Key /= "";

   procedure Schedule_To_Delete (C : in out Cursor);

   procedure Schedule_To_Delete
     (Container : Object_Container; C : Base_Object_Access);

   procedure Delete_Scheduled (Container : in out Object_Container);

   type Ref_Object (Elem : access Base_Object_Access) is null record
   with Implicit_Dereference => Elem;

   function Ref_Element
     (This : Object_Container; Key : Cursor) return Ref_Object;
   function Ref_Element
     (This : in out Object_Container; Key : String) return Ref_Object;

   function Has_Element (V : Cursor) return Boolean;

   package Iterators is new Ada.Iterator_Interfaces
     (Cursor, Has_Element);

   function Iterate
     (This : aliased Object_Container)
      return Iterators.Reversible_Iterator'Class;

   function Iterate
     (This : aliased Object_Container; From : Cursor)
      return Iterators.Reversible_Iterator'Class;

   function Iterate
     (This : aliased Object_Container; Child_Of : Tag)
      return Iterators.Reversible_Iterator'Class;

private

   --  [NOTE] Note the deffered type definition here. The full type completion
   --  is given later on in the body. This allows child of the package - if
   --  any - not to rely on the implementation of cell. Only access to this
   --  type or parameters of this type will be allowed.
   type Cell;

   --  [NOTE] We're using this type both to represent an access to a cell
   --  manipulated in the container and to represent a cursor allowing to
   --  iterate over its elements. This is an implementation simplification,
   --  both things can perfectly be separated, the Cursor then pointing to a
   --  cell.
   type Cursor is access all Cell;

   type Object_Container is new Controlled with record
      First, Last : Cursor;
   end record;

end Object_Containers;
