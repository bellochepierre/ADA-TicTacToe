with Game; use Game;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   Jeu : T_Game_Access := new T_Game'(Game.Constructor.Initialize);
begin

   Jeu.play;

end Main;
