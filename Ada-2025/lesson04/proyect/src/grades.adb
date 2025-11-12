package body Grades is

   function Is_Approved(G: Grade) return Boolean is
   begin
      return G >= Passing_Grade;
   end Is_Approved;
   
   function To_String(G: Grade) return String is
   begin
      return G'Image;
   end;
   
   
end Grades;
