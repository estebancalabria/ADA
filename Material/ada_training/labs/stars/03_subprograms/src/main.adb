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

with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.Numerics;                      use Ada.Numerics;

with Display;                           use Display;
with Display.Basic;                     use Display.Basic;

procedure Main is

   type Star_Index is range 1 .. Integer'Last;

   type Star is record
      Speed        : Float;
      Distance     : Float;
      Angle        : Float;
      Graphic      : Shape_Id;
      Turns_Around : Star_Index := Star_Index'Last;
   end record;

   type Star_Array is array (Star_Index range <>) of Star;

   Stars : Star_Array (1 .. 4);

   procedure Move (The_Star : in out Star; All_Stars : Star_Array);

begin
   null;
end Main;
