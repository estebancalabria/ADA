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

   Game_Over : exception;

   ------------
   -- Object --
   ------------

   type Object is abstract tagged private;

   procedure Redraw (This : in out Object) is abstract;

   function Get_X (This : Object) return Float;

   procedure Set_X (This : in out Object; Value : Float);

   ------------
   -- Player --
   ------------

   type Player is new Object with private;

   overriding procedure Redraw (This : in out Player);

   type Player_Access is access all Player;

   ----------
   -- Game --
   ----------

   type Game_Record (<>) is private;

   function Create_Game return Game_Record;

   procedure Shoot (The_Game : in out Game_Record);

   procedure Create_Foe (The_Game : in out Game_Record);

   procedure Iterate (The_Game : in out Game_Record);

   function Get_Player (The_Game : Game_Record) return Player_Access;

private

   type Object is abstract tagged record
      X, Y    : Float;
      Graphic : Display.Basic.Shape_Id;
   end record;

   type Player is new Object with null record;

   type Foe is new Object with record
      Speed : Float := 0.0;
   end record;

   overriding procedure Redraw (This : in out Foe);

   type Ammo is new Object with record
      null;
   end record;

   overriding procedure Redraw (This : in out Ammo);

   type Ammo_Access is access all Ammo;
   type Foe_Access is access all Foe;

   type Foes_Array is array (Natural range <>) of Foe_Access;
   type Ammos_Array is array (Natural range <>) of Ammo_Access;

   type Game_Record is record
      Foes    : Foes_Array (1 .. 100);
      Ammos   : Ammos_Array (1 .. 100);
      Player  : Player_Access;
   end record;

end Invaders;
