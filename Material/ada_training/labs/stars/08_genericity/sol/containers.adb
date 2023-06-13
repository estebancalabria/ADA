package body Containers is

   ---------
   -- Add --
   ---------

   function Create
     (C : Container_Access;
      Init   : Object_Type)
     return Object_Access
   is
   begin
      for J in C.The_Objects'Range loop
         if C.The_Objects (J) = No_Object then
            C.The_Objects (J) := Init;
            return C.The_Objects (J)'Access;
         end if;
      end loop;

      return Default_Object;
   end Create;

   ---------
   -- Get --
   ---------

   function Get
     (C : Container_Access;
      I : Index)
      return Object_Access
   is
   begin
      return C.The_Objects (I)'Access;
   end Get;

   ---------------------
   -- Next_Valid_Star --
   ---------------------

   function Next_Valid_Object
     (C : Container; Ind : Index) return Index
   is
   begin
      for J in Ind + 1 .. C.The_Objects'Last loop
         if C.The_Objects (J) /= No_Object then
            return J;
         end if;
      end loop;

      return Null_Index;
   end Next_Valid_Object;

   ------------------------
   -- First_Valid_Object --
   ------------------------

   function First_Valid_Object (C : Container) return Index is
   begin
      return Next_Valid_Object (C, 0);
   end First_Valid_Object;

end Containers;
