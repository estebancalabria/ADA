with Containers;

package Stars.Systems is new Containers
  (Object_Type    => Star_Record,
   Object_Access  => Star_Access,
   No_Object      => No_Star,
   Default_Object => Central_Star);
