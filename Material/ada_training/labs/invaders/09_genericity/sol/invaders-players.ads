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

with Invaders.Objects; use Invaders.Objects;
with Display;          use Display;
with Display.Basic;    use Display.Basic;
with Invaders.Games;   use Invaders.Games;

package Invaders.Players is

   type Player_Type is new Root_Object and Object_Deleted_Listener with record
      Main_Shape : Shape_Id;
      Shield_Shape : Shape_Id;
      Last_Shoot : Integer := 0;
      Shield_Width : Float := 0.0;
   end record;

   overriding
   function Create return Player_Type;

   overriding
   procedure Redraw (V : access Player_Type);

   overriding
   procedure Iterate
     (V        : access Player_Type;
      The_Game : not null access Invaders.Games.Game_Record);

   overriding
   procedure Delete
     (V        : access Player_Type;
      The_Game : not null access Invaders.Games.Game_Record);

   overriding
   procedure Collision_With
     (This : access Player_Type; Obj : access Root_Object'Class);

   overriding
   procedure Deleted
     (V : access Player_Type; Deleted : access Root_Object'Class);

end Invaders.Players;
