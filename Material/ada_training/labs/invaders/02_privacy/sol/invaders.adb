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

with Display;       use Display;
with Display.Basic; use Display.Basic;

package body Invaders is

   function Collision (Foe : Foe_Type; Ammo : Ammo_Type) return Boolean is
      Dx, Dy : Float;
      Min_Distance : Float;
   begin
      Dx := Foe.X - Ammo.X;
      Dy := Foe.Y - Ammo.Y;
      Min_Distance := Get_Radius (Foe.Graphic);

      return Dx * Dx + Dy * Dy < Min_Distance * Min_Distance;
   end Collision;

   procedure Refresh (Player : in out Player_Type) is
   begin
      Set_X (Player.Graphic, Player.X);
      Set_Y (Player.Graphic, Player.Y);
   end Refresh;

   procedure Refresh (Foe : in out Foe_Type) is
   begin
      Set_X (Foe.Graphic, Foe.X);
      Set_Y (Foe.Graphic, Foe.Y);
   end Refresh;


   procedure Refresh (Ammo : in out Ammo_Type) is
   begin
      Set_X (Ammo.Graphic, Ammo.X);
      Set_Y (Ammo.Graphic, Ammo.Y);
      Set_X2 (Ammo.Graphic, Ammo.X);
      Set_Y2 (Ammo.Graphic, Ammo.Y - 2.0);
   end Refresh;


   procedure Move_Player (Player : in out Player_Type; Dir : Direction) is
      Lateral_Movement : constant := 1.0;
   begin
      case Dir is
         when Left =>
            Player.X := Player.X - Lateral_Movement;

         when Right =>
            Player.X := Player.X + Lateral_Movement;
      end case;
   end Move_Player;

   procedure Move_Ammo (Ammo : in out Ammo_Type) is
   begin
      Ammo.Y := Ammo.Y + 0.5;
   end Move_Ammo;

   procedure Move_Foe (Foe : in out Foe_Type) is
   begin
      Foe.Y := Foe.Y - 0.5;
   end Move_Foe;

   procedure Shoot (Player : Player_Type; Ammo : in out Ammo_Type) is
   begin
      Ammo.X := Player.X;
      Ammo.Y := Player.Y;
   end Shoot;

   procedure Initialize (Player : in out Player_Type; X, Y : Float) is
   begin
      Player.X := X;
      Player.Y := Y;
      Player.Graphic := New_Circle (X, Y, 10.0, Blue);
   end Initialize;

   procedure Initialize (Foe : in out Foe_Type; X : Float) is
   begin
      Foe.X := X;
      Foe.Y := 100.0;
      Foe.Graphic := New_Circle (Foe.X, Foe.Y, 5.0, Red);
   end Initialize;

   procedure Initialize (Ammo : in out Ammo_Type) is
   begin
      Ammo.X := 1000.0;
      Ammo.Y := 0.0;
      Ammo.Graphic := New_Line (Ammo.X, Ammo.Y, Ammo.X, Ammo.Y - 2.0, Yellow);
   end Initialize;

   function Passed (Foe : Foe_Type) return Boolean is
   begin
      return Foe.Y < -70.0;
   end Passed;

   procedure Reset (Foe : in out Foe_Type; X : Float) is
   begin
      Foe.X := X;
      Foe.Y := 100.0;
   end Reset;

   procedure Reset (Ammo : in out Ammo_Type) is
   begin
      Ammo.X := 1000.0;
   end Reset;

end Invaders;
