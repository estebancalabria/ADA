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
limited with Invaders.Games;

package Invaders.Foes.Kamikazes is

   type Shape_Array is array (Integer range <>) of Shape_Id;

   type Kamikaze_Type is new Foe_Type with record
      Speed              : Float;
      Main_Shape         : Shape_Id;
      Sub_Shapes         : Shape_Array (1 .. 8);
      Angle              : Float := 0.0;
   end record;

   overriding
   function Create return Kamikaze_Type;

   overriding
   procedure Redraw (V : access Kamikaze_Type);

   overriding
   procedure Iterate
     (V        : access Kamikaze_Type;
      The_Game : not null access Invaders.Games.Game_Record);

   overriding
   function Get_Collision_Space
     (V : access Kamikaze_Type) return Collision_Space;

   overriding
   procedure Delete (V : access Kamikaze_Type);

   overriding
   procedure Collision_With
     (This : access Kamikaze_Type; Obj : access Root_Object'Class);

end Invaders.Foes.Kamikazes;
