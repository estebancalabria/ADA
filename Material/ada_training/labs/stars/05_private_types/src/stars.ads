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

   procedure Move_All (Stars : in out Star_System);

private


end Stars;
