
package Calendario is

   type Dias_Semana is
     (Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo);
   type Meses is
     (Enero, Febrero, Marzo, Abril, Mayo, Junio, Julio, Agosto, Septiembre,
      Octubre, Noviembre, Diciembre);
   type Estacion is (Invierno, Primavera, Verano, Otoño);
   
   type Dia_Del_Mes is new Integer range 1..31;
   type Años is new integer range 1900..2100;
   
   type Fecha is record
      Dia : Dia_Del_Mes;
      Mes : Meses;
      Año : Años;
      --Año : range 1900..2100; se puede HAcer
   end record;
   
   
   procedure Mostrar_Dias;
   procedure Mostrar_Meses;   
   function To_String(Date:Fecha) return String;

end Calendario;
