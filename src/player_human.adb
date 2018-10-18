with Ada.Text_IO; use Ada.Text_IO;
with Case_Value; use Case_Value;
package body Player_Human is

   overriding procedure getNextPlay(This : in T_Player_H;
                                    Grille : in T_Grid_Access; 
                                    X,Y : out Integer) is
      Valid_Coordinates : Boolean := False;
   begin
      
      while not Valid_Coordinates loop
         
         This.input2Int(X, Y);
         
         if X in 1..Grid.SIZE and Y in 1..Grid.SIZE then
            Valid_Coordinates := Grille.getCase(X, Y) = Vide;
         end if;
         
         if not Valid_Coordinates then
            Put_Line("Merci de rentrer des coordonnees valides");
         end if;
         
      end loop;
      
   end getNextPlay;
   
   procedure input2Int(This : in T_Player_H; X, Y : out Integer) is
      S : String(1..10) := (others => ' ');
      Last : Integer;
      Pos : Integer;
      FoundSpace : Boolean := False;
   begin
      Put_Line("Please select position :");
   
      Get_Line(S, Last);
      
      for i in 2..Last loop
         if S(i-1)=' ' and S(i)/=' ' then
            Pos := i;
            exit;
         end if;
      end loop;
               
      X := Integer'Value(S(1..Pos-1));
      Y := Integer'Value(S(Pos..Last));
      
   exception
      when others =>
         X := 0;
         Y := 0;
   end input2Int;
   
      
      

   

end Player_Human;
