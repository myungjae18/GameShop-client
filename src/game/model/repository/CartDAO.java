package game.model.repository;

import java.util.List;

import game.model.domain.Cart;

public interface CartDAO {
	public List selectAll(int member_id);
	public int insert(Cart cart);
	public int select(int cart_id);
}
