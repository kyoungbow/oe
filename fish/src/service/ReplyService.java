package service;

import java.util.List;

import dao.ReplyDao;
import domain.Reply;

public class ReplyService {
	private static ReplyService replyService = new ReplyService();
	public static ReplyService getInstance() {
		return replyService;
	}
	private ReplyService() {}
	
	private ReplyDao replyDao = ReplyDao.getInstance();	
	
	public List<Reply> list(Long bno) {
		return replyDao.list(bno);
	}
	public Reply get(Long rno) {
		return replyDao.get(rno);
	}
	public void register(Reply reply) {
		replyDao.register(reply);
	}
	
	public void modify(Reply reply) {
		replyDao.modify(reply);
	}
	
	public void remove(Long rno) {
		replyDao.remove(rno);
	}
	
}
