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

procedure Main is
   type Star is (Sun, Earth, Moon, Satellite);
   type Metric is (Speed, Distance, Angle);

   type Shape_Array is array (Star) of Shape_Id;
   type Star_Metric is array (Star, Metric) of Float;

   Stars : Shape_Array;
   Metrics : Star_Metric;

begin
   Stars (Sun) := New_Circle (0.0, 0.0, 20.0, Yellow);
   Metrics (Sun, Speed) := 0.0;
   Metrics (Sun, Distance) := 0.0;
   Metrics (Sun, Angle) := 0.0;

   Stars (Earth) := New_Circle (0.0, 0.0, 5.0, Blue);
   Metrics (Earth, Speed) := 0.005;
   Metrics (Earth, Distance) := 60.0;
   Metrics (Earth, Angle) := 0.0;

   Stars (Moon) := New_Circle (0.0, 0.0, 2.0, White);
   Metrics (Moon, Speed) := -0.03;
   Metrics (Moon, Distance) := 10.0;
   Metrics (Moon, Angle) := 0.0;

   Stars (Satellite) := New_Circle (0.0, 0.0, 0.8, Red);
   Metrics (Satellite, Speed) := 0.07;
   Metrics (Satellite, Distance) := 3.2;
   Metrics (Satellite, Angle) := 0.0;

   while not At_End loop
      delay 0.01;

      for J in Earth .. Satellite loop
         Set_X
           (Stars (J),
            Get_X (Stars (Star'Pred (J)))
            + Cos (Metrics (J, Angle)) * Metrics (J, Distance));
         Set_Y
           (Stars (J),
            Get_Y (Stars (Star'Pred (J)))
            + Sin (Metrics (J, Angle)) * Metrics (J, Distance));
      end loop;

      for J in Star'Range loop
         Metrics (J, Angle) := Metrics (J, Angle) + Metrics (J, Speed);
      end loop;
   end loop;
end Main;
