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
with System.Dim.Mks; use System.Dim.Mks;

package Invaders.Ammos.Bullets is

   type Bullet_Type is new Ammo_Type with record
      Main_Shape   : Shape_Id;
      Bullet_Angle : Angle;
      Initialized  : Boolean := False;
   end record;

   overriding
   function Create return Bullet_Type;

   overriding
   procedure Redraw (V : access Bullet_Type);

   overriding
   procedure Iterate
     (V        : access Bullet_Type;
      The_Game : not null access Invaders.Games.Game_Record);

   overriding
   procedure Delete
     (V        : access Bullet_Type;
      The_Game : not null access Invaders.Games.Game_Record);

   overriding
   procedure Collision_With
     (This : access Bullet_Type; Obj : access Root_Object'Class);

end Invaders.Ammos.Bullets;
