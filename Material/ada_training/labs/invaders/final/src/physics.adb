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

with Ada.Numerics.Generic_Elementary_Functions;

package body Physics is

   package Elementary_Functions is new Ada.Numerics.Generic_Elementary_Functions
     (Mks_Type);
   use Elementary_Functions;

   -----------------
   -- Get_Objects --
   -----------------

   function Get_Objects (Board : aliased in out Board_Type)
      return access Container.Object_Container is
   begin
      return Board.Objects'Unchecked_Access;
   end Get_Objects;

   ----------
   -- Move --
   ----------

   procedure Move (This : in out Movement_Type) is
      use System.Dim.Mks;
      Angle_Increment : Angle;
   begin
      case This.Kind is
         when Circular =>
            Angle_Increment := Angle (This.Linear_Speed / This.Distance);
            This.Current_Angle := This.Current_Angle + Angle_Increment;
            Set_X
              (This.Moving_Object.all,
               Get_X (This.Around.all)
               + Cos (This.Current_Angle)
               * This.Distance);
            Set_Y
              (This.Moving_Object.all,
               Get_X (This.Around.all)
               + Sin (This.Current_Angle)
               * This.Distance);

         when Elliptic =>
            declare
               Current_X : Length :=
                 Cos (This.Current_Angle) * This.Distance_Min;
               Current_Y : Length :=
                 Sin (This.Current_Angle) * This.Distance_Max;
               Square_Distance : Area :=
                 Current_X ** 2 + Current_Y ** 2;
               Current_Distance : Length :=
                 Length
                   (if Square_Distance >= Area (0.0) then Sqrt (Square_Distance)
                    else Area (0.0));
            begin
               if Current_Distance = 0.0 * m then
                  Angle_Increment := 0.0;
               else
                  Angle_Increment :=
                    Angle (This.Linear_Speed / Current_Distance);
               end if;

               This.Current_Angle := This.Current_Angle + Angle_Increment;

               Set_X
                 (This.Moving_Object.all,
                  Get_X (This.Around.all) + Cos (This.Current_Angle)
                  * This.Distance_Min);
               Set_Y
                 (This.Moving_Object.all,
                  Get_X (This.Around.all) + Sin (This.Current_Angle)
                  * This.Distance_Max);
            end;

         when Translation =>
            Set_X
              (This.Moving_Object.all,
               Get_X (This.Moving_Object.all)
               + This.Dx);
            Set_Y
              (This.Moving_Object.all,
               Get_Y (This.Moving_Object.all)
               + This.Dy);

         when Bouncing_Translation =>
            declare
               Dx : Length := This.X2 - This.X1;
               Dy : Length := This.Y2 - This.Y1;

               Step_X : Length;
            begin
               Step_X := Length (Length (Dx / Dy) * This.Linear_Speed);

               This.Current_Portion := This.Current_Portion
                 + Length (Step_X / Dx);

               if This.Current_Portion not in -1.0 .. 1.0 then
                  This.Linear_Speed := -This.Linear_Speed;
               end if;

               Set_X
                 (This.Moving_Object.all,
                  This.X1 + Length (Dx * This.Current_Portion));
               Set_Y
                 (This.Moving_Object.all,
                  This.Y1 + Length (Dy * This.Current_Portion));
            end;

      end case;
   end Move;

   ------------------------------
   -- Create_Circular_Movement --
   ------------------------------

   function Create_Circular_Movement
     (Around        : Physic_Object_Access;
      Linear_Speed  : Speed;
      Distance      : Length;
      Initial_Angle : Angle := 0.0) return Circular_Movement
   is
      Result : Circular_Movement;
   begin
      Result.Around := Around;
      Result.Linear_Speed := Linear_Speed;
      Result.Current_Angle := Initial_Angle;
      Result.Distance := Distance;

      return Result;
   end Create_Circular_Movement;

   ------------------------------
   -- Create_Elliptic_Movement --
   ------------------------------

   function Create_Elliptic_Movement
     (Around       : Physic_Object_Access;
      Linear_Speed : Speed;
      Min_Distance : Length;
      Max_Distance : Length;
      Initial_Angle : Angle := 0.0) return Elliptic_Movement
   is
      Result : Elliptic_Movement;
   begin
      Result.Around := Around;
      Result.Linear_Speed := Linear_Speed;
      Result.Current_Angle := Initial_Angle;
      Result.Distance_Min := Min_Distance;
      Result.Distance_Max := Max_Distance;

      return Result;
   end Create_Elliptic_Movement;

   ---------------------------------
   -- Create_Translation_Movement --
   ---------------------------------

   function Create_Translation_Movement
     (Linear_Speed : Speed;
      The_Angle    : Angle)
      return Translation_Movement
   is
   begin
      return Translation_Movement'
        (Kind => Translation,
         Linear_Speed => Linear_Speed,
         Dx => Length (Cos (The_Angle) * Linear_Speed),
         Dy => Length (Sin (The_Angle) * Linear_Speed),
         others => <>);
   end Create_Translation_Movement;

   ------------------------------------------
   -- Create_Bouncing_Translation_Movement --
   ------------------------------------------

   function Create_Bouncing_Translation_Movement
     (Linear_Speed     : Speed;
      X1, Y1, X2, Y2   : Length;
      Initial_Distance : Length)
      return Bouncing_Translation_Movement
   is
      Result : Bouncing_Translation_Movement;
   begin
      Result.Linear_Speed := Linear_Speed;
      Result.Current_Portion := 0.0 * m;
      Result.X1 := X1;
      Result.Y1 := Y1;
      Result.X2 := X2;
      Result.Y2 := Y2;

      return Result;
   end Create_Bouncing_Translation_Movement;

   --------------
   -- Move_All --
   --------------

   procedure Move_All (Board : in out Board_Type) is
      use Movement_List;
   begin
     for Movement of Board.Movements loop
         Move (Movement);
      end loop;

--        Movement_Cur : Movement_List.Cursor;
--     begin
--        Movement_Cur := Board.Movements.First;
--
--        while Movement_Cur /= Movement_List.No_Element loop
--           declare
--              Movement : Movement_Type := Element (Movement_Cur);
--           begin
--              Move (Movement);
--              Replace_Element (Board.Movements, Movement_Cur, Movement);
--           end;
--
--           Movement_Cur := Next (Movement_Cur);
--        end loop;
   end Move_All;

   ------------------
   -- Set_Movement --
   ------------------

   procedure Set_Movement
     (Board    : in out Board_Type;
      Object   : Physic_Object_Access;
      Movement : Movement_Type)
   is
      New_Movement : Movement_Type := Movement;
   begin
      New_Movement.Moving_Object := Object;

      Board.Movements.Append (New_Movement);
   end Set_Movement;

   --------------------
   -- Remvove_Object --
   --------------------

   procedure Remvove_Object
     (Board  : in out Board_Type;
      Object : Physic_Object_Access)
   is
      Movement_Cur     : Movement_List.Cursor;
      Movement_Garbage : Movement_List.Cursor;

      use Movement_List;
   begin
      Movement_Cur := Board.Movements.First;

      while Movement_Cur /= Movement_List.No_Element loop
         if Element (Movement_Cur).Moving_Object = Object then
            Movement_Garbage := Movement_Cur;
            Movement_Cur := Next (Movement_Cur);
            Delete (Board.Movements, Movement_Garbage);
         else
            Movement_Cur := Next (Movement_Cur);
         end if;
      end loop;

      Board.Objects.Schedule_To_Delete (Object);
   end Remvove_Object;

   ------------------------
   -- Compute_Collisions --
   ------------------------

   procedure Compute_Collisions
     (Board    : Board_Type;
      Listener : Collision_Listener'Class)
   is
   begin
      for I in Board.Objects.Iterate loop
         for J in Board.Objects.Iterate (Next (I)) loop
            declare
               Dx : Length := Get_X (Element (I).all)
                 - Get_X (Board.Objects.Element (J).all);
               Dy : Length := Get_Y (Element (I).all)
                 - Get_Y (Element (J).all);
               Dist_Min : Length :=
                 Get_Radius (Element (I).all)
                 + Get_Radius (Element (J).all);
            begin
               if Dx ** 2 + Dy ** 2 <= Dist_Min ** 2 then
                  Listener.Collision
                    (Element (I), Element (J));
               end if;
            end;
         end loop;
      end loop;
   end Compute_Collisions;

end Physics;
