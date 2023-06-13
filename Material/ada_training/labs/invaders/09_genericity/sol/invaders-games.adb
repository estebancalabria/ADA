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

with Ada.Unchecked_Deallocation;

with Invaders.Objects.Extensions; use Invaders.Objects.Extensions;
with Display; use Display;

package body Invaders.Games is

   procedure Free is new Ada.Unchecked_Deallocation
     (Root_Object'Class, Invaders_Physics.Object_Access);

   function Create_Game return Game_Record is
   begin
      return (Score_Shape => New_Text (-100.0, 90.0, "0", Green),
              others => <>);
   end Create_Game;

   procedure Iterate (The_Game : access Game_Record) is
      use Invaders_Physics;

      Cur : Invaders_Physics.Iterator;

      type Invaders_Collision_Listener is
        new Invaders_Physics.Collision_Listener with null record;

      procedure Collision
        (This     : Invaders_Collision_Listener;
         Object_1 : Invaders_Physics.Object_Access;
         Object_2 : Invaders_Physics.Object_Access);

      procedure Collision
        (This     : Invaders_Collision_Listener;
         Object_1 : Invaders_Physics.Object_Access;
         Object_2 : Invaders_Physics.Object_Access) is
         pragma Unreferenced (This);
      begin
         Object_1.Collision_With (Object_2);
         Object_2.Collision_With (Object_1);
      end Collision;

      Itr : Integer := 0;

   begin
      Cur := First (The_Game.My_Board);

      while not At_End (Cur) loop
         Element (Cur).Iterate (The_Game);

         Cur := Next (Cur);
      end loop;

      Invaders_Physics.Move_All (The_Game.My_Board);

      Invaders_Physics.Compute_Collisions
        (The_Game.My_Board, Invaders_Collision_Listener'(others => <>));

      Cur := First (The_Game.My_Board);

      while not At_End (Cur) loop
         if Element (Cur).To_Be_Deleted then
            declare
               Acc      : Invaders_Physics.Object_Access := Element (Cur);
               Garbage  : Invaders_Physics.Iterator := Cur;
               pragma Unreferenced (Garbage);
               List_Cur : Listener_Container.Cursor;
            begin
               List_Cur := The_Game.Deleted_Listeners.First;

               while List_Cur /= Listener_Container.No_Element loop
                  Element (List_Cur).Deleted (Acc);

                  List_Cur := Next (List_Cur);
               end loop;

               if Acc.all in Score_Provider'Class then
                  The_Game.Score :=
                    The_Game.Score + Score_Provider'Class(Acc.all).Get_Points;
               end if;

               Garbage := Cur;
               Cur := Next (Cur);
               Remvove_Object (The_Game.My_Board, Acc);
               Acc.Delete (The_Game);
               Free (Acc);
            end;
         else
            Cur := Next (Cur);
         end if;
      end loop;

      Itr := 0;
      Cur := First (The_Game.My_Board);

      while not At_End (Cur) loop
         Element (Cur).Redraw;

         Cur := Next (Cur);
         Itr := Itr + 1;
      end loop;

      Set_Text (The_Game.Score_Shape, The_Game.Score'Img);
   end Iterate;

   procedure Reference_Object
     (The_Game : access Game_Record; Object : Object_Access)
   is
   begin
      Invaders_Physics.Register_Object
        (The_Game.My_Board, Invaders_Physics.Object_Access (Object));
   end Reference_Object;

   procedure Register_Listener
     (The_Game : access Game_Record; Listener : Object_Deleted_Listener_Access)
   is
   begin
      The_Game.Deleted_Listeners.Append (Listener);
   end Register_Listener;

   function Get_Score (The_Game : access Game_Record) return Natural is
   begin
      return The_Game.Score;
   end Get_Score;

   procedure Register_Movement
     (The_Game : access Game_Record;
      Object   : Object_Access;
      Movement : Invaders_Physics.Movement_Type)
   is
   begin
      Invaders_Physics.Set_Movement
        (The_Game.My_Board,
         Invaders_Physics.Object_Access (Object),
         Movement);
   end Register_Movement;

end Invaders.Games;
