
package JuegoSettings is

   type EnteroEntre1y100 is range 1..100;

   function Is_EnteroEntre1y100(Valor:String) return Boolean;
   
   function Get_EnteroEntre1y100 return EnteroEntre1y100;
end JuegoSettings;
