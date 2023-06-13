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
with Invaders.Foes.Kamikazes;   use Invaders.Foes.Kamikazes;
with Invaders.Foes.Shooters;    use Invaders.Foes.Shooters;
with Invaders.Foes.Smart_Shooters;    use Invaders.Foes.Smart_Shooters;
with Invaders.Objects;          use Invaders.Objects;
with Invaders.Players;          use Invaders.Players;
with Display.Basic;

procedure Main is
   Game : aliased Game_Record := Create_Game;

   Seed : Generator;

   Player : Object_Access;
   Last_Foe : Integer := 0;
   New_Foe : Object_Access;
begin

   Reset (Seed, Integer (Seconds (Clock)));

   Player := new Player_Type'(Create);
   Set_X (Player.all, 0.0);
   Set_Y (Player.all, -80.0);

   Reference_Object (Game'Access, Player);

   while not Display.Basic.At_End loop
      delay 0.01;

      Last_Foe := Last_Foe + 1;

      if Last_Foe > 50 and then Random (Seed) > 0.995 then
         if Random (Seed) > 0.8 then
            if Random (Seed) > 0.5 then
               New_Foe := new Smart_Shooter_Type'(Create);
               Set_Aim (Smart_Shooter_Type (New_Foe.all), Player);
            else
               New_Foe := new Shooter_Type'(Create);
            end if;

            declare
               Shooter : Shooter_Type renames Shooter_Type (New_Foe.all);
            begin
               Set_X (Shooter, Random (Seed) * 180.0 - 90.0);
               Set_Y (Shooter, Random (Seed) * 50.0 + 50.0);

               if Random (Seed) > 0.5 then
                  Set_Speed (Shooter, 0.1);
               else
                  Set_Speed (Shooter, -0.1);
               end if;

               Reference_Object (Game'Access, New_Foe);
            end;
         else
            declare
               New_Foe : Object_Access;
            begin
               New_Foe := new Kamikaze_Type'(Create);
               Set_X (New_Foe.all, Random (Seed) * 180.0 - 90.0);
               Set_Y (New_Foe.all, 100.0);

               Reference_Object (Game'Access, New_Foe);
            end;
         end if;

         Last_Foe := 0;
      end if;

      Last_Foe := Last_Foe + 1;

      Iterate (Game'Access);
   end loop;
end Main;
