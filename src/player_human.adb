package body Player_Human is

   overriding procedure getNextPlay(This : in T_Player_H;
                         Grille : in T_Grid_Access; 
                                    X,Y : out Integer) is
   begin
      X := 1;
      Y := 2;
   end getNextPlay;
   

end Player_Human;
