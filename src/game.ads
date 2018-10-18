with Player; use Player;
package Game is

   type T_Game is tagged private;
   type T_Game_Access is access all T_Game;
   
   package Constructor is
      
      function Initialize return T_Game;
      
   end Constructor;
   
   procedure play(This : in out T_Game);
   
private
   
   type T_Game is tagged record
      PlayerCroix, PlayerRond : T_Player_Access;
   end record;
   
end Game;
