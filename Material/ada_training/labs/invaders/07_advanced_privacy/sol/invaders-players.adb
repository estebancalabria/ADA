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

package body Invaders.Players is

   function Create return Player_Type is
   begin
      return Result : Player_Type do
         Result.Main_Shape := New_Circle (0.0, -80.0, 10.0, Blue);
      end return;
   end Create;

   procedure Redraw (V : access Player_Type) is
   begin
      Set_X (V.Main_Shape, Get_X (V.all));
      Set_Y (V.Main_Shape, Get_Y (V.all));
   end Redraw;

   procedure Iterate
     (V        : access Player_Type;
      The_Game : not null access Invaders.Games.Game_Record)
   is
      Key : Key_Type;

      Lateral_Movement : constant := 1.0;
      Shoot_Command    : constant Character := ' ';
   begin
      Key := Current_Key_Press;

      if To_Special (Key) = KEY_LEFT then
         if Get_X (V.all) > -100.0 then
            Set_X (V.all, Get_X (V.all) - Lateral_Movement);
         end if;
      elsif To_Special (Key) = KEY_RIGHT then
         if Get_X (V.all) < 100.0 then
            Set_X (V.all, Get_X (V.all) + Lateral_Movement);
         end if;
      elsif To_Character (Key) = Shoot_Command and then V.Last_Shoot > 50 then
         V.Last_Shoot := 0;

         declare
            Ammo : constant Object_Access := new Bullet_Type'(Create);
            Ammo_Rec : Bullet_Type renames Bullet_Type (Ammo.all);
         begin
            Set_X (Ammo_Rec, Get_X (V.all));
            Set_Y (Ammo_Rec, Get_Y (V.all));
            Ammo_Rec.Friendly := True;
            Set_Speed (Ammo_Rec, 0.5);

            Reference_Object (The_Game, Ammo);
         end;
      end if;

      V.Last_Shoot := V.Last_Shoot + 1;
   end Iterate;

   function Get_Collision_Space
     (V : access Player_Type) return Collision_Space
   is
   begin
      return (Get_X (V.all), Get_Y (V.all), 10.0);
   end Get_Collision_Space;

   procedure Delete (V : access Player_Type) is
   begin
      Delete (V.Main_Shape);
   end Delete;

   procedure Collision_With
     (This : access Player_Type; Obj : access Root_Object'Class)
   is
   begin
      if Obj.all in Ammo_Type'Class
        and then Ammo_Type'Class (Obj.all).Friendly
      then
         return;
      end if;

      raise Game_Over;
   end Collision_With;

end Invaders.Players;
