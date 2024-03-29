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
with Ada.Numerics.Float_Random;         use Ada.Numerics.Float_Random;

package body Stars is

   Collision_Exception : exception;

   procedure Move
     (The_Star         : in out Star_Record;
      Stars            : Star_System;
      Handle_Collision : Boolean);

   function Create_Star_System (Max_Size : Integer) return Star_System is
   begin
      return (Max_Size => Star_Index (Max_Size),
              The_Stars => (others => No_Star),
              others => <>);
   end Create_Star_System;

   procedure Create_Solar_Star
     (System : in out Star_System;
      Star   : out Star_Record)
   is
   begin
      System.Last := System.Last + 1;
      System.The_Stars (System.Last) :=
        (Kind            => Solar_Star,
         X               => 0.0,
         Y               => 0.0,
         Index_In_System => System.Last,
         Graphic         => New_Circle (0.0, 0.0, 15.0, Yellow));

      Star := System.The_Stars (System.Last);
   end Create_Solar_Star;

   procedure Create_Moving_Position
     (System       : in out Star_System;
      Turns_Around : Star_Record;
      Speed        : Float;
      Distance     : Float;
      Star         : out Star_Record)
   is
   begin
      System.Last := System.Last + 1;
      System.The_Stars (System.Last) :=
        (Kind            => Moving_Position,
         X               => 0.0,
         Y               => 0.0,
         Index_In_System => System.Last,
         Distance        => Distance,
         Speed           => Speed,
         Angle           => 0.0,
         Turns_Around    => Turns_Around.Index_In_System,
         Graphic         => Null_Shape_Id);

      Star := System.The_Stars (System.Last);
   end Create_Moving_Position;

   procedure Create_Simple_Planet
     (System       : in out Star_System;
      Turns_Around : Star_Record;
      Speed        : Float;
      Distance     : Float;
      Star         : out Star_Record)
   is
   begin
      System.Last := System.Last + 1;
      System.The_Stars (System.Last) :=
        (Kind            => Simple_Planet,
         X               => 0.0,
         Y               => 0.0,
         Index_In_System => System.Last,
         Distance        => Distance,
         Speed           => Speed,
         Angle           => 0.0,
         Turns_Around    => Turns_Around.Index_In_System,
         Graphic         => New_Circle (0.0, 0.0, 5.0, Blue));

      Star := System.The_Stars (System.Last);
   end Create_Simple_Planet;

   procedure Create_Planet_With_Moon
     (System       : in out Star_System;
      Turns_Around : Star_Record;
      Speed        : Float;
      Distance     : Float;
      Star         : out Star_Record)
   is
      Planet_Radius : Float := 5.0;
   begin
      System.Last := System.Last + 1;
      System.The_Stars (System.Last) :=
        (Kind            => Simple_Planet,
         X               => 0.0,
         Y               => 0.0,
         Index_In_System => System.Last,
         Distance        => Distance,
         Speed           => Speed,
         Angle           => 0.0,
         Turns_Around    => Turns_Around.Index_In_System,
         Graphic         => New_Circle
           (0.0, 0.0, Planet_Radius, Blue));

      Star := System.The_Stars (System.Last);

      System.Last := System.Last + 1;
      System.The_Stars (System.Last) :=
        (Kind            => Simple_Star,
         X               => 0.0,
         Y               => 0.0,
         Index_In_System => System.Last,
         Distance        => Planet_Radius + 5.0,
         Speed           => -Speed * 2.5,
         Angle           => 0.0,
         Turns_Around    => System.Last - 1,
         Graphic         => New_Circle (0.0, 0.0, 2.0, White));
   end Create_Planet_With_Moon;


   procedure Create_Planet_With_Rings
     (System       : in out Star_System;
      Turns_Around : Star_Record;
      Speed        : Float;
      Distance     : Float;
      Star         : out Star_Record)
   is
      Planet_Radius : Float := 7.0;
   begin
      System.Last := System.Last + 1;
      System.The_Stars (System.Last) :=
        (Kind            => Planet_With_Rings,
         X               => 0.0,
         Y               => 0.0,
         Index_In_System => System.Last,
         Distance        => Distance,
         Speed           => Speed,
         Angle           => 0.0,
         Turns_Around    => Turns_Around.Index_In_System,
         Graphic         => New_Circle
           (0.0, 0.0, Planet_Radius, Magenta),
         Ring            => New_Torus
           (0.0,
            0.0,
            1.0,
            Planet_Radius + 5.0,
            Red));

      Star := System.The_Stars (System.Last);
   end Create_Planet_With_Rings;

   procedure Create_Comet
     (System       : in out Star_System;
      Turns_Around : Star_Record;
      Speed        : Float;
      Distance_Min : Float;
      Distance_Max : Float;
      Star         : out Star_Record)
   is
   begin
      System.Last := System.Last + 1;
      System.The_Stars (System.Last) :=
        (Kind             => Comet,
         X                => 0.0,
         Y                => 0.0,
         Index_In_System  => System.Last,
         Distance         => Distance_Min,
         Distance_Max     => Distance_Max,
         Speed            => Speed,
         Angle            => 0.0,
         Turns_Around     => Turns_Around.Index_In_System,
         Graphic          => New_Circle (0.0, 0.0, 2.0, Cyan));

      Star := System.The_Stars (System.Last);
   end Create_Comet;

   The_Seed : Generator;

   procedure Create_Asteroid
     (System       : in out Star_System;
      Turns_Around : Star_Record;
      Min_Speed    : Float;
      Max_Speed    : Float;
      Min_Distance : Float;
      Max_Distance : Float;
      Star         : out Star_Record)
   is
   begin
      null;
   end Create_Asteroid;

   procedure Move
     (The_Star         : in out Star_Record;
      Stars            : Star_System;
      Handle_Collision : Boolean)
   is
   begin
      if The_Star = No_Star then
         return;
      end if;

      if The_Star.Kind /= Solar_Star then
         The_Star.Angle := The_Star.Angle + The_Star.Speed;

         if The_Star.Kind = Comet then
            The_Star.X :=
              (Stars.The_Stars (The_Star.Turns_Around).X
               + Cos (The_Star.Angle) * (The_Star.Distance_Max));

            The_Star.Y :=
              Stars.The_Stars (The_Star.Turns_Around).Y
              + Sin (The_Star.Angle) * (The_Star.Distance);
         else
            The_Star.X :=
              (Stars.The_Stars (The_Star.Turns_Around).X
               + Cos (The_Star.Angle) * The_Star.Distance);

            The_Star.Y :=
              Stars.The_Stars (The_Star.Turns_Around).Y
              + Sin (The_Star.Angle) * The_Star.Distance;
         end if;
      end if;

      if The_Star.Graphic /= Null_Shape_Id then
         Set_X (The_Star.Graphic, The_Star.X);
         Set_Y (The_Star.Graphic, The_Star.Y);

         if The_Star.Kind = Planet_With_Rings then
            Set_X (The_Star.Ring, The_Star.X);
            Set_Y (The_Star.Ring, The_Star.Y);
         end if;
      end if;

      if Handle_Collision then
         --  Complete here

         null;
      end if;
   end Move;

   procedure Move_All
     (Stars : in out Star_System; Handle_Collision : Boolean) is
   begin
      for J in 1 .. Stars.Last loop
         Move (Stars.The_Stars (J), Stars, Handle_Collision);
      end loop;
   end Move_All;

end Stars;
