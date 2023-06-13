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

with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Calendar;              use Ada.Calendar;

with Invaders.Games;            use Invaders.Games;
with Invaders.Objects;          use Invaders.Objects;
with Invaders.Players;          use Invaders.Players;
with Display.Basic;

procedure Main is
   Game : aliased Game_Record := Create_Game;

   Seed : Generator;

   Player : Object_Access;
   Last_Foe : Integer := 0;
begin

   Reset (Seed, Integer (Seconds (Clock)));

   Player := new Player_Type'(Create);
   Player.X := 0.0;
   Player.Y := -80.0;

   Reference_Object (Game'Access, Player);

   while not Display.Basic.At_End loop
      delay 0.01;

      Last_Foe := Last_Foe + 1;

      if Last_Foe > 50 and then Random (Seed) > 0.995 then
         if Random (Seed) > 0.7 then
            --  TODO: Create a foe here
            null;
         end if;

         Last_Foe := 0;
      end if;

      Last_Foe := Last_Foe + 1;

      Iterate (Game'Access);
   end loop;
end Main;
