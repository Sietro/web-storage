package com.inc.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inc.dao.QnaDao;
import com.inc.dao.QnaReplyDao;
import com.inc.domain.Board;
import com.inc.domain.Reply;
import com.inc.util.Pager;

@Service
public class QnaService {

	@Autowired
	private QnaDao boardDao;
	
	@Autowired
	private QnaReplyDao replyDao;
	
	public  String getPaging(int page) {
		int total = boardDao.getTotalCount();
		return Pager.paging("qna",page, total);
	}

	public List<Board> getBoardList(int page, String users_id) {
		int start = (page - 1) * Pager.BOARDS + 1;
		int end = start + Pager.BOARDS - 1;
		
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("users_id", users_id);
		
		List<Board> boardList = boardDao.selectListFromBoard(map);
		setDateOrTime(boardList);
		return boardList;
	}

	private void setDateOrTime(List<Board> boardList) {
		Calendar today = Calendar.getInstance();
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH)+1;
		int day= today.get(Calendar.DATE);
		String todayStr = year+"-"+month+"-"+day;
		for(Board board : boardList) {
			String date = board.getRegdate().substring(0, board.getRegdate().indexOf(" "));
			String time = board.getRegdate().substring(board.getRegdate().indexOf(" ")+1);
			if(todayStr.equals(date)) {
				board.setRegdate(time);
			} else {
				board.setRegdate(date);
			}
		}
	}

	public void add(Board board) {
		boardDao.insertBoard(board);
	}

	public Board getBoard(int id) {
		return boardDao.selectOneFromBoard(id);
	}

	public void deleteBoard(int id) {
		boardDao.deleteBoard(id);
	}

	public void updateBoard(Board board) {
		boardDao.updateBoard(board);
	}

	public void hitUp(int id) {
		boardDao.hitUp(id);
	}
	
	public void addReply(Reply reply) {
		replyDao.insertReply(reply);
	}

	public void addRereply(Reply reply) {
		Reply parentReply = replyDao.selectOneFromReply(reply.getRef());
		reply.setDepth(parentReply.getDepth() + 1);
		int step = 0;
		while(true) {
			step = replyDao.selectBrotherStep(parentReply);
			if(step != 0) {
				reply.setStep(step);
				replyDao.pushReply(reply);
				break;
			}
			if(parentReply.getRef() == 0) {
				step = replyDao.selectMaxStep(reply.getBoard_id());
				reply.setStep(step);
				break;
			}
			parentReply = replyDao.selectOneFromReply(parentReply.getRef());
		}
		replyDao.insertRereply(reply);
	}
}
