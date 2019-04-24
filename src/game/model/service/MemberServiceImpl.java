package game.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.common.exception.DataNotFoundException;
import game.common.exception.DeleteFailException;
import game.common.exception.EditFailException;
import game.model.domain.Member;
import game.model.repository.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	public void insert(Member member) {
	}

	public List selectAll() {
		return memberDAO.selectAll();
	}

	public Member select(int member_id) throws DataNotFoundException {
		Member member = memberDAO.select(member_id);
		if (member == null) {
			throw new DataNotFoundException("유저 조회 실패");
		}
		return member;
	}

	public void update(Member member) throws EditFailException {
		int result = 0;
		result = memberDAO.update(member);
		if (result == 0) {
			throw new EditFailException("유저 정보 수정 실패");
		}
	}

	public void delete(int member_id) throws DeleteFailException {
		int result = 0;
		result = memberDAO.delete(member_id);
		if (result == 0) {
			throw new DeleteFailException("유저 탈퇴 실패");
		}
	}

	public Member search(String id) throws DataNotFoundException {
		Member member = memberDAO.search(id);
		if (member == null) {
			throw new DataNotFoundException("유저 검색 실패");
		}
		return member;
	}

	public Member checkNick(String nick) {
		return memberDAO.checkNick(nick);
	}

	public Member checkEmail(String email) {
		return memberDAO.checkEmail(email);
	}
}