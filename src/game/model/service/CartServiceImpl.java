package game.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.common.exception.DataNotFoundException;
import game.common.exception.RegistFailException;
import game.model.domain.Cart;
import game.model.repository.CartDAO;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;

	public List selectAll(int member_id) {
		return cartDAO.selectAll(member_id);
	}

	public void insert(Cart cart) throws RegistFailException {
		int result = cartDAO.insert(cart);
		if (result == 0) {
			throw new RegistFailException("��ٱ��� ��� ����");
		}
	}

	public int select(int cart_id) throws DataNotFoundException {
		int result = cartDAO.select(cart_id);
		if (result == 0) {
			throw new DataNotFoundException("��ٱ��� ��ȸ ����");
		}
		return result;
	}
}
