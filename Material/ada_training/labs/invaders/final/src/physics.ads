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

private with Ada.Containers.Indefinite_Doubly_Linked_Lists;

with Object_Containers;
with System.Dim.Mks; use System.Dim.Mks;

generic

   --  [NOTE] A generic package is not stricly speaking required here - we
   --  could have reverse the way to use this and declare an interface to
   --  be implemented by the user. However, the generic package has a clear
   --  advantage - on all of the getter function, such as:
   --     Get (somethgin) return Physic_Object
   --  we will know statically the real type of Physic_Object and will be able
   --  to use it straight out. If this package is not generic, Physic_Object
   --  would be an interface to be implemented by the user, and getter function
   --  would have no static information other than the interface itself, thus
   --  requiring a less safe downcasting.

   type Physic_Object (<>) is abstract tagged private;
   type Physic_Object_Access is access all Physic_Object'Class;

   with function Get_X (This : Physic_Object) return Length is abstract;
   with function Get_Y (This : Physic_Object) return Length is abstract;
   with function Get_Radius  (This : Physic_Object) return Length is abstract;
   with procedure Set_X
     (This : in out Physic_Object; Value : Length) is abstract;
   with procedure Set_Y
     (This : in out Physic_Object; Value : Length) is abstract;
   with procedure Free (This : in out Physic_Object) is abstract;

package Physics is


   package Container is new Object_Containers
     (Base_Object        => Physic_Object,
      Base_Object_Access => Physic_Object_Access,
      Free               => Free);

   use Container;

   subtype Positive_Length is Length range 0.0 .. Length'Last;

   type Board_Type is limited private;

   function Get_Objects
     (Board : aliased in out Board_Type) return access Container.Object_Container;

   type Movement_Kind is
     (Circular, Elliptic, Translation, Bouncing_Translation);

   type Movement_Type (Kind : Movement_Kind) is private;

   subtype Circular_Movement is Movement_Type (Circular);
   subtype Elliptic_Movement is Movement_Type (Elliptic);
   subtype Translation_Movement is Movement_Type (Translation);
   subtype Bouncing_Translation_Movement is
     Movement_Type (Bouncing_Translation);

   function Create_Circular_Movement
     (Around        : Physic_Object_Access;
      Linear_Speed  : Speed;
      Distance      : Length;
      Initial_Angle : Angle := 0.0) return Circular_Movement;

   function Create_Elliptic_Movement
     (Around        : Physic_Object_Access;
      Linear_Speed  : Speed;
      Min_Distance  : Length;
      Max_Distance  : Length;
      Initial_Angle : Angle := 0.0) return Elliptic_Movement;

   function Create_Translation_Movement
     (Linear_Speed : Speed;
      The_Angle    : Angle)
      return Translation_Movement;

   function Create_Bouncing_Translation_Movement
     (Linear_Speed     : Speed;
      X1, Y1, X2, Y2   : Length;
      Initial_Distance : Length)
      return Bouncing_Translation_Movement;

   procedure Move_All (Board : in out Board_Type);

   procedure Set_Movement
     (Board    : in out Board_Type;
      Object   : Physic_Object_Access;
      Movement : Movement_Type);

   procedure Remvove_Object
     (Board  : in out Board_Type;
      Object : Physic_Object_Access);

   type Collision_Listener is interface;

   procedure Collision
     (This     : Collision_Listener;
      Object_1 : Physic_Object_Access;
      Object_2 : Physic_Object_Access) is abstract;

   procedure Compute_Collisions
     (Board    : Board_Type;
      Listener : Collision_Listener'Class);

private

   type Movement_Type (Kind : Movement_Kind) is record
      Moving_Object : Physic_Object_Access;
      Linear_Speed : Speed;

      case Kind is
         when Circular | Elliptic =>
            Around        : Physic_Object_Access;
            Angular_Speed : Mks_Type;
            Current_Angle : Angle;

            case Kind is
               when Circular =>
                  Distance : Length;

               when Elliptic =>
                  Distance_Min, Distance_Max : Length;

               when others =>
                  null;
            end case;
         when Translation =>
            Dx, Dy : Length;
         when Bouncing_Translation =>
            X1, X2, Y1, Y2  : Length;
            Current_Portion : Length;
      end case;
   end record;

   package Movement_List is new Ada.Containers.Indefinite_Doubly_Linked_Lists
     (Movement_Type);

   type Board_Type is record
      Movements : Movement_List.List;
      Objects   : aliased Container.Object_Container;
   end record;

end Physics;
