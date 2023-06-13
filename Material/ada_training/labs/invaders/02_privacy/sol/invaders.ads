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

with Display.Basic;

package Invaders is

   type Player_Type is private;

   type Foe_Type is private;

   type Ammo_Type is private;

   function Collision (Foe : Foe_Type; Ammo : Ammo_Type) return Boolean;

   procedure Refresh (Player : in out Player_Type);

   procedure Refresh (Foe : in out Foe_Type);

   procedure Refresh (Ammo : in out Ammo_Type);

   type Direction is (Left, Right);

   procedure Move_Player (Player : in out Player_Type; Dir : Direction);

   procedure Move_Ammo (Ammo : in out Ammo_Type);

   procedure Move_Foe (Foe : in out Foe_Type);

   procedure Shoot (Player : Player_Type; Ammo : in out Ammo_Type);

   procedure Initialize (Player : in out Player_Type; X, Y : Float);

   procedure Initialize (Foe : in out Foe_Type; X : Float);

   procedure Initialize (Ammo : in out Ammo_Type);

   function Passed (Foe : Foe_Type) return Boolean;

   procedure Reset (Foe : in out Foe_Type; X : Float);

   procedure Reset (Ammo : in out Ammo_Type);

private

   type Object is record
      X, Y    : Float;
      Graphic : Display.Basic.Shape_Id;
   end record;

   type Player_Type is new Object;

   type Foe_Type is new Object;

   type Ammo_Type is new Object;

end Invaders;
