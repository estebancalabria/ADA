with Object_Containers;

package Containers_Tests is

   type Root is tagged record
      A, B : Integer;
   end record;

   type Root_Access is access all Root'Class;

   procedure Free (This : in out Root) is null;

   type Child is new Root with record
      C : Integer;
   end record;

   type Grand_Child is new Child with record
      D : Integer;
   end record;

   package Containers is new Object_Containers (Root, Root_Access, Free);
   use Containers;

end Containers_Tests;
