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

with Invaders.Ammos;         use Invaders.Ammos;
with Invaders.Ammos.Bullets; use Invaders.Ammos.Bullets;
with Invaders.Games;         use Invaders.Games;

with System.Dim.Mks; use System.Dim.Mks;

package body Invaders.Foes.Shooters is

   function Compute_Radius (S : Shooter_Type'Class) return Length is
   begin
      return 5.0 * m + Length (S.Health);
   end Compute_Radius;

   function Create return Shooter_Type is
      Result : Shooter_Type;
   begin
      Result.Main_Shape := New_Circle (0.0, 0.0, 10.0, Magenta);
      Result.Sub_Shape_1 := New_Line (0.0, 0.0, 0.0, 0.0, Yellow);
      Result.Sub_Shape_2 := New_Line (0.0, 0.0, 0.0, 0.0, Yellow);

      return Result;
   end Create;

   procedure Redraw (V : access Shooter_Type) is
      Radius : constant Length := Compute_Radius (V.all);
   begin
      Set_X (V.Main_Shape, Float (V.X));
      Set_Y (V.Main_Shape, Float (V.Y));
      Set_Radius (V.Main_Shape, Float (Radius));

      Set_X (V.Sub_Shape_1, Float (V.X) - 2.0);
      Set_X2 (V.Sub_Shape_1, Float (V.X) - 2.0);

      Set_Y (V.Sub_Shape_1, Float (V.Y - Radius));
      Set_Y2 (V.Sub_Shape_1, Float (V.Y - Radius - 4.0 * m));

      Set_X (V.Sub_Shape_2, Float (V.X) + 2.0);
      Set_X2 (V.Sub_Shape_2, Float (V.X) + 2.0);

      Set_Y (V.Sub_Shape_2, Float (V.Y - Radius));
      Set_Y2 (V.Sub_Shape_2, Float (V.Y - Radius - 4.0 * m));
   end Redraw;

   procedure Iterate
     (V        : access Shooter_Type;
      The_Game : not null access Invaders.Games.Game_Record)
   is
   begin
      Move (Shooter_Type'Class (V.all), The_Game);

      if V.Last_Shot > 200 then
         declare
            Ammo : Object_Access := new Bullet_Type'(Create);
            Ammo_Rec : Bullet_Type renames Bullet_Type (Ammo.all);
         begin
            Ammo_Rec.X := V.X;
            Ammo_Rec.Y := V.Y;
            Ammo_Rec.Kills := Player;
            Ammo_Rec.Bullet_Angle := - System.Dim.Mks.Pi / 2.0;

            Reference_Object (The_Game, Ammo);

            V.Last_Shot := 0;
         end;
      end if;

      V.Last_Shot := V.Last_Shot + 1;

      V.Radius := Compute_Radius (V.all);
   end Iterate;

   procedure Delete
     (V        : access Shooter_Type;
      The_Game : not null access Invaders.Games.Game_Record)
   is
   begin
      Delete (V.Main_Shape);
      Delete (V.Sub_Shape_1);
      Delete (V.Sub_Shape_2);
   end Delete;

   procedure Collision_With
     (This : access Shooter_Type; Obj : access Root_Object'Class)
   is
   begin
      if Obj.all in Ammo_Type'Class
        and then Ammo_Type'Class (Obj.all).Kills /= Player
      then
         This.Health := This.Health - 1;

         if This.Health = 0 then
            This.To_Be_Deleted := True;
         end if;
      end if;
   end Collision_With;

   procedure Move
     (V        : in out Shooter_Type;
      The_Game : not null access Invaders.Games.Game_Record)
   is
   begin
      if V.X not in -100.0 .. 100.0 then
         V.Current_Speed := -V.Current_Speed;
      end if;

      V.X := V.X + V.Current_Speed * s;
   end Move;

   function Get_Points (V : Shooter_Type) return Natural is
   begin
      return 5;
   end Get_Points;


end Invaders.Foes.Shooters;
