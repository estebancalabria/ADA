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

with Display;       use Display;
with Display.Basic; use Display.Basic;
limited with Invaders.Games;
with Invaders.Objects.Extensions; use Invaders.Objects.Extensions;

package Invaders.Foes.Shooters is

   type Shooter_Type is new Foe_Type and Score_Provider with record
      Speed       : Float := 0.0;
      Main_Shape  : Shape_Id;
      Sub_Shape_1 : Shape_Id;
      Sub_Shape_2 : Shape_Id;
      Health      : Integer := 5;
      Last_Shot   : Integer := 0;
   end record;

   overriding
   function Create return Shooter_Type;

   overriding
   procedure Redraw (V : access Shooter_Type);

   overriding
   procedure Iterate
     (V        : access Shooter_Type;
      The_Game : not null access Invaders.Games.Game_Record);

   overriding
   function Get_Collision_Space
     (V : access Shooter_Type) return Collision_Space;

   overriding
   procedure Delete (V : access Shooter_Type);

   overriding
   procedure Collision_With
     (This : access Shooter_Type; Obj : access Root_Object'Class);

   not overriding
   procedure Move
     (V        : in out Shooter_Type;
      The_Game : not null access Invaders.Games.Game_Record);

   overriding
   function Get_Points (V : Shooter_Type) return Natural;

end Invaders.Foes.Shooters;
