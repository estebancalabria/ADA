with Alumno_Model; use Alumno_Model;
with Profesor_Model; use Profesor_Model;
with Persona_Model; use Persona_Model;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Aula;

procedure Main is
   --  Jaimito : Alumno := Create("Jaimito");
   --  Einstein : Profesor := Create("Eintein");

   --type Persona is access all C_Persona'Class;

   --Una_Persona : T := Jaimito;

   --Otra_Persona : Persona := Einstein;
   --package Promedio_IO is new Ada.Text_IO.Float_IO(Promedio_Notas);
   --package Promedio_IO is new Ada.Text_IO.Float_IO(Num => Promedio_Notas));
   --use Promedio_IO;

   --  procedure Show_Alumno(A : Alumno) is
   --  begin
   --     Put_Line(A.To_String);
   --  end;


   --  package Curso_Ada is new Aula(Tipo_Integrantes   => Alumno,
   --                                Mostrar_Integrante => Show_Alumno);

   --P : Persona := new C_Persona'(Nombre => To_Unbounded_String("Demo")); --cannot allocate abstract object
begin
   --Agregarle al proyecto el profesor_model
   --Adentro una clase profesor
   --Los profesores tienen:
   --Un constructor
   --un nombre
   --un To_String
   --Cursos_Dictados : Integer
   --Un Dictar_Curso que incrementa en uno cursos dictados


   --  Ada.Float_Text_IO.Default_Exp := 0;
   --
   --  Put_Line(Jaimito.To_String);
   --  Jaimito.Rendir_Examen(2);
   --  Jaimito.Rendir_Examen(5);
   --  Jaimito.Rendir_Examen(5);
   --  Jaimito.Rendir_Examen(3);
   --  Jaimito.Rendir_Examen(7);
   --
   --  Put("Mi Promedio de notas es ");
   --  Put(Float(Jaimito.Calcular_Promedio));
   --  New_Line;
   --
   --  Put_Line("El curso esta dictado por");
   --  Put_Line(Einstein.To_String);
   --
   --
   --  Put_Line("Presentando el curso");
   --  Curso_Ada.Asistentes.Append(Jaimito);
   --  Curso_Ada.Mostrar_Asistentes;
   declare
      Mario : Alumno := Create("Mario");
      Iñigo : Alumno := Create("Iñigo");
      David : Alumno := Create("David");
      Esteban : Profesor := Create("Esteban");

      Una_Persona : Persona := null;
   begin
      Una_Persona := Persona(Mario);
      Put_Line(Una_Persona.To_String);
      Una_Persona := Persona(Esteban);
      Put_Line(Una_Persona.To_String);

   end;

  end Main;
