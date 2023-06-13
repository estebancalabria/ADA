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
with Ada.Numerics;                      use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

with Display;                           use Display;
with Display.Basic;                     use Display.Basic;

with Stars;                             use Stars;

procedure Main is
   Sun     : Star_Record;
   Earth   : Star_Record;
   Saturn  : Star_Record;
   Comet   : Star_Record;

   My_Stars : Star_System := Create_Star_System (100);
begin

   Create_Solar_Star (My_Stars, Sun);
   Create_Planet_With_Moon (My_Stars, Sun, 0.01, 40.0, Earth);
   Create_Planet_With_Rings (My_Stars, Sun, -0.005, 70.0, Saturn);
   Create_Comet (My_Stars, Sun, 0.01, 30.0, 150.0, Comet);

   while not At_End loop
      delay 0.01;

      Move_All (My_Stars);
   end loop;
end Main;
