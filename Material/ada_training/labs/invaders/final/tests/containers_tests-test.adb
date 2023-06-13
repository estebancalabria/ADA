with Ada.Text_IO; use Ada.Text_IO;

procedure Containers_Tests.Test is
   C : Object_Container;
begin
   C ("First") := new Root'(1, 2);
   C ("Second") := new Root'(3, 4);
   C ("Third") := new Grand_Child'(5, 6, others => <>);
   C ("Fourth") := new Child'(7, 8, others => <>);

   Put_Line ("LOOP 1");

   for E of C loop
      Put_Line (E.A'Img);
   end loop;

   Put_Line ("LOOP 2");

   for I in C.Iterate (Child'Tag) loop
      Put_Line (C (I).A'Img);
   end loop;

end Containers_Tests.Test;
