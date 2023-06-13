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
   Hour_01 : Shape_Id := New_Circle
     (Cos (-(1.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      Sin (-(1.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      5.0,
      White);
   Hour_02 : Shape_Id := New_Circle
     (Cos (-(2.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      Sin (-(2.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      5.0,
      White);
   Hour_03 : Shape_Id := New_Circle
     (Cos (-(3.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      Sin (-(3.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      7.0,
      Red);
   Hour_04 : Shape_Id := New_Circle
     (Cos (-(4.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      Sin (-(4.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      5.0,
      White);
   Hour_05 : Shape_Id := New_Circle
     (Cos (-(5.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      Sin (-(5.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      5.0,
      White);
   Hour_06 : Shape_Id := New_Circle
     (Cos (-(6.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      Sin (-(6.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      7.0,
      Red);
   Hour_07 : Shape_Id := New_Circle
     (Cos (-(7.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      Sin (-(7.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      5.0,
      White);
   Hour_08 : Shape_Id := New_Circle
     (Cos (-(8.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      Sin (-(8.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      5.0,
      White);
   Hour_09 : Shape_Id := New_Circle
     (Cos (-(9.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      Sin (-(9.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      7.0,
      Red);
   Hour_10 : Shape_Id := New_Circle
     (Cos (-(10.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      Sin (-(10.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      5.0,
      White);
   Hour_11 : Shape_Id := New_Circle
     (Cos (-(11.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      Sin (-(11.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      5.0,
      White);
   Hour_12 : Shape_Id := New_Circle
     (Cos (-(12.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      Sin (-(12.0 / 12.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      7.0,
      Red);

   T : Time := Clock;
   Float_Minute : Float := Float (Minute (T));
   Float_Hour : Float := Float (Hour (T, UTC_Time_Offset (T)))
     + Float_Minute / 60.0;

   Hour_Needle : constant Shape_Id := New_Line
     (0.0,
      0.0,
      Cos (-(Float_Hour / 12.0 * 2.0 * Pi) + Pi / 2.0) * 40.0,
      Sin (-(Float_Hour / 12.0 * 2.0 * Pi) + Pi / 2.0) * 40.0,
      Yellow);
   Minute_Needle : constant Shape_Id := New_Line
     (0.0,
      0.0,
      Cos (-(Float_Minute / 60.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      Sin (-(Float_Minute / 60.0 * 2.0 * Pi) + Pi / 2.0) * 70.0,
      Yellow);
   pragma Unreferenced (Minute_Needle);
begin
   null;
end Main;
