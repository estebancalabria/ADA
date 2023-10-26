package Q_Figura is

   --En ads van la definicion de los procedimientos y funciones y de los tipos
  
   --Puedo declarar varibles de este tipo pero no se como estan compuestas
   type T_Figura is private;
   type T_Limited_Figura is limited private;
   type T_Figura_Requiere_Inicializacion (<>) is private; --Oblico a que las variables se tenga que inicializar
   type T_Limited_Figura_Requiere_Inicializacion (<>) is limited private; --Oblico a que las variables se tenga que inicializar
   
   
   --constructor
   function F_Crear_Figura(V_Base:Natural; V_Altura:Natural) return T_Figura;
   function F_Crear_Figura(V_Base:Natural; V_Altura:Natural) return T_Limited_Figura;
   function F_Crear_Figura(V_Base:Natural; V_Altura:Natural) return T_Figura_Requiere_Inicializacion;
   
   
   procedure P_Mostrar_Figura(V_Figura : T_Figura);
   
   --
   --type T_Tagged_Figura is tagged record
   --   R_Base:Natural;
   --   R_Altura : Natural;
   -- end record;
   
   --type T_Tagged_Figura is tagged private;
   --type T_Tagged_Figura is tagged limited private;
   type T_Tagged_Figura (<>) is tagged private;
   --type T_Tagged_Figura (<>) is tagged limited private;
   
   function F_Crear_Figura(V_Base:Natural; V_Altura:Natural) return T_Tagged_Figura;
   function Get_Base(V_Figura:T_Tagged_Figura) return Natural;
   function Get_Altura(V_Figura:T_Tagged_Figura) return Natural;
   procedure Set_Base(V_Figura: in out T_Tagged_Figura; V_Base:Natural);
   procedure Set_Altura(V_Figura: in out T_Tagged_Figura; V_Altura:Natural);

   
private
   
   --type T_Tagged_Figura is tagged limited record
   type T_Tagged_Figura is tagged record
      R_Base:Natural;
      R_Altura : Natural;
   end record;
   
   type T_Figura is record
      R_Base:Natural;
      R_Altura : Natural;
   end record;
   
   type T_Limited_Figura is limited record
      R_Base:Natural;
      R_Altura : Natural;
   end record;
   
   type T_Figura_Requiere_Inicializacion is record
      R_Base:Natural;
      R_Altura : Natural;
   end record;
   
   type T_Limited_Figura_Requiere_Inicializacion is limited record
      R_Base:Natural;
      R_Altura : Natural;
   end record;


end Q_Figura;
