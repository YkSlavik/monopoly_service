SELECT * FROM SavedPlayerGame;
SELECT * FROM Game;
SELECT * FROM PlayerGame;


--The following query returns Dogbreath’s scores from all the games he/she played in
SELECT score
FROM Player, PlayerGame
WHERE Player.ID = PlayerGame.playerID
  AND Player.name = 'Dogbreath';
