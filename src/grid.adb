with Ada.Text_IO; use Ada.Text_IO;
package body Grid is

   package body Constructor is
      
      function Initialize return T_Grid is
         Grid : T_Grid;
      begin
         for x in 1..SIZE loop
            for y in 1..SIZE loop
               Grid.setCase( x, y, Vide);
            end loop;
         end loop;
         
         Grid.Winner := Vide;
         return Grid;
      end Initialize;
      
      function DeepCopy(Source : in T_Grid_Access) return T_Grid is
         Grid : T_Grid;
      begin
         for x in 1..SIZE loop
            for y in 1..SIZE loop
               Grid.setCase(x, y, Source.getCase(x, y));
            end loop;
         end loop;
         
         Grid.Winner := Vide;
         return Grid;
      end DeepCopy;
         
   end Constructor;
   
   function getCase(This: in T_Grid; X, Y : in Integer) return T_Case_Value is
   begin
      return This.Contenu(X + (Y-1)*SIZE);
   end getCase;
   
   procedure setCase(This: in out T_Grid; X, Y : in Integer; Value : in T_Case_Value) is
   begin
      This.Contenu(X + (Y-1)*SIZE) := Value;
   end setCase;
   
   procedure Afficher(This : in T_Grid) is
      DashLine : string(1..1+SIZE*4);
   begin
      
      for i in DashLine'Range loop
         DashLine(i) := '-';
      end loop;
            
      Put_Line(DashLine);
      for Y in 1..SIZE loop
         for X in 1..SIZE loop
            
            case This.getCase(X,Y) is
               when Vide => Put("|   ");
               when Croix => Put("| X ");
               when Rond => Put("| O ");
            end case;
            
         end loop;
         Put_Line("|");
         Put_Line(DashLine);
      end loop;
   end Afficher;
            
   function isGameOver(This : access T_Grid) return Boolean is
      X : Integer;
      isWinner : Boolean := False;
   begin
      
      X := 1;
      while X <= SIZE and not isWinner loop
         
         if This.checkLine(X) or This.checkColumn(X) then
            isWinner := True;
            This.Winner := This.getCase(X,X);
         end if;
         
         X := X+1;
      end loop;
      
      if not isWinner and This.checkFirstDiag then
         isWinner := True;
         This.Winner := This.getCase(1,1);
         
      end if;
      
      if not isWinner and This.checkSecondDiag then
         isWinner := True;
         This.Winner := This.getCase(1, SIZE);         
      end if;
      
      if not isWinner and This.isFull then
         This.Winner := Vide;    
         return True;
      end if;
      
      return isWinner;
   end isGameOver;
      
   function getWinner(This : in T_Grid) return T_Case_Value is
   begin
      return This.Winner;
   end getWinner;
   
   function isFull(This : in T_Grid) return Boolean is
   begin
      
      for Y in 1..SIZE loop
         for X in 1..SIZE loop
            if This.getCase(X, Y) = Vide then
               return False;
            end if;
         end loop;
      end loop;
      return True;
      
   end isFull;
   
      
   --Zone Privée
   function checkColumn(This : in T_Grid; X : Integer) return Boolean is
      Ref : T_Case_Value := This.getCase(X,1);
   begin
      
      if Ref = Vide then
         return False;
      end if;
      
      for Y in 2..SIZE loop
         if Ref /= This.getCase(X,Y) then
            return False;
         end if;
      end loop;
      
      return True;
   end checkColumn;
      
   function checkLine(This : in T_Grid; Y : Integer) return Boolean is
      Ref : T_Case_Value := This.getCase(1,Y);
   begin
      
      if Ref = Vide then
         return False;
      end if;
      
      for X in 2..SIZE loop
         if Ref /= This.getCase(X,Y) then
            return False;
         end if;
      end loop;
      
      return True;
   end checkLine;
     
   function checkFirstDiag(This : in T_Grid) return Boolean is
      Ref : T_Case_Value := This.getCase(1,1);
   begin
      
      if Ref = Vide then
         return False;
      end if;
      
      for X in 2..SIZE loop
         if Ref /= This.getCase(X,X) then
            return False;
         end if;
      end loop;
      
      return True;
   end checkFirstDiag;
         
   function checkSecondDiag(This : in T_Grid) return Boolean is
      Ref : T_Case_Value := This.getCase(1,SIZE);
   begin
      
      if Ref = Vide then
         return False;
      end if;
      
      for X in 2..SIZE loop
         if Ref /= This.getCase(X,SIZE+1 - X) then
            return False;
         end if;
      end loop;
      
      return True;
   end checkSecondDiag;
   
end Grid;
