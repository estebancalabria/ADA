with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Modelo; use Modelo;


procedure Main is
begin
   -- Ejemplo 1 - Todo en el Stack
   --  declare
   --        --Un_Animal : Clase_Animal;  --Error
   --                             --No me deja porque Clase_Animal es abstract.
   --                             --Este objeto viviria en el Stack
   --
   --     Turuleca : Clase_Gallina;  -- Instancio una gallina en el Stack
   --                                --Si tuviera un atriburo y la quiero instanciar
   --                                --Turuleca : Clase_Gallina := (Nombre => To_Unbounded_String("Turu"));
   --
   --
   --     Rango : Clase_Iguana; --Instancio la iguana en el Stack
   --
   --     La_De_Los_Huevos_De_Oro : Clase_Gallina := Turuleca; --Como estoy en el stack
   --                                                          --Se copian los datos (Aunque no hay nada que copiar)
   --
   --
   --
   --  begin
   --     Put_Line(Turuleca.To_String);
   --     Put_Line(Rango.To_String);
   --     --Hasta aqui Tengo 3 objetos distintos: Turuleca, Rango y La_De_Los_Huevos_De_Oro en el Stack
   --     declare
   --        --Class-Wide Declaration
   --        --Puede almacenar cualquier objeto que herede de anima;
   --        --Un_Animal : Clase_Animal'Class;  --Como esta en stack tengo que decile justamente que tipo de objeto tiene
   --                                           --Si o Si los tengo que inicializar
   --
   --        --Opciones Validas
   --        --Un_Animal : Clase_Animal'Class := Rango;
   --        Un_Animal : Clase_Animal'Class := Turuleca; --Copio a Turuleca
   --        --Un_Animal : Clase_Animal'Class := Clase_Gallina'(others => <>);
   --     begin
   --        --Ahora tengo 4 objetos en el stack Los 3 de antes y uno nuevo
   --        Put_Line(Un_Animal.To_String);
   --        null;
   --     end;
   --  end;

   declare
      Turuleca : Access_Animal := new Clase_Gallina; --Turuleca vive en el heap
      Rango : Access_Animal := new Clase_Iguana;  --Rango Vive en el heap tambien
      Animal : Access_Animal := Rango; --Animal tiene una referencia a un objeto que ya existe
   begin
      --Ahora tengo 2 objetos que viven en el hep, Rango y Turuleca
      Put_Line(Turuleca.To_String);
      Put_Line(Rango.To_String);
      Put_Line(Animal.To_String);
   end;


end Main;
