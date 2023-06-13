with Stars; use Stars;

package Stars.Systems is

   Null_Index : constant Star_Index := 0;

   type Star_System (Max_Size : Star_Index) is private;

   function Create
     (System : in out Star_System; Init : Star_Record) return Star_Index;

   function Get
     (System : Star_System; Index : Star_Index) return Star_Record;

   function Next_Valid_Star
     (System : Star_System; Ind : Star_index) return Star_Index;

   function First_Valid_Star (System : Star_System) return Star_Index;

private

   type Star_Array is array (Star_Index range <>) of Star_Record;

   type Star_System (Max_Size : Star_Index) is record
      The_Stars : Star_Array (1 .. Max_Size) := (others => No_Star);
   end record;

end Stars.Systems;
