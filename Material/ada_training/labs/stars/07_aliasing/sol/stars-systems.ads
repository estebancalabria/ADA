with Stars; use Stars;

package Stars.Systems is

   type Star_Index is range 0 .. 10_000;

   Null_Index : constant Star_Index := 0;

   type Star_System (Max_Size : Star_Index) is private;

   type Star_System_Access is access all Star_System;

   function Create
     (System : Star_System_Access; Init : Star_Record) return Star_Access;

   function Get
     (System : Star_System_Access; Index : Star_Index) return Star_Access;

   function Next_Valid_Star
     (System : Star_System; Ind : Star_index) return Star_Index;

   function First_Valid_Star (System : Star_System) return Star_Index;

private

   type Star_Array is array (Star_Index range <>) of aliased Star_Record;

   type Star_System (Max_Size : Star_Index) is record
      The_Stars : Star_Array (1 .. Max_Size) := (others => No_Star);
   end record;

end Stars.Systems;
