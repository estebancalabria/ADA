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

with Invaders.Ammos; use Invaders.Ammos;
with Invaders.Ammos.Bullets; use Invaders.Ammos.Bullets;
with Invaders.Games; use Invaders.Games;

package body Invaders.Foes.Shooters is

   function Compute_Radius (S : Shooter_Type'Class) return Float is
   begin
      return 5.0 + Float (S.Health);
   end Compute_Radius;

   function Create return Shooter_Type is
   begin
      return Result : Shooter_Type do
         Result.Main_Shape := New_Circle (0.0, 0.0, 10.0, Magenta);
         Result.Sub_Shape_1 := New_Line (0.0, 0.0, 0.0, 0.0, Yellow);
         Result.Sub_Shape_2 := New_Line (0.0, 0.0, 0.0, 0.0, Yellow);
      end return;
   end Create;

   procedure Redraw (V : access Shooter_Type) is
      Radius : constant Float := Compute_Radius (V.all);
   begin
      Set_X (V.Main_Shape, Get_X (V.all));
      Set_Y (V.Main_Shape, Get_Y (V.all));
      Set_Radius (V.Main_Shape, Radius);

      Set_X (V.Sub_Shape_1, Get_X (V.all) - 2.0);
      Set_X2 (V.Sub_Shape_1, Get_X (V.all) - 2.0);

      Set_Y (V.Sub_Shape_1, Get_Y (V.all) - Radius);
      Set_Y2 (V.Sub_Shape_1, Get_Y (V.all) - Radius - 4.0);

      Set_X (V.Sub_Shape_2, Get_X (V.all) + 2.0);
      Set_X2 (V.Sub_Shape_2, Get_X (V.all) + 2.0);

      Set_Y (V.Sub_Shape_2, Get_Y (V.all) - Radius);
      Set_Y2 (V.Sub_Shape_2, Get_Y (V.all) - Radius - 4.0);
   end Redraw;

   procedure Iterate
     (V        : access Shooter_Type;
      The_Game : not null access Invaders.Games.Game_Record)
   is
   begin
      Move (Shooter_Type'Class (V.all), The_Game);

      if V.Last_Shot > 200 then
         declare
            Ammo : constant Object_Access := new Bullet_Type'(Create);
            Ammo_Rec : Bullet_Type renames Bullet_Type (Ammo.all);
         begin
            Set_X (Ammo_Rec, Get_X (V.all));
            Set_Y (Ammo_Rec, Get_Y (V.all));
            Ammo_Rec.Friendly := False;
            Set_Speed (Ammo_Rec, -0.5);

            Reference_Object (The_Game, Ammo);

            V.Last_Shot := 0;
         end;
      end if;

      V.Last_Shot := V.Last_Shot + 1;
   end Iterate;

   function Get_Collision_Space
     (V : access Shooter_Type) return Collision_Space is
   begin
      return (Get_X (V.all), Get_Y (V.all), Compute_Radius (V.all));
   end Get_Collision_Space;

   procedure Delete (V : access Shooter_Type) is
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
        and then Ammo_Type'Class (Obj.all).Friendly
      then
         This.Health := This.Health - 1;

         if This.Health = 0 then
            Schedule_For_Deletion (This.all);
         end if;
      end if;
   end Collision_With;

   procedure Move
     (V        : in out Shooter_Type;
      The_Game : not null access Invaders.Games.Game_Record)
   is
   begin
      if Get_X (V) not in -100.0 .. 100.0 then
         V.Speed := -V.Speed;
      end if;

      Set_X (V, Get_X (V) + V.Speed);
   end Move;

   procedure Set_Speed
     (V : in out Shooter_Type; Speed : Float) is
   begin
      V.Speed := Speed;
   end Set_Speed;

   function Get_Speed (V : Shooter_Type) return Float
   is
   begin
      return V.Speed;
   end Get_Speed;

   procedure Set_Color (V : in out Shooter_Type; Color : Color_Type) is
   begin
      Set_Color (V.Main_Shape, Color);
   end Set_Color;

end Invaders.Foes.Shooters;
