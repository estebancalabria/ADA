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

with Invaders.Foes.Shooters; use Invaders.Foes.Shooters;
with Invaders.Games;         use Invaders.Games;

package Invaders.Foes.Smart_Shooters is

   type Smart_Shooter_Type is new Shooter_Type with record
      Aim : Object_Access;
   end record;

   function Create return Smart_Shooter_Type;

   procedure Move
     (V        : in out Smart_Shooter_Type;
      The_Game : not null access Invaders.Games.Game_Record);

end Invaders.Foes.Smart_Shooters;
