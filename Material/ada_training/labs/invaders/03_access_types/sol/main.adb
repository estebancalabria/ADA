-----------------------------------------------------------------------
--                              Ada Labs                             --
--                                                                   --
--                 Copyright (C) 2008-2013, AdaCore                  --
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

with Ada.Numerics;              use Ada.Numerics;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

with Display;       use Display;
with Display.Basic; use Display.Basic;
with Invaders;      use Invaders;

procedure Main is
   Game       : Game_Record := Create_Game;
   Last_Key   : Key_Type;
   Last_Shoot : Integer := 50;
   Seed       : Generator;

   Lateral_Movement : constant := 1.0;
   Shoot_Command    : constant Character := ' ';
begin
   while not At_End loop
      delay 0.01;

      Iterate (Game);

      if Random (Seed) > 0.995 then
         Create_Foe (Game);
      end if;

      Last_Key := Current_Key_Press;

      if To_Special (Last_Key) = KEY_LEFT then
         Set_X (Get_Player (Game).all, Get_X (Get_Player (Game).all) - Lateral_Movement);
      elsif To_Special (Last_Key) = KEY_RIGHT then
         Set_X (Get_Player (Game).all, Get_X (Get_Player (Game).all) + Lateral_Movement);
      elsif To_Character (Last_Key) = Shoot_Command then
         if Last_Shoot > 50 then
            Shoot (Game);
            Last_Shoot := 0;
         end if;
      end if;

      Last_Shoot := Last_Shoot + 1;
   end loop;
end Main;
