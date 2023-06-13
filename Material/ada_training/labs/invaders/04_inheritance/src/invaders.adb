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

with Ada.Unchecked_Deallocation;

with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

package body Invaders is

   procedure Free is new Ada.Unchecked_Deallocation (Object, Object_Access);

   -----------------
   -- Create_Game --
   -----------------

   function Create_Game return Game_Record is
      The_Game : Game_Record;
   begin
      The_Game.Player := new Object (Player);
      The_Game.Player.X := 0.0;
      The_Game.Player.Y := -70.0;
      The_Game.Player.Graphic := New_Circle (0.0, -70.0, 10.0, Blue);

      return The_Game;
   end Create_Game;

   -----------
   -- Get_X --
   -----------

   function Get_X (This : Object) return Float is
   begin
      return This.X;
   end Get_X;

   -----------
   -- Set_X --
   -----------

   procedure Set_X (This : in out Object; Value : Float) is
   begin
      if Value in -100.0 .. 100.0 then
         This.X := Value;
      end if;
   end Set_X;

   -----------
   -- Shoot --
   -----------

   procedure Shoot (The_Game : in out Game_Record) is
      New_Ammo : Object_Access;
   begin
      for J in The_Game.Ammos'Range loop
         if The_Game.Ammos (J) = null then
            New_Ammo := new Object (Ammo);
            The_Game.Ammos (J) := New_Ammo;

            exit;
         end if;
      end loop;

      if New_Ammo /= null then
         New_Ammo.X := The_Game.Player.X;
         New_Ammo.Y := The_Game.Player.Y + 10.0;
         New_Ammo.Graphic := New_Line
           (New_Ammo.X,
            New_Ammo.Y,
            New_Ammo.X,
            New_Ammo.Y - 2.0,
            Yellow);
      end if;
   end Shoot;

   ----------------
   -- Create_Foe --
   ----------------

   Seed : Generator;

   procedure Create_Foe (The_Game : in out Game_Record) is
      New_Foe : Object_Access;
   begin
      for J in The_Game.Foes'Range loop
         if The_Game.Foes (J) = null then
            New_Foe := new Object (Foe);
            The_Game.Foes (J) := New_Foe;

            exit;
         end if;
      end loop;

      if New_Foe /= null then
         New_Foe.X := Random (Seed) * 200.0 - 100.0;
         New_Foe.Y := 100.0;
         New_Foe.Graphic := New_Circle
           (New_Foe.X,
            New_Foe.Y,
            5.0,
            Red);
         New_Foe.Speed := Random (Seed) * 0.5 - 0.25;
      end if;
   end Create_Foe;

   -------------
   -- Iterate --
   -------------

   procedure Iterate (The_Game : in out Game_Record) is
      The_Foe : Object_Access;
   begin
      for J in The_Game.Ammos'Range loop
         if The_Game.Ammos (J) /= null then
            The_Game.Ammos (J).Y := The_Game.Ammos (J).Y + 0.6;

            if The_Game.Ammos (J).Y > 100.0 then
               Delete (The_Game.Ammos (J).Graphic);
               Free (The_Game.Ammos (J));
            else
               Redraw (The_Game.Ammos (J).all);
            end if;
         end if;
      end loop;

      for J in The_Game.Foes'Range loop
         if The_Game.Foes (J) /= null then
            The_Foe := The_Game.Foes (J);
            The_Foe.Y := The_Foe.Y - 0.2;

            if The_Foe.Y < -100.0 then
               raise Game_Over;
            else
               The_Foe.X := The_Foe.X + The_Foe.Speed;

               if The_Foe.X not in -100.0 .. 100.0 then
                  The_Foe.Speed := -The_Foe.Speed;
               end if;

               Redraw (The_Foe.all);
            end if;

            for K in The_Game.Ammos'Range loop
               if The_Game.Ammos (K) /= null then
                  declare
                     Dx, Dy : Float;
                     Min_Distance : Float;
                  begin
                     Dx := The_Foe.X - The_Game.Ammos (K).X;
                     Dy := The_Foe.Y - The_Game.Ammos (K).Y;
                     Min_Distance := Get_Radius (The_Foe.Graphic);

                     if Dx * Dx + Dy * Dy < Min_Distance * Min_Distance then
                        Delete (The_Game.Foes (J).Graphic);
                        Free (The_Game.Foes (J));

                        Delete (The_Game.Ammos (K).Graphic);
                        Free (The_Game.Ammos (K));

                        exit;
                     end if;
                  end;
               end if;
            end loop;
         end if;
      end loop;

      Redraw (The_Game.Player.all);
   end Iterate;

   ----------------
   -- Get_Player --
   ----------------

   function Get_Player (The_Game : Game_Record) return Object_Access is
   begin
      return The_Game.Player;
   end Get_Player;

   ------------
   -- Redraw --
   ------------

   procedure Redraw (This : in out Object) is
   begin
      case This.Kind is
         when Player =>
            Set_X (This.Graphic, This.X);
            Set_Y (This.Graphic, This.Y);

         when Foe =>
            Set_X (This.Graphic, This.X);
            Set_Y (This.Graphic, This.Y);

         when Ammo =>
            Set_Y (This.Graphic, This.Y);
            Set_Y2 (This.Graphic, This.Y - 2.0);
      end case;
   end Redraw;

end Invaders;
