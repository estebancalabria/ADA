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

package body Invaders.Objects is

   function Collision (Left, Right : access Root_Object'Class) return Boolean
   is
      Dx, Dy, Min_D : Float;
      Left_Space, Right_Space : Collision_Space;
   begin
      Left_Space := Left.Get_Collision_Space;
      Right_Space := Right.Get_Collision_Space;

      Dx := Left_Space.X - Right_Space.X;
      Dy := Left_Space.Y - Right_Space.Y;
      Min_D := Left_Space.Radius + Right_Space.Radius;

      return Dx * Dx + Dy * Dy <= Min_D * Min_D;
   end Collision;

   procedure Set_X (V : in out Root_Object; Val : Float) is
   begin
      V.X := Val;
   end Set_X;

   procedure Set_Y (V : in out Root_Object; Val : Float) is
   begin
      V.Y := Val;
   end Set_Y;

   function Get_X (V : Root_Object) return Float is
   begin
      return V.X;
   end Get_X;

   function Get_Y (V : Root_Object) return Float is
   begin
      return V.Y;
   end Get_Y;

   procedure Schedule_For_Deletion (V : in out Root_Object) is
   begin
      V.To_Be_Deleted := True;
   end Schedule_For_Deletion;

   function To_Be_Deleted (V : Root_Object) return Boolean is
   begin
      return V.To_Be_Deleted;
   end To_Be_Deleted;

end Invaders.Objects;
