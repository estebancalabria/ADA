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

with Ada.Numerics;                      use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Stars is

   function Create_Solar_Star return Star_Record
   is
   begin
      return
        (Kind            => Solar_Star,
         X               => 0.0,
         Y               => 0.0,
         Graphic         => New_Circle (0.0, 0.0, 15.0, Yellow));
   end Create_Solar_Star;

   function Create_Moving_Position
     (Turns_Around : Star_Access;
      Speed        : Float;
      Distance     : Float) return Star_Record
   is
   begin
      return
        (Kind            => Moving_Position,
         X               => 0.0,
         Y               => 0.0,
         Distance        => Distance,
         Speed           => Speed,
         Angle           => 0.0,
         Turns_Around    => Turns_Around,
         Graphic         => Null_Shape_Id);
   end Create_Moving_Position;

   function Create_Simple_Planet
     (Turns_Around : Star_Access;
      Speed        : Float;
      Distance     : Float)
      return Star_Record
   is
   begin
      return
        (Kind            => Simple_Planet,
         X               => 0.0,
         Y               => 0.0,
         Distance        => Distance,
         Speed           => Speed,
         Angle           => 0.0,
         Turns_Around    => Turns_Around,
         Graphic         => New_Circle (0.0, 0.0, 5.0, Blue));
   end Create_Simple_Planet;

   function Create_Moon
     (Turns_Around : Star_Access;
      Speed        : Float;
      Distance     : Float)
     return Star_Record
   is
      Planet_Radius : Float := 5.0;
   begin
      return
        (Kind            => Simple_Star,
         X               => 0.0,
         Y               => 0.0,
         Distance        => Planet_Radius + 5.0,
         Speed           => -Speed * 2.5,
         Angle           => 0.0,
         Turns_Around    => Turns_Around,
         Graphic         => New_Circle (0.0, 0.0, 2.0, White));
   end Create_Moon;

   function Create_Planet_With_Rings
     (Turns_Around : Star_Access;
      Speed        : Float;
      Distance     : Float)
     return Star_Record
   is
      Planet_Radius : Float := 7.0;
   begin
      return
        (Kind            => Planet_With_Rings,
         X               => 0.0,
         Y               => 0.0,
         Distance        => Distance,
         Speed           => Speed,
         Angle           => 0.0,
         Turns_Around    => Turns_Around,
         Graphic         => New_Circle
           (0.0, 0.0, Planet_Radius, Magenta),
         Ring            => New_Torus
           (0.0,
            0.0,
            1.0,
            Planet_Radius + 5.0,
            Red));
   end Create_Planet_With_Rings;

   function Create_Comet
     (Turns_Around : Star_Access;
      Speed        : Float;
      Distance_Min : Float;
      Distance_Max : Float)
      return Star_Record
   is
   begin
      return
        (Kind             => Comet,
         X                => 0.0,
         Y                => 0.0,
         Distance         => Distance_Min,
         Distance_Max     => Distance_Max,
         Speed            => Speed,
         Angle            => 0.0,
         Turns_Around     => Turns_Around,
         Graphic          => New_Circle (0.0, 0.0, 2.0, Cyan));
   end Create_Comet;

end Stars;
