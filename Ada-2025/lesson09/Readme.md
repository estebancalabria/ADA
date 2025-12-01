# Lesson - Dec 01, 2025

# Summary

* Access types (Ada way of handling pointers)
    * type Float_Pointer is access Float;
    * .all
      * (for dereferencing the pointer)
    * new Type'()
    * Null_Pointer := null
    * When they point to some address they cannot be changed and point to another variable.
* Access all types
    * type Float_All_Pointers is access all Float;
    * When you want a Variable to be pointed with an access declare it
        * Number : aliased Float;
* Access with Records
    * You can ommit the .all and use an access to a record as a normal record
* Access to procedures/function
    * Similar to functional programing
 
  
  
