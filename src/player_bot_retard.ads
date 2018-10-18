with Player; use Player;
with Grid; use Grid;
package Player_Bot_Retard is

   type T_Player_BR is new T_Player with private;
   
   procedure getNextPlay(This : in T_Player_BR;
                         Grille : in T_Grid_Access; 
                         X,Y : out Integer);
   
private
   
      type T_Player_BR is new T_Player with null Record;


end Player_Bot_Retard;
