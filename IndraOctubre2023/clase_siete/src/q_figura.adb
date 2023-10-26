with Ada.Text_IO; use Ada.Text_IO;

package body Q_Figura is

   
   function F_Crear_Figura(V_Base:Natural; V_Altura:Natural) return T_Figura is
   begin
      return (R_Base => V_Base, R_Altura => V_Altura);
   end;
   
   function F_Crear_Figura(V_Base:Natural; V_Altura:Natural) return T_Limited_Figura is
   begin
      return (R_Base => V_Base, R_Altura => V_Altura);
   end;
   
   function F_Crear_Figura(V_Base:Natural; V_Altura:Natural) return T_Figura_Requiere_Inicializacion is
   begin
      return (R_Base => V_Base, R_Altura => V_Altura);
   end;
   
   function F_Crear_Figura(V_Base:Natural; V_Altura:Natural) return T_Tagged_Figura is
   begin
      return (R_Base => V_Base, R_Altura => V_Altura);
   end;
   
   procedure P_Mostrar_Figura(V_Figura : T_Figura) is
   begin
      Put_Line("Figura (Base=" & V_Figura.R_Base'Image 
               &",Altura=" & V_Figura.R_Altura'Image & ")");
   end;
   
   function Get_Base(V_Figura:T_Tagged_Figura) return Natural is
   begin
      return V_Figura.R_Base;
   end;
   
   function Get_Altura(V_Figura:T_Tagged_Figura) return Natural is
   begin
      return V_Figura.R_Altura;
   end;  
 
   procedure Set_Base(V_Figura: in out T_Tagged_Figura; V_Base:Natural) is
   begin
      V_Figura.R_Base := V_Base;
   end;
   
   procedure Set_Altura(V_Figura: in out T_Tagged_Figura; V_Altura:Natural) is
   begin
      V_Figura.R_Altura := V_Altura;
   end;
   
   
end Q_Figura;
