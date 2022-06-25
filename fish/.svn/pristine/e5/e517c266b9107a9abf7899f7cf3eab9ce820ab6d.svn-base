package service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;

import domain.Reply;
import lombok.extern.log4j.Log4j;

@Log4j
public class ReplyServiceTests {
	private ReplyService replyService = ReplyService.getInstance();
	
	@Test
	public void testExist() {
		log.info(replyService);
		assertNotNull(replyService);
	}
	@Test
	public void testList() {
		List<Reply> replies = replyService.list(552L);
		log.info(replies);
	}
	@Test
	public void testGet() {
		replyService.get(207L);
		log.info(replyService.get(207L));
	}
	@Test
	public void testRegister() {
		Reply reply = new Reply();
		reply.setContent("service-reply-test");
		reply.setBno(552L);
		reply.setWriter("kyoungbow");
		
		replyService.register(reply);
		log.info(replyService.list(552L));
	}
	
	@Test
	public void testModify() {
		Reply reply = replyService.get(209L);
		reply.setContent("service-reply-content-modify");
		replyService.modify(reply);
		
		log.info(replyService.get(207L));
	}
	
	@Test
	public void testRemove() {
		replyService.remove(216L);
		log.info(replyService.list(552L));
	}
}
