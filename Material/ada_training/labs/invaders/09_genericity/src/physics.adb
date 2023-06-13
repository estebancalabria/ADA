-----------------------------------------------------------------------
--                              Ada Labs                             --
--                                                                   --
--                 Copyright (C) 2008-2009, AdaCore                  --
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

with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Physics is

   procedure Move (This : in out Movement_Type) is
      Speed : Coordinate_Type;
   begin
      case This.Kind is
         when Circular =>
            Speed := This.Linear_Speed / This.Distance;
            This.Current_Angle := This.Current_Angle + Speed;
            This.Moving_Object.X :=
               This.Around.X
               + Coordinate_Type (Cos (Float (This.Current_Angle)))
               * This.Distance;
            This.Moving_Object.Y :=
              This.Around.X
               + Coordinate_Type (Sin (Float (This.Current_Angle)))
               * This.Distance;
         when Elliptic =>
            declare
               Current_X : Coordinate_Type :=
                 Coordinate_Type (Cos (Float (This.Current_Angle)))
               * This.Distance_Min;
               Current_Y : Coordinate_Type :=
                 Coordinate_Type (Sin (Float (This.Current_Angle)))
               * This.Distance_Max;
               Current_Distance : Coordinate_Type := Coordinate_Type
                 (Sqrt (Float (Current_X ** 2 + Current_Y ** 2)));
            begin
               Speed := This.Linear_Speed / Current_Distance;
               This.Current_Angle := This.Current_Angle + Speed;

               This.Moving_Object.X :=
                 This.Around.X
                  + Coordinate_Type (Cos (Float (This.Current_Angle)))
                  * This.Distance_Min;
               This.Moving_Object.Y :=
                 This.Around.Y
                  + Coordinate_Type (Sin (Float (This.Current_Angle)))
                  * This.Distance_Max;
            end;

         when Translation =>
            This.Moving_Object.X :=
               This.Moving_Object.X
               + This.Dx;
            This.Moving_Object.Y :=
              This.Moving_Object.Y
                + This.Dy;

         when Bouncing_Translation =>
            declare
               Dx : Coordinate_Type := This.X2 - This.X1;
               Dy : Coordinate_Type := This.Y2 - This.Y1;

               Step_X : Coordinate_Type;
            begin
               Step_X := Dx / Dy * This.Linear_Speed;

               This.Current_Portion := This.Current_Portion + Step_X / Dx;

               if This.Current_Portion not in -1.0 .. 1.0 then
                  This.Linear_Speed := -This.Linear_Speed;
               end if;

               This.Moving_Object.X :=
                  This.X1 + Dx * This.Current_Portion;
               This.Moving_Object.Y :=
                  This.Y1 + Dy * This.Current_Portion;
            end;

      end case;
   end Move;

   function Create_Circular_Movement
     (Around        : Object_Access;
      Linear_Speed  : Coordinate_Type;
      Distance      : Positive_Coordinate_Type;
      Initial_Angle : Coordinate_Type := 0.0) return Circular_Movement
   is
      Result : Circular_Movement;
   begin
      Result.Around := Around;
      Result.Linear_Speed := Linear_Speed;
      Result.Current_Angle := Initial_Angle;
      Result.Distance := Distance;

      return Result;
   end Create_Circular_Movement;

   function Create_Elliptic_Movement
     (Around       : Object_Access;
      Linear_Speed : Coordinate_Type;
      Min_Distance : Positive_Coordinate_Type;
      Max_Distance : Positive_Coordinate_Type;
      Initial_Angle : Coordinate_Type := 0.0) return Elliptic_Movement
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

   function Create_Translation_Movement
     (Linear_Speed : Coordinate_Type;
      Angle : Coordinate_Type)
      return Translation_Movement
   is
   begin
      return Translation_Movement'
        (Kind => Translation,
         Linear_Speed => Linear_Speed,
         Dx => Coordinate_Type (Cos (Float (Angle)))
         * Linear_Speed,
         Dy => Coordinate_Type (Sin (Float (Angle)))
         * Linear_Speed,
         others => <>);
   end Create_Translation_Movement;

   function Create_Bouncing_Translation_Movement
     (Linear_Speed     : Coordinate_Type;
      X1, Y1, X2, Y2   : Coordinate_Type;
      Initial_Distance : Positive_Coordinate_Type)
      return Bouncing_Translation_Movement
   is
      Result : Bouncing_Translation_Movement;
   begin
      Result.Linear_Speed := Linear_Speed;
      Result.Current_Portion := 0.0;
      Result.X1 := X1;
      Result.Y1 := Y1;
      Result.X2 := X2;
      Result.Y2 := Y2;

      return Result;
   end Create_Bouncing_Translation_Movement;

   procedure Move_All (Board : in out Board_Type) is
      use Movement_List;

      Movement_Cur : Movement_List.Cursor;
   begin
      Movement_Cur := Board.Movements.First;

      while Movement_Cur /= Movement_List.No_Element loop
         declare
            Movement : Movement_Type := Element (Movement_Cur);
         begin
            Move (Movement);
            Replace_Element (Board.Movements, Movement_Cur, Movement);
         end;

         Movement_Cur := Next (Movement_Cur);
      end loop;
   end Move_All;

   procedure Register_Object
     (Board : in out Board_Type; Object : Object_Access) is
   begin
      Board.Objects.Append (Object);
   end Register_Object;

   procedure Set_Movement
     (Board    : in out Board_Type;
      Object   : Object_Access;
      Movement : Movement_Type)
   is
      New_Movement : Movement_Type := Movement;
   begin
      New_Movement.Moving_Object := Object;

      Board.Movements.Append (New_Movement);
   end Set_Movement;

   procedure Remvove_Object
     (Board  : in out Board_Type;
      Object : Object_Access)
   is
      Movement_Cur     : Movement_List.Cursor;
      Movement_Garbage : Movement_List.Cursor;

      Object_Cur     : Object_List.Cursor;
      Object_Garbage : Object_List.Cursor;
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

      Object_Cur := Board.Objects.First;

      while Object_Cur /= Object_List.No_Element loop
         if Element (Object_Cur) = Object then
            Object_Garbage := Object_Cur;
            Object_Cur := Next (Object_Cur);
            Delete (Board.Objects, Object_Garbage);
         else
            Object_Cur := Next (Object_Cur);
         end if;
      end loop;
   end Remvove_Object;

   procedure Compute_Collisions
     (Board    : Board_Type;
      Listener : Collision_Listener'Class)
   is
      Object_Cur_1, Object_Cur_2 : Object_List.Cursor;
   begin
      Object_Cur_1 := Board.Objects.First;

      while Object_Cur_1 /= Object_List.No_Element loop
         Object_Cur_2 := Next (Object_Cur_1);

         while Object_Cur_2 /= Object_List.No_Element loop
            declare
               Dx : Coordinate_Type := Element (Object_Cur_1).X
                 - Element (Object_Cur_2).X;
               Dy : Coordinate_Type := Element (Object_Cur_1).Y
                 - Element (Object_Cur_2).Y;
               Dist_Min : Coordinate_Type :=
                 Element (Object_Cur_1).Radius
                 + Element (Object_Cur_2).Radius;
            begin
               if Dx ** 2 + Dy ** 2 <= Dist_Min ** 2 then
                  Listener.Collision
                    (Element (Object_Cur_1), Element (Object_Cur_2));
               end if;
            end;

            Object_Cur_2 := Next (Object_Cur_2);
         end loop;

         Object_Cur_1 := Next (Object_Cur_1);
      end loop;
   end Compute_Collisions;

   function First (Board : Board_Type) return Iterator is
   begin
      return (Inner => Board.Objects.First);
   end First;

   function Next (It : Iterator) return Iterator is
   begin
      return (Inner => Next (It.Inner));
   end Next;

   function At_End (It : Iterator) return Boolean is
   begin
      return It.Inner = Object_List.No_Element;
   end At_End;

   function Element (It : Iterator) return Object_Access is
   begin
      return Element (It.Inner);
   end Element;

end Physics;
