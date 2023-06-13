generic

   type Object_Type is private;
   type Object_Access is not null access all Object_Type;
   No_Object : in Object_Type;
   Default_Object : in Object_Access;

package Containers is

   type Index is range 0 .. 10_000;

   Null_Index : constant Index := 0;

   type Container (Max_Size : Index) is private;

   type Container_Access is access all Container;

   function Create
     (C : Container_Access; Init : Object_Type) return Object_Access;

   function Get
     (C : Container_Access; I : Index) return Object_Access;

   function Next_Valid_Object
     (C : Container; Ind : Index) return Index;

   function First_Valid_Object (C : Container) return Index;

private

   type Container_Array is array (Index range <>) of aliased Object_Type;

   type Container (Max_Size : Index) is record
      The_Objects : Container_Array (1 .. Max_Size) := (others => No_Object);
   end record;

end Containers;
