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

   Stars : Star_Array (1 .. 5);

   procedure Move (The_Star : in out Star; All_Stars : Star_Array);

   procedure Move (The_Star : in out Star; All_Stars : Star_Array) is
   begin
      if The_Star.Turns_Around in All_Stars'Range then
         The_Star.Angle := The_Star.Angle + The_Star.Speed;

         Set_X
           (The_Star.Graphic,
            Get_X (All_Stars (The_Star.Turns_Around).Graphic)
            + Cos (The_Star.Angle) * The_Star.Distance);
         Set_Y
           (The_Star.Graphic,
            Get_Y (All_Stars (The_Star.Turns_Around).Graphic)
            + Sin (The_Star.Angle) * The_Star.Distance);
      end if;
   end Move;

   Sun       : Star_Index := 1;
   Earth     : Star_Index := 2;
   Moon      : Star_Index := 3;
   Satellite : Star_Index := 4;
   Comet     : Star_Index := 5;

begin
   Stars (Sun).Graphic := New_Circle (0.0, 0.0, 20.0, Yellow);
   Stars (Sun).Speed := 0.0;
   Stars (Sun).Distance := 0.0;
   Stars (Sun).Angle := 0.0;
   Stars (Sun).Turns_Around := Sun;

   Stars (Earth).Graphic := New_Circle (0.0, 0.0, 5.0, Blue);
   Stars (Earth).Speed := 0.005;
   Stars (Earth).Distance := 50.0;
   Stars (Earth).Angle := 0.0;
   Stars (Earth).Turns_Around := Sun;

   Stars (Moon).Graphic := New_Circle (0.0, 0.0, 2.0, White);
   Stars (Moon).Speed := -0.03;
   Stars (Moon).Distance := 10.0;
   Stars (Moon).Angle := 0.0;
   Stars (Moon).Turns_Around := Earth;

   Stars (Satellite).Graphic := New_Circle (0.0, 0.0, 0.8, Red);
   Stars (Satellite).Speed := 0.007;
   Stars (Satellite).Distance := 6.0;
   Stars (Satellite).Angle := 0.0;
   Stars (Satellite).Turns_Around := Earth;

   Stars (Comet).Graphic := New_Circle (0.0, 0.0, 2.0, Cyan);
   Stars (Comet).Speed := 0.02;
   Stars (Comet).Distance := 75.0;
   Stars (Comet).Angle := 0.0;
   Stars (Comet).Turns_Around := Sun;

   while not At_End loop
      delay 0.01;

      for J in Stars'Range loop
         Move (Stars (J), Stars);
      end loop;
   end loop;
end Main;
