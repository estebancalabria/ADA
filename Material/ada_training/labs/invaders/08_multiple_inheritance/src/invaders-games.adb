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

with Display; use Display;

package body Invaders.Games is

   procedure Free is new Ada.Unchecked_Deallocation
     (Root_Object'Class, Object_Access);

   function Create_Game return Game_Record is
   begin
      return (Score_Shape => New_Text (-100.0, 90.0, "0", Green),
              others => <>);
   end Create_Game;

   procedure Iterate (The_Game : access Game_Record) is
      Cur : Objects_Container.Cursor;
   begin

      Cur := The_Game.Objects.First;

      while Cur /= Objects_Container.No_Element loop
         Element (Cur).Iterate (The_Game);

         Cur := Next (Cur);
      end loop;

      Cur := The_Game.Objects.First;

      while Cur /= Objects_Container.No_Element loop
         declare
            Cur2 : Objects_Container.Cursor;
         begin
            Cur2 := Next (Cur);

            while Cur2 /= Objects_Container.No_Element loop
               if Collision (Element (Cur), Element (Cur2)) then
                  Element (Cur).Collision_With (Element (Cur2));
                  Element (Cur2).Collision_With (Element (Cur));
               end if;

               Cur2 := Next (Cur2);
            end loop;
         end;

         Cur := Next (Cur);
      end loop;

      Cur := The_Game.Objects.First;

      while Cur /= Objects_Container.No_Element loop
         if Element (Cur).To_Be_Deleted then
            declare
               Acc      : Object_Access := Element (Cur);
               Garbage  : Objects_Container.Cursor := Cur;
            begin
               Acc.Delete;
               Free (Acc);
               Garbage := Cur;
               Cur := Next (Cur);
               The_Game.Objects.Delete (Garbage);
            end;
         else
            Cur := Next (Cur);
         end if;
      end loop;

      Cur := The_Game.Objects.First;

      while Cur /= Objects_Container.No_Element loop
         Element (Cur).Redraw;

         Cur := Next (Cur);
      end loop;

      Set_Text (The_Game.Score_Shape, The_Game.Score'Img);
   end Iterate;

   procedure Reference_Object
     (The_Game : access Game_Record; Object : Object_Access)
   is
   begin
      The_Game.Objects.Append (Object);
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

end Invaders.Games;
