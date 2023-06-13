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

with Display;       use Display;
with Display.Basic; use Display.Basic;

package Stars is

   type Star_Record is private;

   type Star_System (<>) is private;

   function Create_Star_System (Max_Size : Integer) return Star_System;

   procedure Create_Solar_Star
     (System : in out Star_System;
      Star   : out Star_Record);

   procedure Create_Moving_Position
     (System       : in out Star_System;
      Turns_Around : Star_Record;
      Speed        : Float;
      Distance     : Float;
      Star         : out Star_Record);

   procedure Create_Simple_Planet
     (System       : in out Star_System;
      Turns_Around : Star_Record;
      Speed        : Float;
      Distance     : Float;
      Star         : out Star_Record);

   procedure Create_Planet_With_Moon
     (System       : in out Star_System;
      Turns_Around : Star_Record;
      Speed        : Float;
      Distance     : Float;
      Star         : out Star_Record);

   procedure Create_Planet_With_Rings
     (System       : in out Star_System;
      Turns_Around : Star_Record;
      Speed        : Float;
      Distance     : Float;
      Star         : out Star_Record);

   procedure Create_Comet
     (System       : in out Star_System;
      Turns_Around : Star_Record;
      Speed        : Float;
      Distance_Min : Float;
      Distance_Max : Float;
      Star         : out Star_Record);

   procedure Create_Asteroid
     (System       : in out Star_System;
      Turns_Around : Star_Record;
      Min_Speed    : Float;
      Max_Speed    : Float;
      Min_Distance : Float;
      Max_Distance : Float;
      Star         : out Star_Record);

   procedure Move_All (Stars : in out Star_System; Handle_Collision : Boolean);

private

   type Star_Kind is
     (Solar_Star,
      Simple_Star,
      Moving_Position,
      Simple_Planet,
      Planet_With_Rings,
      Comet);

   type Star_Index is range 0 .. Integer'Last;

   type Star_Record (Kind : Star_Kind := Solar_Star) is record
      X, Y            : Float := 0.0;
      Index_In_System : Star_Index := Star_Index'Last;
      Graphic         : Shape_Id := Null_Shape_Id;

      case Kind is
         when Solar_Star =>
            null;

         when others =>
            Speed        : Float := 0.0;
            Distance     : Float := 0.0;
            Angle        : Float := 0.0;
            Turns_Around : Star_Index := Star_Index'Last;

            case Kind is
               when Planet_With_Rings =>
                  Ring : Shape_Id := Null_Shape_Id;

               when Comet =>
                  Distance_Max : Float;

               when others =>
                  null;
            end case;
      end case;
   end record;

   type Star_Array is array (Star_Index range <>) of Star_Record;

   type Star_System (Max_Size : Star_Index) is record
      The_Stars : Star_Array (1 .. Max_Size);
      Last      : Star_Index := 0;
   end record;

   No_Star : constant Star_Record :=
     (Solar_Star,
      0.0,
      0.0,
      Star_Index'Last,
      Null_Shape_Id);

end Stars;
