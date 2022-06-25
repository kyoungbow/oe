package dao;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;

import domain.Attach;
import domain.Board;
import domain.Criteria;
import domain.Reply;
import lombok.extern.log4j.Log4j;

@Log4j
public class ReplyDaoTests {
	private ReplyDao replyDao = ReplyDao.getInstance();
	
	@Test
	public void testExist() {
		log.info(replyDao);
		assertNotNull(replyDao);
	}
	@Test
	public void testList() {
		List<Reply> replies = replyDao.list(552L);
		log.info(replies);
	}
	
	@Test
	public void testRegister() {
		Reply reply = new Reply();
		reply.setContent("reply-test");
		reply.setBno(552L);
		reply.setWriter("kyoungbow");
		
		replyDao.register(reply);
		log.info(replyDao.list(552L));
	}
	
	@Test
	public void testRemove() {
		replyDao.remove(208L);
		log.info(replyDao.list(552L));
	}
	
	@Test
	public void testRemoveAll() {
		replyDao.removeAll(553L);
		log.info(replyDao.list(553L));
	}
	
	@Test
	public void testModify() {
		Reply reply = replyDao.get(207L);
		reply.setContent("reply-content-modify");
		replyDao.modify(reply);
		
		log.info(replyDao.get(207L));
	}
	
	@Test
	public void testModifyNullByWriter() {
		Reply reply = replyDao.get(207L);
		log.info(reply);
		replyDao.modifyNullByWriter(reply.getWriter());
		log.info(replyDao.list(552L));
	}
	
	@Test
	public void testGet() {
		replyDao.get(207L);
		log.info(replyDao.get(207L));
	}
}
