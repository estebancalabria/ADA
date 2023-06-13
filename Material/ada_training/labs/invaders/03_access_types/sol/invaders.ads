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

   type Object_Kind is (Player, Foe, Ammo);

   type Object (<>) is private;

   type Object_Access is access all Object;

   function Get_X (This : Object) return Float;

   procedure Set_X (This : in out Object; Value : Float);

   type Game_Record (<>) is private;

   function Create_Game return Game_Record;

   procedure Shoot (The_Game : in out Game_Record);

   procedure Create_Foe (The_Game : in out Game_Record);

   procedure Iterate (The_Game : in out Game_Record);

   function Get_Player (The_Game : Game_Record) return Object_Access;

private

   type Object (Kind : Object_Kind) is record
      X, Y    : Float;
      Graphic : Display.Basic.Shape_Id;

      case Kind is
         when Foe =>
            Speed : Float := 0.0;

         when others =>
            null;
      end case;
   end record;

   type Object_Array is array (Natural range <>) of Object_Access;

   type Game_Record is record
      Foes    : Object_Array (1 .. 100);
      Ammos   : Object_Array (1 .. 100);
      Player  : Object_Access;
   end record;

   procedure Redraw (This : in out Object);

end Invaders;
