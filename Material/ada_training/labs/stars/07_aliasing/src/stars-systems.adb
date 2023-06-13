package body Stars.Systems is

   ---------
   -- Add --
   ---------

   function Create
     (System : in out Star_System;
      Init   : Star_Record)
     return Star_Index
   is
   begin
      for J in System.The_Stars'Range loop
         if System.The_Stars (J) = No_Star then
            System.The_Stars (J) := Init;
            return J;
         end if;
      end loop;

      return 0;
   end Create;

   ---------
   -- Get --
   ---------

   function Get
     (System : Star_System;
      Index : Star_Index)
      return Star_Record
   is
   begin
      return System.The_Stars (Index);
   end Get;

   ---------------------
   -- Next_Valid_Star --
   ---------------------

   function Next_Valid_Star
     (System : Star_System;
      Ind : Star_Index)
      return Star_Index
   is
   begin
      for J in Ind + 1 .. System.The_Stars'Last loop
         if System.The_Stars (J) /= No_Star then
            return J;
         end if;
      end loop;

      return Null_Index;
   end Next_Valid_Star;

   ----------------------
   -- First_Valid_Star --
   ----------------------

   function First_Valid_Star (System : Star_System) return Star_Index is
   begin
      return Next_Valid_Star (System, 0);
   end First_Valid_Star;

end Stars.Systems;
