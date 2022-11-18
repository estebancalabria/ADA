with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Vectors;
with IO; use IO;
with Generic_IO;

procedure Main is
begin

   --  declare
   --                                  --Index-Type
   --     type Arreglo_Entero is array (Positive range <>) of Integer;
   --                                                         --Element_Type
   --     --al Instanciarlo tengo que definir el size
   --
   --     package Integer_Array_List is new Ada.Containers.Vectors
   --       (Element_Type => Integer,
   --        Index_Type => Positive);
   --     use Integer_Array_List;
   --
   --     Arreglo : Arreglo_Entero(1..3); --Defino el Size
   --     Lista : Integer_Array_List.Vector;     --Es Dinamica, el size va variando
   --     --Es lo mismo que hacer Lista:Vector;
   --
   --  begin
   --
   --     --  Insert code here.
   --     --- LLeno el arreglo con 3 elementos
   --     Arreglo(1) := 32;
   --     Arreglo(2) := 33;
   --     Arreglo(3) := 50;
   --     --Ejemplo de invocar un metodo especificando el paquete donde esta
   --     Ada.Text_IO.Put_Line("El contenido del arreglo estatico es");
   --     for Valor of Arreglo loop
   --        Put_Line(Valor'Image);
   --     end loop;
   --
   --
   --     --Lleno la lista con 3 elementos
   --     Append(Lista, 32);
   --     Append(Lista, 33);
   --     Append(Lista, 50);
   --     Put_Line("El contenido de la lista dinamica es");
   --     for Valor of Lista loop
   --        Put_Line(Valor'Image);
   --     end loop;
   --  end;

   --  declare
   --     --Generar una lista dinamica (Vector o contenedor) de notas
   --     --Preguntar al usuario notas hasta que ingrese un 0
   --     --Luego Mostrarla
   --     type Entrada_Nota is new Integer range 0..10;
   --     subtype Nota is Entrada_Nota range 1 .. 10;
   --
   --     package Integer_Array_List is new Ada.Containers.Vectors
   --       (Element_Type => Nota, Index_Type => Positive);
   --     use Integer_Array_List;
   --
   --     Lista_Notas   : Integer_Array_List.Vector;
   --     --Dato_entrada : Integer;
   --     --Lo pase a...
   --     Dato_entrada : Entrada_Nota;
   --  begin
   --     loop
   --        --Dato_entrada:= Get_Integer_Between(0, Integer(Nota'Last),"Di una Nota. Cero Para Terminar");
   --        --Lo reemplazo por (Me gustaria evitar el casteo en la siguiente linea igual)
   --        Dato_entrada:= Entrada_Nota(Get_Integer_Between(Integer(Entrada_Nota'First), Integer(Entrada_Nota'Last),"Di una Nota. Cero Para Terminar"));
   --
   --        --Si comneto el if va a intentar agregar un 0 en la lista y va a dar un error
   --        if(Dato_entrada/=0) then
   --           --Append (Lista_Notas, Nota(Dato_entrada));
   --           --Lo reemplazo por
   --           Append (Lista_Notas, Dato_entrada);
   --        end if;
   --        exit when (Dato_entrada=0);
   --     end loop;
   --
   --     Put_Line ("Tus notas son:");
   --     for Valor of Lista_Notas loop
   --        Put_Line (Valor'Image);
   --     end loop;
   --     Put_Line ("");
   --  end;
   --

   declare
      type Dias is (Lunes,Martes,Miercoles,Jueves,Viernes,Sabado,Domingo);

      package Dias_IO is new Generic_IO (Tipo => Dias);
      use Dias_IO;

      Dia: Dias;
   begin
      Dia := Get_Discrete("Ingrese un dia");
      Put_Line(Dia'Image);


   end;


   null;
end Main;
