package game.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.common.exception.DataNotFoundException;
import game.common.exception.DeleteFailException;
import game.common.exception.EditFailException;
import game.common.exception.RegistFailException;
import game.model.domain.Event;
import game.model.domain.Event_Game;
import game.model.domain.Game;
import game.model.repository.EventDAO;
import game.model.repository.Event_GameDAO;

@Service
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDAO eventDAO;
	@Autowired
	private Event_GameDAO event_GameDAO;

	public void insert(Event event) throws RegistFailException {
		int result = 0;
		int result2 = 0;

		int result1 = eventDAO.insert(event);
		if (result1 == 0) {
			throw new RegistFailException("�̺�Ʈ ��� ����");
		} else {
			for (int i = 0; i < event.getGame_id().length; i++) {
				Event_Game event_game = new Event_Game();
				event_game.setEvent(event);

				Game game = new Game();
				game.setGame_id(event.getGame_id()[i]);
				event_game.setGame(game);

				result2 = event_GameDAO.insert(event_game);
				if (result2 == 0) {
					throw new RegistFailException("���ӿ� �̺�Ʈ ���� ����");
				}
			}
		}
	}

	public List selectAll() {
		return eventDAO.selectAll();
	}

	public Event select(int event_id) throws DataNotFoundException {
		Event event = eventDAO.select(event_id);
		if (event == null) {
			throw new DataNotFoundException("�̺�Ʈ ��ȸ ����");
		}
		return event;
	}

	public void update(Event event) throws EditFailException, DeleteFailException, RegistFailException {
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;

		result1 = eventDAO.update(event);
		if (result1 == 0) {
			throw new EditFailException("�̺�Ʈ ���� ����");
		} else {
			result2 = event_GameDAO.delete(event.getEvent_id());
			if (result2 == 0) {
				throw new DeleteFailException("���ӿ� �̺�Ʈ ��� ����");
			} else {
				for (int i = 0; i < event.getGame_id().length; i++) {
					Event_Game event_game = new Event_Game();
					event_game.setEvent(event);

					Game game = new Game();
					game.setGame_id(event.getGame_id()[i]);
					event_game.setGame(game);
					result3 = event_GameDAO.insert(event_game);
					if (result3 == 0) {
						throw new RegistFailException("���ӿ� �̺�Ʈ ��� ����");
					}
				}
			}
		}
	}

	public void delete(int event_id) throws DeleteFailException {
		int result1 = 0;
		int result2 = 0;

		result1 = event_GameDAO.delete(event_id);
		if (result1 == 0) {
			throw new DeleteFailException("������ �̺�Ʈ ���� ����");
		} else {
			result2 = eventDAO.delete(event_id);
			if (result2 == 0) {
				throw new DeleteFailException("�̺�Ʈ ���� ����");
			}
		}
	}

	public List selectGame(int event_id) {
		return event_GameDAO.selectGame(event_id);
	}

	public Event search(String event_name) throws DataNotFoundException {
		Event event = eventDAO.search(event_name);
		if (event == null) {
			throw new DataNotFoundException("�̺�Ʈ �˻� ����");
		}
		return event;
	}
}