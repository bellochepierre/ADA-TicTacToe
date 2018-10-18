with Grid; use Grid;
package Player is

   type T_Player is abstract tagged private;
   type T_Player_Access is access all T_Player'Class;
   
   procedure getNextPlay(This : in T_Player;
                         Grille : in T_Grid_Access; 
                         X,Y : out Integer) is abstract;
   -- pre : not Grille.isFull;
   -- post : Grille.getCase(X,Y) = Vide;
   
private
   
   type T_Player is abstract tagged null record;

   

end Player;
