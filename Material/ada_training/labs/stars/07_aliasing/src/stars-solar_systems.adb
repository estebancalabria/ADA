package body Stars.Solar_Systems is

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
      Sun     : Star_Index :=
        Create (Solar_System, Create_Solar_Star);
      Earth   : Star_Index :=
        Create (Solar_System, Create_Simple_Planet (Sun, 0.01, 40.0));
      Moon    : Star_Index :=
        Create (Solar_System, Create_Moon (Earth, 0.01, 40.0));
      Jupiter : Star_Index :=
        Create (Solar_System,
                Create_Planet_With_Rings (Sun, -0.005, 70.0));
      Comet   : Star_Index :=
        Create (Solar_System, Create_Comet (Sun, 0.01, 30.0, 150.0));
   begin
      null;
   end Initialize;

end Stars.Solar_Systems;
