with Player; use Player;
with Grid; use Grid;
package Player_Human is

   type T_Player_H is new T_Player with private;
   
   overriding procedure getNextPlay(This : in T_Player_H;
                                    Grille : in T_Grid_Access; 
                                    X,Y : out Integer);
   
private
   type T_Player_H is new T_Player with null Record;
   
   procedure input2Int(This : in T_Player_H; X, Y : out Integer);

   

end Player_Human;
