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

with Display; use Display;

package body Invaders.Foes.Smart_Shooters is

   function Create return Smart_Shooter_Type
   is
   begin
      return Result : Smart_Shooter_Type :=
        (Shooter_Type'(Create) with Aim => null) do

         Set_Color (Result, Green);

      end return;
   end Create;

   procedure Move
     (V        : in out Smart_Shooter_Type;
      The_Game : not null access Invaders.Games.Game_Record)
   is
   begin
      if Get_X (V.Aim.all) > Get_X (V) then
         Set_X (V, Get_X (V) + abs (Get_Speed (V)));
      elsif Get_X (V.Aim.all) < Get_X (V) then
         Set_X (V, Get_X (V) - abs (Get_Speed (V)));
      end if;
   end Move;

   procedure Set_Aim (V : in out Smart_Shooter_Type; Aim : Object_Access) is
   begin
      V.Aim := Aim;
   end Set_Aim;

end Invaders.Foes.Smart_Shooters;
