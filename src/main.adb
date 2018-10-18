with Grid; use Grid;
with Ada.Text_IO; use Ada.Text_IO;
with Case_Value; use Case_Value;
with Game; use Game;

procedure Main is
   Jeu : T_Game_Access := new T_Game'(Game.Constructor.Initialize);
begin

   Jeu.play;

end Main;
