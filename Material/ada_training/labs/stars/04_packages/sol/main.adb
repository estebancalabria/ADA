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

   My_Stars : Star_System (1 .. 8);

   Sun          : Star_Index := 1;
   Earth        : Star_Index := 2;
   Moon         : Star_Index := 3;
   Satellite    : Star_Index := 4;
   Comet        : Star_Index := 5;
   Asteroid_Axe : Star_Index := 6;
   Asteroid_1   : Star_Index := 7;
   Asteroid_2   : Star_Index := 8;

begin
   My_Stars (Sun) :=
     (Graphic => New_Circle (0.0, 0.0, 20.0, Yellow), others => <>);
   My_Stars (Earth) :=
     (Graphic      => New_Circle (0.0, 0.0, 5.0, Blue),
      Speed        => 0.005,
      Distance     => 50.0,
      Turns_Around => Sun,
      others       => <>);
   My_Stars (Moon) :=
     (Graphic      => New_Circle (0.0, 0.0, 2.0, White),
      Speed        => -0.03,
      Distance     => 10.0,
      Turns_Around => Earth,
      others       => <>);
   My_Stars (Satellite) :=
     (Graphic      => New_Circle (0.0, 0.0, 0.8, Red),
      Speed        => 0.007,
      Distance     => 6.0,
      Turns_Around => Earth,
      others       => <>);
   My_Stars (Comet) :=
     (Graphic      => New_Circle (0.0, 0.0, 2.0, Cyan),
      Speed        => 0.02,
      Distance     => 95.0,
      Turns_Around => Sun,
      others       => <>);
   My_Stars (Asteroid_Axe) :=
     (Speed        => 0.012,
      Distance     => 75.0,
      Turns_Around => Sun,
      others       => <>);
   My_Stars (Asteroid_1) :=
     (Graphic      => New_Circle (0.0, 0.0, 3.0, White),
      Speed        => 0.07,
      Distance     => 5.0,
      Turns_Around => Asteroid_Axe,
      others       => <>);
   My_Stars (Asteroid_2) :=
     (Graphic      => New_Circle (0.0, 0.0, 3.0, White),
      Speed        => 0.07,
      Distance     => 5.0,
      Angle        => Pi,
      Turns_Around => Asteroid_Axe,
      others       => <>);

   while not At_End loop
      delay 0.01;

      Move_All (My_Stars);
   end loop;
end Main;
