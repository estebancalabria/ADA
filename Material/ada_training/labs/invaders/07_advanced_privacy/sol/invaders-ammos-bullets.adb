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

with Invaders.Players; use Invaders.Players;
with Invaders.Foes; use Invaders.Foes;

package body Invaders.Ammos.Bullets is

   function Create return Bullet_Type is

   begin
      return Result : Bullet_Type do
         Result.Main_Shape := New_Line (0.0, 0.0, 0.0, 0.0, Yellow);
      end return;
   end Create;

   procedure Redraw (V : access Bullet_Type) is
   begin
      Set_X (V.Main_Shape, Get_X (V.all));
      Set_Y (V.Main_Shape, Get_Y (V.all));
      Set_X2 (V.Main_Shape, Get_X (V.all));
      Set_Y2 (V.Main_Shape, Get_Y (V.all) + 2.0);
   end Redraw;

   procedure Iterate
     (V        : access Bullet_Type;
      The_Game : not null access Invaders.Games.Game_Record) is
   begin
      Set_Y (V.all, Get_Y (V.all) + V.Speed);

      if Get_Y (V.all) not in -100.0 .. 100.0 then
         Schedule_For_Deletion (V.all);
      end if;
   end Iterate;

   function Get_Collision_Space
     (V : access Bullet_Type) return Collision_Space
   is
   begin
      return (Get_X (V.all) + 0.5, Get_Y (V.all) + 0.5, 0.5);
   end Get_Collision_Space;

   procedure Delete (V : access Bullet_Type) is
   begin
      Delete (V.Main_Shape);
   end Delete;

   procedure Collision_With
     (This : access Bullet_Type; Obj : access Root_Object'Class)
   is
   begin
      if Obj.all in Player_Type'Class and then This.Friendly then
         return;
      elsif Obj.all in Foe_Type'Class and then not This.Friendly then
         return;
      end if;

      if Obj.all not in Ammo_Type'Class then
         Schedule_For_Deletion (This.all);
      end if;
   end Collision_With;

   procedure Set_Speed (This : in out Bullet_Type; Val : Float) is
   begin
      This.Speed := Val;
   end Set_Speed;

end Invaders.Ammos.Bullets;
