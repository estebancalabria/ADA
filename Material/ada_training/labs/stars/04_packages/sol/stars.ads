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

package Stars is

   type Star_Index is range 1 .. Integer'Last;

   type Star_Record is record
      X, Y         : Float := 0.0;
      Speed        : Float := 0.0;
      Distance     : Float := 0.0;
      Angle        : Float := 0.0;
      Turns_Around : Star_Index := Star_Index'Last;
      Graphic      : Shape_Id := Null_Shape_Id;
   end record;

   No_Star : constant Star_Record :=
     (0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      Star_Index'Last,
      Null_Shape_Id);

   type Star_System is array (Star_Index range <>) of Star_Record;

   procedure Move_All (Stars : in out Star_System);

end Stars;
