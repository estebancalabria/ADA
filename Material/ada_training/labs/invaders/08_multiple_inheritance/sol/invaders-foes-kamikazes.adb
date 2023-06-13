-----------------------------------------------------------------------
--                              Ada Labs                             --
--                                                                   --
--                 Copyright (C) 2008-2013, AdaCore                  --
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

with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

with Invaders.Ammos; use Invaders.Ammos;
with Invaders.Players; use Invaders.Players;


package body Invaders.Foes.Kamikazes is

   Kamikaze_Radius : constant := 5.0;

   function Create return Kamikaze_Type is
      Result : Kamikaze_Type;
   begin
      Result.Main_Shape := New_Circle (0.0, 0.0, Kamikaze_Radius, Red);

      for J in 1 .. 8 loop
         Result.Sub_Shapes (J) := New_Line (0.0, 0.0, 1.0, 1.0, Yellow);
      end loop;

      Result.Speed := (Random (Random_Seed) * 0.01) + 0.01;

      if Random (Random_Seed) > 0.5 then
         Result.Speed := -Result.Speed;
      end if;

      return Result;
   end Create;

   procedure Redraw (V : access Kamikaze_Type) is
   begin
      Set_X (V.Main_Shape, V.X);
      Set_Y (V.Main_Shape, V.Y);

      for J in 1 .. 8 loop
         declare
            Angle : constant Float := 2.0 * Pi / 8.0 * Float (J) + V.Angle;
         begin
            Set_X
              (V.Sub_Shapes (J),
               V.X + Cos (Angle) * Kamikaze_Radius);
            Set_X2
              (V.Sub_Shapes (J),
               V.X + Cos (Angle) * (Kamikaze_Radius + 2.0));

            Set_Y
              (V.Sub_Shapes (J),
               V.Y + Sin (Angle) * Kamikaze_Radius);
            Set_Y2
              (V.Sub_Shapes (J),
               V.Y + Sin (Angle) * (Kamikaze_Radius + 2.0));
         end;
      end loop;
   end Redraw;

   procedure Iterate
     (V        : access Kamikaze_Type;
      The_Game : not null access Invaders.Games.Game_Record)
   is
      pragma Unreferenced (The_Game);
   begin
      V.Y := V.Y - 0.5;

      V.X := V.X + V.Speed;

      if V.X not in 100.0 .. 100.0 then
         V.Speed := -V.Speed;
      end if;

      if V.Y < -100.0 then
         V.To_Be_Deleted := True;
         V.Destruction_Reason := Died;
      end if;

      V.Angle := V.Angle + 0.01;
   end Iterate;

   function Get_Collision_Space
     (V : access Kamikaze_Type) return Collision_Space is
   begin
      return (V.X, V.Y, 5.0);
   end Get_Collision_Space;

   procedure Delete (V : access Kamikaze_Type) is
   begin
      Delete (V.Main_Shape);

      for J in 1 .. 8 loop
         Delete (V.Sub_Shapes (J));
      end loop;
   end Delete;

   procedure Collision_With
     (This : access Kamikaze_Type; Obj : access Root_Object'Class) is
   begin
      if Obj.all in Ammo_Type'Class
        and then Ammo_Type (Obj.all).Friendly
      then
         This.To_Be_Deleted := True;
         This.Destruction_Reason := Killed;
      elsif Obj.all in Player_Type'Class then
         This.To_Be_Deleted := True;
         This.Destruction_Reason := Died;
      end if;
   end Collision_With;

   function Get_Points (V : Kamikaze_Type) return Natural is
   begin
      if V.Destruction_Reason = Died then
         return 0;
      else
         return 1;
      end if;
   end Get_Points;

   function Get_Reason_Of_Destruction
     (V : Kamikaze_Type) return Destruction_Kind is
   begin
      return V.Destruction_Reason;
   end Get_Reason_Of_Destruction;

end Invaders.Foes.Kamikazes;
