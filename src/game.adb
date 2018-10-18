with Grid; use Grid;
with Player_Bot_Retard; use Player_Bot_Retard;
with Case_Value; use Case_Value;
with Ada.Text_IO; use Ada.Text_IO;
with Player_Human; use Player_Human;
package body Game is

   package body Constructor is
      
      function Initialize return T_Game is
         Jeu : T_Game;
      begin
         Jeu.PlayerCroix := new T_Player_H;
         Jeu.PlayerRond := new T_Player_BR;
         return Jeu;
      end Initialize;
            
   end Constructor;
   
   procedure play(This : in out T_Game) is
      nextPlayer : T_Player_Access := This.PlayerCroix;
      grille : T_Grid_Access := new T_Grid;
      X, Y: Integer;
   begin
      
      grille.Afficher;
      
      while not grille.isGameOver loop
         
         nextPlayer.getNextPlay(grille, X, Y);
         Put_Line("Choix de jeu :" & Integer'Image(X) & Integer'Image(Y));
         
         if nextPlayer = This.PlayerCroix then
            grille.setCase(X, Y, Croix);
         else
            grille.setCase(X, Y, Rond);
         end if;
         
         grille.Afficher;

                  
         if nextPlayer = This.PlayerCroix then
            nextPlayer := This.PlayerRond;
         else
            nextPlayer := This.PlayerCroix;
         end if;
                  
      end loop;
   end play;
      
end Game;
