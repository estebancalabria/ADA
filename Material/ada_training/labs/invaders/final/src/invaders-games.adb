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

with Invaders.Objects.Extensions; use Invaders.Objects.Extensions;
with Display; use Display;

package body Invaders.Games is

   use Invaders_Physics.Container;

   -----------------
   -- Create_Game --
   -----------------

   function Create_Game return Game_Record is
   begin
      return (Score_Shape => New_Text (-100.0, 90.0, "0", Green),
              others => <>);
   end Create_Game;

   -------------
   -- Iterate --
   -------------

   procedure Iterate (The_Game : access Game_Record) is
      type Invaders_Collision_Listener is
        new Collision_Listener with null record;

      procedure Collision
        (This     : Invaders_Collision_Listener;
         Object_1 : Object_Access;
         Object_2 : Object_Access);

      procedure Collision
        (This     : Invaders_Collision_Listener;
         Object_1 : Object_Access;
         Object_2 : Object_Access) is
      begin
         Object_1.Collision_With (Object_2);
         Object_2.Collision_With (Object_1);
      end Collision;

      Elem : Object_Access;

   begin
      for E of Get_Objects (The_Game.My_Board).all loop
         Root_Object'Class (E.all).Iterate (The_Game);
      end loop;

      Invaders_Physics.Move_All (The_Game.My_Board);

      Invaders_Physics.Compute_Collisions
        (The_Game.My_Board, Invaders_Collision_Listener'(others => <>));

      for I in Get_Objects (The_Game.My_Board).all.Iterate loop
         Elem := Element (I);

         if Elem.To_Be_Deleted then
            for L of The_Game.Deleted_Listeners loop
               L.Deleted (Elem);
            end loop;

            if Elem.all in Score_Provider'Class then
               The_Game.Score :=
                 The_Game.Score + Score_Provider'Class(Elem.all).Get_Points;
            end if;


            Schedule_To_Delete (I);
            Elem.Delete (The_Game);
         end if;
      end loop;

      Get_Objects (The_Game.My_Board).Delete_Scheduled;

      for E of Get_Objects (The_Game.My_Board).all loop
         E.Redraw;
      end loop;

      Set_Text (The_Game.Score_Shape, The_Game.Score'Img);
   end Iterate;

   ----------------------
   -- Reference_Object --
   ----------------------

   procedure Reference_Object
     (The_Game : access Game_Record; Object : Object_Access)
   is
   begin
      Get_Objects (The_Game.My_Board).Append (Object);
   end Reference_Object;

   -----------------------
   -- Register_Listener --
   -----------------------

   procedure Register_Listener
     (The_Game : access Game_Record; Listener : Object_Deleted_Listener_Access)
   is
   begin
      The_Game.Deleted_Listeners.Append (Listener);
   end Register_Listener;

   ---------------
   -- Get_Score --
   ---------------

   function Get_Score (The_Game : access Game_Record) return Natural is
   begin
      return The_Game.Score;
   end Get_Score;

   -----------------------
   -- Register_Movement --
   -----------------------

   procedure Register_Movement
     (The_Game : access Game_Record;
      Object   : Object_Access;
      Movement : Movement_Type)
   is
   begin
      Invaders_Physics.Set_Movement
        (The_Game.My_Board,
         Object_Access (Object),
         Movement);
   end Register_Movement;

end Invaders.Games;
