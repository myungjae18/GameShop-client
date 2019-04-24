package game.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import game.common.board.Pager;
import game.common.exception.DataNotFoundException;
import game.model.domain.Category;
import game.model.domain.Game;
import game.model.service.CategoryService;
import game.model.service.GameService;

@RestController
public class RestGameController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private GameService gameService;
	@Autowired
	private Pager pager;

	@RequestMapping(value = "/rest/admin/categories/{category_id}", method = RequestMethod.GET)
	public Category getCategory(@PathVariable("category_id") int category_id) {
		return categoryService.select(category_id);
	}

	@RequestMapping(value = "/rest/admin/categories", method = RequestMethod.GET)
	public List getCategories() {
		return categoryService.selectAll();
	}

	@RequestMapping(value = "/rest/admin/gamePagers", method = RequestMethod.GET)
	public Pager paging(@RequestParam("currentPage") int currentPage) {
		List<Game> gameList = gameService.selectAll();
		pager.init(currentPage, gameList.size());
		return pager;
	}

	@RequestMapping(value = "/rest/admin/games", method = RequestMethod.GET)
	public List getGames() {
		return gameService.selectAll();
	}

	@RequestMapping(value = "/rest/admin/games/{game_id}", method = RequestMethod.GET)
	public Game getGameDetail(@PathVariable("game_id") int game_id) {
		return gameService.select(game_id);
	}

	@RequestMapping(value = "/rest/admin/game/images", method = RequestMethod.GET)
	public List getGameImage(@RequestParam("game_id") int game_id) {
		return gameService.selectImg(game_id);
	}

	@RequestMapping(value = "/rest/admin/searchgame", method = RequestMethod.GET)
	public Game searchGames(@RequestParam("game_name") String game_name) {
		return gameService.search(game_name);
	}
}