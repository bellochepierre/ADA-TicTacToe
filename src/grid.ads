with Case_Value; use Case_Value;
package Grid is

   type T_Grid is tagged private;
   type T_Grid_Access is access T_Grid;
   
   package Constructor is
      
      function Initialize return T_Grid;
      
      function DeepCopy(Source : in T_Grid_Access) return T_Grid;
      
   end Constructor;
   
   function getCase(This: in T_Grid; X, Y : in Integer) return T_Case_Value;
   
   procedure setCase(This: in out T_Grid; X, Y : in Integer; Value : in T_Case_Value);
   
   procedure Afficher(This : in T_Grid);
   
   function isGameOver(This : access T_Grid) return Boolean;
   
   function getWinner(This : in T_Grid) return T_Case_Value;
   -- pre : This.isGameOver == true;
   -- post : return == Croix || Rond;
   
   
private
   
   GRID_SIZE : constant Integer := 3;
   NBR_OF_CASES : constant Integer := GRID_SIZE * GRID_SIZE;
   
   type T_Grid_Matrix is array(1..NBR_OF_CASES) of T_Case_Value;
   
   type T_Grid is tagged record
      Contenu : T_Grid_Matrix;
      Winner : T_Case_Value;
   end record;
   
   function checkColumn(This : in T_Grid; X : Integer) return Boolean;
   
   function checkLine(This : in T_Grid; Y : Integer) return Boolean;
   
   function checkFirstDiag(This : in T_Grid) return Boolean;
   
   function checkSecondDiag(This : in T_Grid) return Boolean;
   
end Grid;
