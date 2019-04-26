package game.model.service;

import java.util.List;

import game.model.domain.Game;

public interface GameService {
   public void insert(Game game, String[] myFile_name);
   public List selectAll();
   public Game select(int game_id);
   public void update(Game game);
   public void updateAll(Game game, String[] myFile_name);
   public void delete(int game_id);
   public Game search(String game_name);
   public List selectImg(int game_id);
   public List selectByCategory(int category_id);
}