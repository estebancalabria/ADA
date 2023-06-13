with Ada.Numerics;                      use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Stars.Physics is

   procedure Move (System : in out Star_System; The_Star : in out Star_Record) is
   begin
      if The_Star.Kind /= Solar_Star then
         The_Star.Angle := The_Star.Angle + The_Star.Speed;

         if The_Star.Kind = Comet then
            The_Star.X :=
              (Get (System, The_Star.Turns_Around).X
               + Cos (The_Star.Angle) * (The_Star.Distance_Max));

            The_Star.Y :=
              Get (System, The_Star.Turns_Around).Y
              + Sin (The_Star.Angle) * (The_Star.Distance);
         else
            The_Star.X :=
              (Get (System, The_Star.Turns_Around).X
               + Cos (The_Star.Angle) * The_Star.Distance);

            The_Star.Y :=
              Get (System, The_Star.Turns_Around).Y
              + Sin (The_Star.Angle) * The_Star.Distance;
         end if;
      end if;

      if The_Star.Graphic /= Null_Shape_Id then
         Set_X (The_Star.Graphic, The_Star.X);
         Set_Y (The_Star.Graphic, The_Star.Y);

         if The_Star.Kind = Planet_With_Rings then
            Set_X (The_Star.Ring, The_Star.X);
            Set_Y (The_Star.Ring, The_Star.Y);
         end if;
      end if;
   end Move;

   procedure Move_All (Stars : in out Star_System) is
      Index : Star_Index := First_Valid_Star (Stars);
      Current : Star_Record;
   begin
      while Index /= Null_Index loop
         Current := Get (Stars, Index);
         Move (Stars, Current);

         Index := Next_Valid_Star (Stars, Index);
      end loop;
   end Move_All;

end Stars.Physics;
