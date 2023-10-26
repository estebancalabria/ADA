with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Q_String_Utils is
   
   type String_Vector is array (Positive range <>) of Unbounded_String;

   function F_Replace_All(V_Source : String; V_Buscado:String; V_Reemplazo:String) return String;
   
   function F_Split(V_Source:String; V_Delimiter:String) return String_Vector;
   
   procedure P_Test_Count;
   
   procedure P_Test_Index;
     
   procedure P_Test_Replace;
   
   procedure P_Test_F_Replace_All;
   
   procedure P_Test_F_Split;

end q_string_utils;
