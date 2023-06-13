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

limited with Invaders.Games;

with Physics;
with System.Dim.Mks; use System.Dim.Mks;

package Invaders.Objects is

   type Root_Object is abstract tagged record
      --  These data are used to compute collision between objects
      X, Y   : Length := 0.0 * m;
      Radius : Length := 0.0 * m;

      To_Be_Deleted : Boolean := False;
   end record;

   type Object_Access is access all Root_Object'Class;

   function Create return Root_Object is abstract;

   procedure Redraw (V : access Root_Object) is abstract;

   procedure Iterate
     (V        : access Root_Object;
      The_Game : not null access Invaders.Games.Game_Record) is abstract;

   procedure Delete
     (V        : access Root_Object;
      The_Game : not null access Invaders.Games.Game_Record) is abstract;

   procedure Collision_With
     (This : access Root_Object; Obj : access Root_Object'Class) is abstract;

   function Get_X (V : Root_Object) return Length;

   function Get_Y (V : Root_Object) return Length;

   function Get_Radius (V : Root_Object) return Length;

   procedure Set_X (V : in out Root_Object; Value : Length);

   procedure Set_Y (V : in out Root_Object; Value : Length);

   procedure Free (V : in out Root_Object) is null;

   package Invaders_Physics is new Physics
     (Physic_Object        => Root_Object,
      Physic_Object_Access => Object_Access,
      Get_X                => Get_X,
      Get_Y                => Get_Y,
      Get_Radius           => Get_Radius,
      Set_X                => Set_X,
      Set_Y                => Set_Y,
      Free                 => Free);

end Invaders.Objects;
