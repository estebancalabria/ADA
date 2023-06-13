with Stars.Systems; use Stars.Systems;

package Stars.Physics is

   procedure Move (System : in out Star_System; The_Star : in out Star_Record);

   procedure Move_All (Stars : in out Star_System);

end Stars.Physics;
