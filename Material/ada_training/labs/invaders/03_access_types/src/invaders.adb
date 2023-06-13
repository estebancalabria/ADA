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

with Ada.Unchecked_Deallocation;

package body Invaders is

   procedure Free is new Ada.Unchecked_Deallocation (Object, Object_Access);

   function Create_Game return Game_Record is
   begin
      null;
   end Create_Game;

   function Get_X (This : Object) return Float is
   begin
      null;
   end Get_X;

   procedure Set_X (This : in out Object; Value : Float) is
   begin
      null;
   end Set_X;

   procedure Shoot (The_Game : in out Game_Record) is
   begin
      null;
   end Shoot;

   Seed : Generator;

   procedure Create_Foe (The_Game : in out Game_Record) is
   begin
      null;
   end Create_Foe;

   procedure Iterate (The_Game : in out Game_Record) is
   begin
      null;
   end Iterate;

   function Get_Player (The_Game : Game_Record) return Object_Access is
   begin
      null;
   end Get_Player;

   procedure Redraw (This : in out Object) is
   begin
      case This.Kind is
         null;
      end case;
   end Redraw;

end Invaders;
