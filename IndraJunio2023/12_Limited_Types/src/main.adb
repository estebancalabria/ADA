with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Secreto; use Secreto;
with Juego_De_Rol; use Juego_De_Rol;

procedure Main is
   --   S : Valor_Secreto := 43; La asignacion no funciona porque es un tipo Limited
   ---  S: Valor_Secreto;

   function Prompt(Mensaje : String := "Ingrese un texto") return Unbounded_String is
      Entrada_Correcta : Boolean := False;
      Entrada : Unbounded_String := To_Unbounded_String("");
   begin
      Put_Line(Mensaje);
      while not(Entrada_Correcta) loop

         Entrada  := To_Unbounded_String(Get_Line);

         if Trim(To_String(Entrada), Ada.Strings.Both)'Length > 0 then
            Entrada_Correcta := True;
         else
            Put_Line("Ha Ingresado un String Vacio Vuelva a intentar");
         end if;


      end loop;
      return Entrada;
   end;

   procedure Put_Line(Mensaje:Unbounded_String) is
   begin
      Put_Line(To_String(Mensaje));
   end Put_Line;


begin
   -- Put_Line("Vamos a ver los tipos Limited");
   -- Set_Valor_Secreto(S, 44); --Solo lo puedo hacer mediante sus metodos
   --S:= S+2; No puedo modificar la variable con la suma
   --  declare
   --     Nombre : Unbounded_String := Prompt("Ingrese su Nombre");
   --     Apellido : Unbounded_String := Prompt("Ingrese su Apellido");
   --     NickName : Unbounded_String := Prompt("Ingrese su Nombre");
   --  begin
   --     Put_Line(Nombre);
   --     Put_Line(Apellido);
   --     Put_Line(NickName);
   --  end;

   --  declare
   --     type Persona is record
   --        Nombre : Unbounded_String;
   --        Apellido : Unbounded_String;
   --        NickName : Unbounded_String;
   --     end record;
   --
   --     Cliente : Persona;
   --  begin
   --     Cliente.Nombre :=  Prompt("Ingrese su Nombre");
   --     Cliente.Apellido :=  Prompt("Ingrese su Apellido");
   --     Cliente.NickName := Prompt("Ingrese su Nombre");
   --
   --     Put_Line(Cliente.Nombre);
   --     Put_Line(Cliente.Apellido);
   --     Put_Line(Cliente.NickName);
   --  end;
   --

   declare
      Ryu: Jugador := Crear(Initial_Hp => 100, Initial_Fuerza => 10);
      Ken: Jugador := Crear(Initial_Hp => 110, Initial_Fuerza => 9);
   begin
      --Ken := Crear(Initial_Hp => 110, Initial_Fuerza => 9); --Limited Private me restrinje esto
      --Ryu := Ken; --Limited Private me restrinje la copia
      while (Esta_Vivo(Ryu) and Esta_Vivo(Ken)) loop
         Put_Line("Ryu : Hadouuuuuuuuuuuuuuuuuuuken");
         Ataque(Ryu,Ken);
         Put_Line("Ken : Hadouuuuuuuuuuuuuuuken");
         Ataque(Ken,Ryu);
      end loop;

      Put_Line("El Ganador es " & (if Esta_Vivo(Ryu) then "Ryu!" else "Ken!"));
   end;


end Main;
