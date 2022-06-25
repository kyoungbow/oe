package dao;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import domain.Member;
import lombok.extern.log4j.Log4j;

@Log4j
public class MemberDaoTests {
	private MemberDao memberDao = MemberDao.getInstance();
	
	@Test
	public void testExist() {
		log.info(memberDao);
		assertNotNull(memberDao);
	}
	
	@Test
	public void testRegister() {
		Member member = new Member();
		member.setId("goodday2");
		member.setPw("5678");
		member.setName("굿데이");
		memberDao.register(member);
		
		log.info(memberDao.get("goodday2"));
		
	}
	@Test
	public void testModify() {
		Member member = memberDao.get("goodday1");
		log.info(memberDao.get("goodday1"));
		member.setPw("5555");
		member.setName("test-name");
		memberDao.modify(member);
		log.info(memberDao.get("goodday1"));
	}
	
	@Test
	public void testRemove() {
		memberDao.remove("goodday2");
		log.info(memberDao.get("goodday2"));
	}
	
	@Test
	public void testGet() {
		String id = "kyoungbow";
		log.info(memberDao.get(id));
	}
	@Test
	public void testLogin() {
		Member member = memberDao.login("kyoungbow", "5678");
		log.info(member);
	}
	
	@Test
	public void testFindby() {
		String email = "goodday759@naver.com";
		log.info(memberDao.findBy(email));
	}
	
	@Test
	public void testUpdateAuthToken() {
		Member member = new Member();
		member.setAuthToken("test");
		member.setId("goodday2");
		memberDao.updateAuthToken(member);
		log.info(memberDao.get("goodday2"));
	}
	
	@Test
	public void testUpdateAuth() {
		Member member = new Member();
		member.setAuth("test");
		member.setId("goodday2");
		memberDao.updateAuth(member);
		log.info(memberDao.get("goodday2"));
		
	}
	
}
