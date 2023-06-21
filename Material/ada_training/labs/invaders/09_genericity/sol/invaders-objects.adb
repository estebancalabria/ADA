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

   function Get_X (V : Root_Object'Class) return Float is
   begin
      return V.X;
   end Get_X;

   function Get_Y (V : Root_Object'Class) return Float is
   begin
      return V.Y;
   end Get_Y;

   function Get_Radius (V : Root_Object'Class) return Float is
   begin
      return V.Radius;
   end Get_Radius;

   procedure Set_X (V : in out Root_Object'Class; Value : Float) is
   begin
      V.X := Value;
   end Set_X;

   procedure Set_Y (V : in out Root_Object'Class; Value : Float) is
   begin
      V.Y := Value;
   end Set_Y;

end Invaders.Objects;