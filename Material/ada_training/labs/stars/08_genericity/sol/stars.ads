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

   type Star_Access is not null access all Star_Record;

   function Create_Solar_Star return Star_Record;

   function Create_Moving_Position
     (Turns_Around : Star_Access;
      Speed        : Float;
      Distance     : Float)
      return Star_Record;

   function Create_Simple_Planet
     (Turns_Around : Star_Access;
      Speed        : Float;
      Distance     : Float)
      return Star_Record;

   function Create_Moon
     (Turns_Around : Star_Access;
      Speed        : Float;
      Distance     : Float)
     return Star_Record;

   function Create_Planet_With_Rings
     (Turns_Around : Star_Access;
      Speed        : Float;
      Distance     : Float)
     return Star_Record;

   function Create_Comet
     (Turns_Around : Star_Access;
      Speed        : Float;
      Distance_Min : Float;
      Distance_Max : Float)
     return Star_Record;

   Central_Star : constant Star_Access;

   No_Star : constant Star_Record;

private

   type Star_Kind is
     (Solar_Star,
      Simple_Star,
      Moving_Position,
      Simple_Planet,
      Planet_With_Rings,
      Comet);

   type Star_Record (Kind : Star_Kind := Solar_Star) is record
      X, Y    : Float := 0.0;
      Graphic : Shape_Id := Null_Shape_Id;

      case Kind is
         when Solar_Star =>
            null;

         when others =>
            Speed        : Float := 0.0;
            Distance     : Float := 0.0;
            Angle        : Float := 0.0;
            Turns_Around : Star_Access;

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

   Central_Star_Record : aliased Star_Record;
   Central_Star : constant Star_Access := Central_Star_Record'Access;

   No_Star : constant Star_Record :=
     (Solar_Star,
      0.0,
      0.0,
      Null_Shape_Id);

end Stars;
