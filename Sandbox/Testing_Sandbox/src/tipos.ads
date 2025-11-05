package Tipos is

   type Duracion is new Float;

   -- Tipos de medida (distintos, incompatibles entre sí)
   type Ms  is new Duracion;  -- milisegundos
   type S   is new Duracion;  -- segundos
   type Min is new Duracion;  -- minutos
   type H   is new Duracion;  -- horas

   function N return S;

end Tipos;
