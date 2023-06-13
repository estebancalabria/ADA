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

with Invaders.Ammos.Bullets; use Invaders.Ammos.Bullets;

with Invaders.Games; use Invaders.Games;

package body Invaders.Foes.Kamikazes is

   Kamikaze_Radius : constant := 5.0;

   function Create return Kamikaze_Type is
      Result : Kamikaze_Type;
      Rnd    : constant Float := Random (Random_Seed);
   begin
      Result.Main_Shape := New_Circle (0.0, 0.0, Kamikaze_Radius, Red);

      Result.Sub_Shapes_Size := 0;

      for J in 0 .. 8 loop
         if Rnd > 1.0 / Float (J + 1) then
            Result.Sub_Shapes_Size := J;

            exit;
         end if;
      end loop;

      for J in 1 .. Result.Sub_Shapes_Size loop
         Result.Sub_Shapes (J) := New_Line (0.0, 0.0, 1.0, 1.0, Yellow);
      end loop;

      Result.Speed := (Random (Random_Seed) * 0.2);

      if Random (Random_Seed) > 0.5 then
         Result.Speed := -Result.Speed;
      end if;

      Result.Angle_Speed := (Random (Random_Seed) * 0.02) + 0.01;

      if Random (Random_Seed) > 0.5 then
         Result.Angle_Speed := -Result.Angle_Speed;
      end if;

      Result.Angle := Random (Random_Seed) * 2.0 * Pi;
      Result.Radius := 5.0;

      return Result;
   end Create;

   procedure Redraw (V : access Kamikaze_Type) is
   begin
      Set_X (V.Main_Shape, V.X);
      Set_Y (V.Main_Shape, V.Y);

      for J in 1 .. V.Sub_Shapes_Size loop
         declare
            Angle : constant Float :=
              2.0 * Pi / Float (V.Sub_Shapes_Size) * Float (J) + V.Angle;
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

      if V.X not in -100.0 .. 100.0 then
         V.Speed := -V.Speed;
      end if;

      if V.Y < -100.0 then
         V.To_Be_Deleted := True;
         V.Destruction_Reason := Died;
      end if;

      V.Angle := V.Angle + V.Angle_Speed;
   end Iterate;

   procedure Delete
     (V        : access Kamikaze_Type;
      The_Game : not null access Invaders.Games.Game_Record)
   is
   begin
      Delete (V.Main_Shape);

      for J in 1 .. V.Sub_Shapes_Size loop
         declare
            Angle : constant Float :=
              2.0 * Pi / Float (V.Sub_Shapes_Size) * Float (J) + V.Angle;
            New_Bullet : constant Object_Access := new Bullet_Type'(Create);
            Bullet : Bullet_Type'Class renames
              Bullet_Type'Class (New_Bullet.all);
         begin
            Bullet.X := V.X + Cos (Angle) * Kamikaze_Radius;
            Bullet.Y := V.Y + Sin (Angle) * Kamikaze_Radius;

            Bullet.Angle := Angle;

            Bullet.Kills := Everybody;

            Reference_Object (The_Game, New_Bullet);

            Delete (V.Sub_Shapes (J));
         end;
      end loop;
   end Delete;

   procedure Collision_With
     (This : access Kamikaze_Type; Obj : access Root_Object'Class) is
   begin
      if Obj.all in Ammo_Type'Class
        and then Ammo_Type (Obj.all).Kills /= Player
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
         return V.Sub_Shapes_Size + 1;
      end if;
   end Get_Points;

   function Get_Reason_Of_Destruction
     (V : Kamikaze_Type) return Destruction_Kind is
   begin
      return V.Destruction_Reason;
   end Get_Reason_Of_Destruction;

end Invaders.Foes.Kamikazes;
