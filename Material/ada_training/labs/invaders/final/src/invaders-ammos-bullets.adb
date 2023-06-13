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

with Invaders.Players; use Invaders.Players;
with Invaders.Foes; use Invaders.Foes;

with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

with Invaders.Games; use Invaders.Games;

package body Invaders.Ammos.Bullets is

   ------------
   -- Create --
   ------------

   function Create return Bullet_Type is
      Result : Bullet_Type;
   begin
      Result.Main_Shape := New_Line (0.0, 0.0, 0.0, 0.0, Yellow);

      return Result;
   end Create;

   ------------
   -- Redraw --
   ------------

   procedure Redraw (V : access Bullet_Type) is
   begin
      Set_X (V.Main_Shape, Float (V.X));
      Set_Y (V.Main_Shape, Float (V.Y));
      Set_X2 (V.Main_Shape, Float (V.X) + Cos (Float (V.Bullet_Angle)) * 2.0);
      Set_Y2 (V.Main_Shape, Float (V.Y) + Sin (Float (V.Bullet_Angle)) * 2.0);

      case V.Kills is
         when Player =>
            Set_Color (V.Main_Shape, Red);
         when Enemies =>
            Set_Color (V.Main_Shape, Green);
         when Everybody =>
            Set_Color (V.Main_Shape, Yellow);
      end case;
   end Redraw;

   -------------
   -- Iterate --
   -------------

   procedure Iterate
     (V        : access Bullet_Type;
      The_Game : not null access Invaders.Games.Game_Record) is
   begin
      if not V.Initialized then
         V.Initialized := True;

         Invaders.Games.Register_Movement
           (The_Game,
            Object_Access (V),
            Invaders_Physics.Create_Translation_Movement
              (0.5 * m / s, V.Bullet_Angle));
      end if;

      if V.Y not in -100.0 .. 100.0
        or else V.X not in -100.0 .. 100.0
      then
         V.To_Be_Deleted := True;
      end if;

      V.Radius := 0.5 * m;
   end Iterate;

   ------------
   -- Delete --
   ------------

   procedure Delete
     (V        : access Bullet_Type;
      The_Game : not null access Invaders.Games.Game_Record)
   is
   begin
      Delete (V.Main_Shape);
   end Delete;

   --------------------
   -- Collision_With --
   --------------------

   procedure Collision_With
     (This : access Bullet_Type; Obj : access Root_Object'Class)
   is
   begin
      if Obj.all in Player_Type'Class and then This.Kills = Enemies then
         return;
      elsif Obj.all in Foe_Type'Class and then This.Kills = Player then
         return;
      end if;

      This.To_Be_Deleted := Obj.all not in Ammo_Type'Class;
   end Collision_With;

end Invaders.Ammos.Bullets;
