with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

begin
   --  declare
   --     A : Integer := 10;
   --     B : Integer := A;
   --  begin
   --     B := 20;
   --     Put_Line(A'Image);
   --  end;

   --  declare
   --     A: access Integer;
   --     --es lo mismo que hacer
   --     --  type Puntero_Entero is access Integer;
   --     --  A : Puntero_Entero;
   --  begin
   --     A := null; --Si lo comento igual entra al if porque por defecto los access tienen null
   --     --A := 2;  --No es una asignacion valida
   --     if (A = null) then
   --        Put_Line("La variable A no esta inicializada y no apunta a nada");
   --     end if;
   --
   --     A := new Integer'(2);
   --     Put_Line(A.all'Image);
   --
   --     null;
   --  end;

   declare
      type Puntero_Entero is access Integer;
      AA : Puntero_Entero := new Integer'(30);
      BB : Puntero_Entero := AA;
   begin
      BB.all := 50;  --Cambio el valor que tiene en el heap a travez del puntero
      Put_Line(AA.all'Image);  --Ahora muestra 50 porque AA y BB "apuntan" al mismo lugar en el heap
   end;


   null;
end Main;
