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

private with Ada.Containers.Doubly_Linked_Lists;

with Invaders.Objects; use Invaders.Objects;
with Display.Basic; use Display.Basic;

package Invaders.Games is

   use Invaders_Physics;

   type Game_Record (<>) is limited private;

   function Create_Game return Game_Record;

   procedure Iterate (The_Game : access Game_Record);

   procedure Reference_Object
     (The_Game : access Game_Record; Object : Object_Access);

   type Object_Deleted_Listener is interface;

   type Object_Deleted_Listener_Access
     is access all Object_Deleted_Listener'Class;

   procedure Deleted
     (V : access Object_Deleted_Listener; Deleted : access Root_Object'Class)
   is abstract;

   procedure Register_Listener
     (The_Game : access Game_Record; Listener : Object_Deleted_Listener_Access);

   function Get_Score (The_Game : access Game_Record) return Natural;

   procedure Register_Movement
     (The_Game : access Game_Record;
      Object   : Object_Access;
      Movement : Movement_Type);

private

   package Objects_Container is new Ada.Containers.Doubly_Linked_Lists
     (Object_Access);

   package Listener_Container is new Ada.Containers.Doubly_Linked_Lists
     (Object_Deleted_Listener_Access);

   use Objects_Container;
   use Listener_Container;

   type Game_Record is record
      My_Board          : aliased Board_Type;
      Deleted_Listeners : Listener_Container.List;
      Score             : Natural := 0;
      Score_Shape       : Shape_Id;
   end record;

end Invaders.Games;
