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

private with Ada.Containers.Doubly_Linked_Lists;
private with Ada.Containers.Indefinite_Doubly_Linked_Lists;

package Physics is

   type Coordinate_Type is digits 8;

   type Object_Type is record
      X, Y ,Radius : Coordinate_Type;
   end record;

   type Object_Access is access all Object_Type;

   subtype Positive_Coordinate_Type
     is Coordinate_Type range 0.0 .. Coordinate_Type'Last;

   type Board_Type is limited private;

   type Movement_Kind is
     (Circular, Elliptic, Translation, Bouncing_Translation);

   type Movement_Type (Kind : Movement_Kind) is private;

   subtype Circular_Movement is Movement_Type (Circular);
   subtype Elliptic_Movement is Movement_Type (Elliptic);
   subtype Translation_Movement is Movement_Type (Translation);
   subtype Bouncing_Translation_Movement is
     Movement_Type (Bouncing_Translation);

   function Create_Circular_Movement
     (Around        : Object_Access;
      Linear_Speed  : Coordinate_Type;
      Distance      : Positive_Coordinate_Type;
      Initial_Angle : Coordinate_Type := 0.0) return Circular_Movement;

   function Create_Elliptic_Movement
     (Around       : Object_Access;
      Linear_Speed : Coordinate_Type;
      Min_Distance : Positive_Coordinate_Type;
      Max_Distance : Positive_Coordinate_Type;
      Initial_Angle : Coordinate_Type := 0.0) return Elliptic_Movement;

   function Create_Translation_Movement
     (Linear_Speed : Coordinate_Type;
      Angle        : Coordinate_Type)
      return Translation_Movement;

   function Create_Bouncing_Translation_Movement
     (Linear_Speed     : Coordinate_Type;
      X1, Y1, X2, Y2   : Coordinate_Type;
      Initial_Distance : Positive_Coordinate_Type)
      return Bouncing_Translation_Movement;

   procedure Move_All (Board : in out Board_Type);

   procedure Register_Object
     (Board : in out Board_Type; Object : Object_Access);

   procedure Set_Movement
     (Board    : in out Board_Type;
      Object   : Object_Access;
      Movement : Movement_Type);

   procedure Remvove_Object
     (Board  : in out Board_Type;
      Object : Object_Access);

   type Collision_Listener is interface;

   procedure Collision
     (This     : Collision_Listener;
      Object_1 : Object_Access;
      Object_2 : Object_Access) is abstract;

   procedure Compute_Collisions
     (Board    : Board_Type;
      Listener : Collision_Listener'Class);

   type Iterator is private;

   function First (Board : Board_Type) return Iterator;

   function Next (It : Iterator) return Iterator;

   function At_End (It : Iterator) return Boolean;

   function Element (It : Iterator) return Object_Access;

private

   type Movement_Type (Kind : Movement_Kind) is record
      Moving_Object : Object_Access;
      Linear_Speed : Coordinate_Type;

      case Kind is
         when Circular | Elliptic =>
            Around        : Object_Access;
            Angular_Speed : Coordinate_Type;
            Current_Angle : Coordinate_Type;

            case Kind is
               when Circular =>
                  Distance : Positive_Coordinate_Type;

               when Elliptic =>
                  Distance_Min, Distance_Max : Positive_Coordinate_Type;

               when others =>
                  null;
            end case;
         when Translation =>
            Dx, Dy : Coordinate_Type;
         when Bouncing_Translation =>
            X1, X2, Y1, Y2  : Coordinate_Type;
            Current_Portion : Coordinate_Type;
      end case;
   end record;

   package Object_List is new Ada.Containers.Doubly_Linked_Lists
     (Object_Access);

   use Object_List;

   package Movement_List is new Ada.Containers.Indefinite_Doubly_Linked_Lists
     (Movement_Type);

   use Movement_List;

   type Board_Type is record
      Movements : Movement_List.List;
      Objects   : Object_List.List;
   end record;

   type Iterator is record
      Inner : Object_List.Cursor;
   end record;

end Physics;
