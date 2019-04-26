package game.model.service;

import java.util.List;

import game.model.domain.Event;

public interface EventService {
	public void insert(Event event);
	public List selectAll();
	public Event select(int event_id);
	public void update(Event event);
	public void delete(int event_id);
	public List selectGame(int event_id);
	public Event search(String event_name);
	public List eventGameList();
}