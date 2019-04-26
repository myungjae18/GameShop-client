package game.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.common.exception.DataNotFoundException;
import game.common.exception.DeleteFailException;
import game.common.exception.EditFailException;
import game.common.exception.RegistFailException;
import game.model.domain.Game;
import game.model.domain.Game_Img;
import game.model.repository.GameDAO;
import game.model.repository.Game_ImgDAO;

@Service
public class GameServiceImpl implements GameService {
	@Autowired
	private GameDAO gameDAO;
	@Autowired
	private Game_ImgDAO game_imgDAO;

	public void insert(Game game, String[] myFile_name) throws RegistFailException {
		int result1 = 0;
		int result2 = 0;

		result1 = gameDAO.insert(game);
		if (result1 == 0) {
			throw new RegistFailException("���� ��� ����");
		} else {
			for (int i = 0; i < myFile_name.length; i++) {
				Game_Img game_img = new Game_Img();
				game_img.setGame(game);
				game_img.setImg_filename(myFile_name[i]);
				result2 = game_imgDAO.insert(game_img);
				if (result2 == 0) {
					throw new RegistFailException("���� �̹��� ��� ����");
				}
			}
		}
	}

	public List selectAll() {
		return gameDAO.selectAll();
	}

	public Game select(int game_id) throws DataNotFoundException {
		Game game = gameDAO.select(game_id);
		if (game == null) {
			throw new DataNotFoundException("���� ��ȸ ����");
		}
		return game;
	}

	public void update(Game game) throws EditFailException {
		int result=0;
		result = gameDAO.update(game);
		if (result == 0) {
			throw new EditFailException("���� ���� ���� ����");
		}
	}

	public void updateAll(Game game, String[] myFile_name)
			throws DeleteFailException, RegistFailException, EditFailException {
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		result1 = game_imgDAO.delete(game.getGame_id());
		if (result1 == 0) {
			throw new DeleteFailException("���� �̹��� ���� ����");
		} else {
			for (int i = 0; i < myFile_name.length; i++) {
				Game_Img game_img = new Game_Img();
				game_img.setGame(game);
				game_img.setImg_filename(myFile_name[i]);
				result2 = game_imgDAO.insert(game_img);
				if (result2 == 0) {
					throw new RegistFailException("���� �̹��� ��� ����");
				} else {
					result3 = gameDAO.update(game);
					if (result3 == 0) {
						throw new EditFailException("���� ���� ���� ����");
					}
				}
			}
		}
	}

	public void delete(int game_id) throws DeleteFailException {
		int result1 = 0;
		int result2 = 0;

		result1 = game_imgDAO.delete(game_id);
		if (result1 == 0) {
			throw new DeleteFailException("���� �̹��� ���� ����");
		} else {
			result2 = gameDAO.delete(game_id);
			if (result2 == 0) {
				throw new DeleteFailException("���� ���� ����");
			}
		}
	}

	public Game search(String game_name) {
		return gameDAO.search(game_name);
	}

	public List selectImg(int game_id) {
		return game_imgDAO.selectImg(game_id);
	}

	@Override
	public List selectByCategory(int category_id) {
		return gameDAO.selectByCategory(category_id);
	}
}