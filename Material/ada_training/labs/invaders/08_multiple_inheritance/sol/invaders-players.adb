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


with Invaders.Foes; use Invaders.Foes;

with Invaders.Objects.Extensions; use Invaders.Objects.Extensions;

package body Invaders.Players is

   function Create return Player_Type is
      Result : Player_Type;
   begin
      Result.Main_Shape := New_Circle (0.0, -80.0, 8.0, Blue);
      Result.Shield_Shape := New_Torus (0.0, -80.0, 1.0, 12.0, Green);
      Result.Shield_Width := 2.0;
      return Result;
   end Create;

   procedure Redraw (V : access Player_Type) is
   begin
      Set_X (V.Main_Shape, V.X);
      Set_Y (V.Main_Shape, V.Y);

      Set_X (V.Shield_Shape, V.X);
      Set_Y (V.Shield_Shape, V.Y);
      Set_Inner_Radius (V.Shield_Shape, V.Shield_Width / 2.0);
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
         if V.X > -100.0 then
            V.X := V.X - Lateral_Movement;
         end if;
      elsif To_Special (Key) = KEY_RIGHT then
         if V.X < 100.0 then
            V.X := V.X + Lateral_Movement;
         end if;
      elsif To_Character (Key) = Shoot_Command and then V.Last_Shoot > 50 then
         V.Last_Shoot := 0;

         declare
            Ammo : constant Object_Access := new Bullet_Type'(Create);
            Ammo_Rec : Bullet_Type renames Bullet_Type (Ammo.all);
         begin
            Ammo_Rec.X := V.X;
            Ammo_Rec.Y := V.Y + 5.0;
            Ammo_Rec.Friendly := True;
            Ammo_Rec.Speed := 0.5;

            Reference_Object (The_Game, Ammo);
         end;
      end if;

      V.Last_Shoot := V.Last_Shoot + 1;
   end Iterate;

   function Get_Collision_Space
     (V : access Player_Type) return Collision_Space
   is
   begin
      if V.Shield_Width < 1.0 then
         return (V.X, V.Y, 8.0);
      else
         return (V.X, V.Y, 12.0 + Get_Inner_Radius (V.Shield_Shape));
      end if;
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

      if This.Shield_Width >= 1.0 then
         This.Shield_Width := This.Shield_Width - 1.0;
      else
         raise Game_Over;
      end if;
   end Collision_With;

   procedure Deleted
     (V : access Player_Type; Deleted : access Root_Object'Class) is
   begin
      if Deleted.all in Foe_Type'Class
        and then
          (Deleted.all not in Destructed_Details'Class
           or else Destructed_Details'Class
             (Deleted.all).Get_Reason_Of_Destruction = Killed)
        and then V.Shield_Width < 10.0
      then
         V.Shield_Width := V.Shield_Width + 0.2;
      end if;
   end Deleted;

end Invaders.Players;
