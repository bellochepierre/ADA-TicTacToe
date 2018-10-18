package Player_Human is

   type T_Player_H is new T_Player with private;
   type T_Player_H_Access is access T_Player_H;
   type T_Player_H_CAccess is access T_Player_H'Class;
   
   overriding procedure getNextPlay(This : in T_Player_H;
                         Grille : in T_Grid_Access; 
                                    X,Y : out Integer);
   
private
      type T_Player_H is new T_Player with null Record;

   

end Player_Human;
