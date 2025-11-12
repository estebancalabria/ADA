package Grades is

   type Grade is new Integer range 1..30;
   type Grade_Interpretation_Enum is (Fail, Passed, Good, Very_Good, Excelent, Exceptional);
   type Grade_Interpretation_Array is array (Grade) of Grade_Interpretation_Enum;
  
   Passing_Grade : constant Grade := 18;
   Grade_Interpretation : constant Grade_Interpretation_Array := 
     ( 1..17 => Fail,
       18..21 => Passed,
       22..25 => Good,
       26..28 => Very_Good,
       29 => Excelent,
       30 => Exceptional);
   
   subtype Grade_Approved is Grade range Passing_Grade..Grade'Last;
   subtype Grade_Failed is Grade range 1..Passing_Grade-1;
   
   function Is_Approved(G: Grade) return Boolean;
   function To_String(G: Grade) return String;

end Grades;
