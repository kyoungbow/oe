package service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import dao.MemberDao;
import domain.Member;
import lombok.extern.log4j.Log4j;

@Log4j
public class MemberServiceTests {
	private MemberService memberService = MemberService.getInstance();

	
	@Test
	public void testExist() {
		log.info(memberService);
		assertNotNull(memberService);
	}
	
	@Test
	public void testRegister() {
		Member member = new Member();
		member.setId("service-register");
		member.setPw("5678");
		member.setName("테스트");
		memberService.register(member);
		
		log.info(memberService.get("service-register"));
		
	}
	@Test
	public void testLogin() {
		Member member = new Member();
		member.setId("kyoungbow");
		member.setPw("5678");
		member = memberService.login(member);
		log.info(member);
	}
	
	@Test
	public void testGet() {
		String id = "kyoungbow";
		log.info(memberService.get(id));
	}
	
	@Test
	public void testFindby() {
		String email = "goodday759@naver.com";
		log.info(memberService.findBy(email));
	}
	@Test
	public void testUpdateAuthToken() {
		Member member = new Member();
		member.setAuthToken("service-test");
		member.setId("goodday2");
		memberService.updateAuthToken(member);
		log.info(memberService.get("goodday2"));
	}
	
	@Test
	public void testUpdateAuth() {
		Member member = new Member();
		member.setAuth("1");
		member.setId("goodday2");
		memberService.updateAuth(member);
		log.info(memberService.get("goodday2"));
		
	}
	
	@Test
	public void testModify() {
		Member member = memberService.get("goodday1");
		log.info(memberService.get("goodday1"));
		member.setPw("7777");
		member.setName("test-name");
		memberService.modify(member);
		log.info(memberService.get("goodday1"));
	}
	@Test
	public void testRemove() {
		Member member = new Member();
		member.setId("goodday1");
		memberService.remove(member);
		log.info(memberService.get("goodday1"));
	}
	
}
