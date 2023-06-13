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

limited with Invaders.Games;

package Invaders.Objects is

   type Collision_Space is record
      X, Y, Radius : Float;
   end record;

   type Root_Object is abstract tagged limited private;

   type Object_Access is access all Root_Object'Class;

   function Create return Root_Object is abstract;

   procedure Redraw (V : access Root_Object) is abstract;

   procedure Iterate
     (V        : access Root_Object;
      The_Game : not null access Invaders.Games.Game_Record) is abstract;

   function Get_Collision_Space
     (V : access Root_Object) return Collision_Space is abstract;

   procedure Delete (V : access Root_Object) is abstract;

   procedure Collision_With
     (This : access Root_Object; Obj : access Root_Object'Class) is abstract;

   function Collision (Left, Right : access Root_Object'Class) return Boolean;

   procedure Set_X (V : in out Root_Object; Val : Float);

   procedure Set_Y (V : in out Root_Object; Val : Float);

   function Get_X (V : Root_Object) return Float;

   function Get_Y (V : Root_Object) return Float;

   procedure Schedule_For_Deletion (V : in out Root_Object);

   function To_Be_Deleted (V : Root_Object) return Boolean;

private

   type Root_Object is abstract tagged limited record
      X, Y : Float := 0.0;
      To_Be_Deleted : Boolean := False;
   end record;


end Invaders.Objects;
