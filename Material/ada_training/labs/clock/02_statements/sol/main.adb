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
with Ada.Calendar;                      use Ada.Calendar;
with Ada.Calendar.Formatting;           use Ada.Calendar.Formatting;
with Ada.Calendar.Time_Zones;           use Ada.Calendar.Time_Zones;

with Display;                           use Display;
with Display.Basic;                     use Display.Basic;

procedure Main is
   T            : Time := Clock;
   Float_Minute : Float := Float (Minute (T));
   Float_Hour   : Float := Float (Hour (T, UTC_Time_Offset (T)))
     + Float_Minute / 60.0;
   Float_Second : Float := Float (Second (T));

   Hour_Needle   : Shape_Id := New_Line
     (0.0, 0.0, 0.0, 0.0, Yellow);
   Minute_Needle : Shape_Id := New_Line
     (0.0, 0.0, 0.0, 0.0, Yellow);
   Second_Needle : Shape_Id := New_Line
     (0.0, 0.0, 0.0, 0.0, Yellow);

begin
   for H in 1 .. 12 loop
      if H mod 3 = 0 then
         declare
            Hour : Shape_Id := New_Circle
              (Cos (-(Float (H) / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
               Sin (-(Float (H) / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
               7.0,
               Red);
         begin
            null;
         end;
      else
         declare
            Hour : Shape_Id := New_Circle
              (Cos (-(Float (H) / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
               Sin (-(Float (H) / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
               5.0,
               White);
         begin
            null;
         end;
      end if;
   end loop;

   while not At_End loop
      T := Clock;
      Float_Minute := Float (Minute (T));
      Float_Hour   := Float
        (Hour (T, UTC_Time_Offset (T))) + Float_Minute / 60.0;
      Float_Second := Float (Second (T));

      Set_X2
        (Hour_Needle,
         Cos (-(Float_Hour / 12.0 * 2.0 * Pi) + Pi / 2.0) * 40.0);
      Set_Y2
        (Hour_Needle,
         Sin (-(Float_Hour / 12.0 * 2.0 * Pi) + Pi / 2.0) * 40.0);

      Set_X2
        (Minute_Needle,
         Cos (-(Float_Minute / 60.0 * 2.0 * Pi) + Pi / 2.0) * 70.0);
      Set_Y2
        (Minute_Needle,
         Sin (-(Float_Minute / 60.0 * 2.0 * Pi) + Pi / 2.0) * 70.0);

      Set_X2
        (Second_Needle,
         Cos (-(Float_Second / 60.0 * 2.0 * Pi) + Pi / 2.0) * 100.0);
      Set_Y2
        (Second_Needle,
         Sin (-(Float_Second / 60.0 * 2.0 * Pi) + Pi / 2.0) * 100.0);

      delay 1.0;
   end loop;

end Main;
