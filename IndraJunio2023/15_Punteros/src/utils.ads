package utils is

      generic
         --type T is private; --Este no funciona porque es cualquier tipo
         type T is (<>); -- El generico admite escalares (rangos/enumerados)
      function Generic_Prompt
        (V_MSG : String := "Introduzca un valor: ";
         V_MSG_ERROR : String := "Valor Incorrecto") return T;

end utils;
