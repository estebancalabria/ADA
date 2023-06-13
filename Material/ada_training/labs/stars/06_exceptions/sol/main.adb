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

with Ada.Text_IO;    use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

with Display;        use Display;
with Display.Basic;  use Display.Basic;

with Stars;          use Stars;

procedure Main is
   Sun     : Star_Record;
   My_Stars : Star_System := Create_Star_System (100);
begin
   Create_Solar_Star (My_Stars, Sun);

   for J in 1 .. 50 loop
      declare
         The_Asteroid : Star_Record;
      begin
         Create_Asteroid
           (My_Stars, Sun, 0.005, 0.03, 60.0, 150.0, The_Asteroid);
      end;
   end loop;

   Move_All (My_Stars, False);
   --  To place all the planets on the grid

   while not At_End loop
      delay 0.01;

      Move_All (My_Stars, True);
   end loop;
end Main;
