with Case_Value; use Case_Value;
package body Player_Bot_Retard is

   procedure getNextPlay(This : in T_Player_BR;                                 
                         Grille : in T_Grid_Access;
                         X,Y : out Integer) is
   begin
      
      X := 1;
      Y := 1;
      for j in 1..3 loop
         for i in 1..3 loop
            if Grille.getCase(i, j)=Vide then
               X := i;
               Y := j;
               return;
            end if;
         end loop;
      end loop;
     
   end getNextPlay;
              

end Player_Bot_Retard;
