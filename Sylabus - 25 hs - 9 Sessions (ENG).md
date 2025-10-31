# **Ada Programming – 9-Session Course Syllabus**

## **Session 1 – First Steps in Ada: Syntax, Types, Attributes, Subprograms, and Packages**
- Why Ada? The philosophy behind a strongly typed language  
- Installing **GNAT Studio**  
- Writing your first **Hello World** program  
- **Primitive data types**: `Integer`, `Float`, `Boolean`, `Character`  
- **Constants** and immutability  
- **Type attributes**: `'First`, `'Last`, `'Size`, `'Image`, `'Value`, etc.
- Enum
- Ranges 
- Introduction to **subprograms**: procedures and functions  
- Parameter modes: `in`, `out`, `in out`  
- Return values and type consistency  
- Creating and using **packages**: specification (`.ads`) and body (`.adb`)  
- Basic package organization and visibility  

---

## **Session 2 – Strong Typing: Subtypes, New Types, and Predicates**
- Strongly typed vs. weakly typed languages  
- Understanding the **Ada type hierarchy**  
- **Subtypes**: constrained views of existing types  
  - Range constraints (`subtype Positive is Integer range 1 .. Integer'Last;`)  
  - Compatibility with base type  
- **New (derived) types**: creating distinct, incompatible types  
  - `type My_Count is new Integer;`  
  - Type safety through incompatibility  
  - When and why to use derived types  
- **Predicates**: enforcing additional constraints on types  
  - **Static predicates**: checked at compile time  
    - Example: `type Power_Of_Two is new Positive with Static_Predicate => Power_Of_Two in 2 | 4 | 8 | 16;`  
  - **Dynamic predicates**: checked at runtime (`Dynamic_Predicate`)  
  - Differences and use cases for each  
- **Operator overloading** basics (needed for derived types and predicates)  

---

## **Session 3 – Strings, Input, and Exception Handling**
- **Strings** in Ada: fixed vs. unbounded  
- **User input** with `Ada.Text_IO`  
- Safe input handling and conversion (`Value`, `Image`)  
- **Exception handling**: `raise`, `when`, `others`  
- Handling invalid input and conversion errors  

---

## **Session 4 – Control Structures and Code Flow**
- **Conditional statements**: `if`, `elsif`, `else`, `case`  
- **Loops**: `while`, `for` (with ranges and iterators)  
- Nesting control structures  
- Best practices for readable and safe control flow  

---

## **Session 5 – Arrays and Records**
- **Arrays**: declaration, initialization, bounds  
- **Array iteration**: `for ... in`, `for ... of`  
- **Multidimensional arrays**  
- **Records**: defining structured composite types  
- Combining arrays and records for data modeling  

---

## **Session 6 – Advanced Numeric Types and Access Types**
- **Floating-point types** and precision  
- **Fixed-point and decimal types** for financial or exact arithmetic  
- **Numeric attributes** and range checks  
- Introduction to **access types** (safe pointers)  
- Dynamic allocation with `new`  
- Memory safety: `Unchecked_Deallocation` (used responsibly)  
- Practical example: simple linked list  

---

## **Session 7 – Standard Library and Common Packages**
- Overview of the **Ada standard library**  
- **Unbounded strings** (`Ada.Strings.Unbounded`)  
- **Enumerations** and custom discrete types  
- Essential predefined packages:  
  - `Ada.Text_IO`, `Ada.Integer_Text_IO`, `Ada.Float_Text_IO`  
  - `Ada.Numerics` and `Ada.Numerics.Float_Random`  
- Generating random numbers safely  

---

## **Session 8 – Generics**
- **Generic units**: purpose and benefits  
- Defining **generic packages** and **generic subprograms**  
- Instantiating generics with concrete types  
- Constraints in generic formal parameters (`with private`, `with function`, etc.)  
- Building reusable, type-safe abstractions with generics  

---

## **Session 9 – Modular Design and Object-Oriented Programming**
- Advanced **package design**: private types, child packages  
- **Encapsulation** and visibility rules (`private`, `limited private`)  
- Reusing code through **packages + generics**  
- Introduction to **OOP in Ada**:  
  - **Tagged types**  
  - **Type extension** (inheritance)  
  - **Primitive operations** (methods)  
  - **Polymorphism** with class-wide types and dispatching  
