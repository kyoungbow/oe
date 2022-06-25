package com.recyclebin.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recyclebin.domain.AuthVO;
import com.recyclebin.domain.BoardVO;
import com.recyclebin.domain.BookmarkVO;
import com.recyclebin.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberMapperTests {
	@Setter @Autowired
	private PasswordEncoder encoder;
	@Setter @Autowired
	private MemberMapper mapper;
	
	@Test
	public void testInsertMember() {
		MemberVO vo = new MemberVO();
		vo.setId("map3");
		vo.setPassword(encoder.encode("1234"));
		vo.setNickname("mapper");
		vo.setName("map3");
		vo.setResident("999");		
		vo.setAccount("99");
		vo.setPhone("9");
		vo.setEmail("9999@gmail.com");
		
		vo.setZipcode("12345");
		vo.setRoadAddress("석정로 497번길");
		vo.setAddress("간석4동 617-43");
		vo.setDetailAddress("빌라");
		vo.setLatitude("33.33333333");
		vo.setLongitude("127.777777777");
		
		log.info(vo);
		
		mapper.insertMember(vo);
	}
	
	@Test
	public void testInsertAuth() {
		AuthVO vo = new AuthVO();
		vo.setId("map3");
//		vo.setAuth("ROLE_MEMBER");
		vo.setAuth("ROLE_MANAGER");
//		vo.setAuth("ROLE_ADMIN");
		
		log.info(vo);
		mapper.insertAuth(vo);
	}
	
	@Test
	public void testRead() {
//		mapper.read("test123");
		log.info(mapper.read("kyoungbow"));
	}
	
	@Test
	public void testUpdateMember() {
		MemberVO vo = mapper.read("map3");
		// 변경가능 - 닉네임, 비밀번호
//		vo.setNickname("banana");
		vo.setPassword("");
//		vo.setPassword(encoder.encode("12345"));
		
		log.info(vo);
		
		mapper.updateMember(vo);
	}

	@Test
	public void testUpdateAddress() {
		MemberVO vo = new MemberVO();
		// 변경가능 - 주소
		
		vo.setZipcode("123456");
		vo.setRoadAddress("범로");
		vo.setAddress("십정2동");
		vo.setDetailAddress("빌라");
		vo.setLatitude("40.396382500780156");
		vo.setLongitude("160.11283209252038");
		
		vo.setId("map3");
		
		log.info(vo);
		
		mapper.updateAddress(vo);
	}
	
	@Test
	public void testUpdateAuth() {
		AuthVO vo = new AuthVO();
		vo.setId("map3");
		vo.setAuth("ROLE_MEMBER");
//		vo.setAuth("ROLE_MANAGER");
//		vo.setAuth("ROLE_ADMIN");
		
		log.info(vo);
		mapper.updateAuth(vo);
	}
	
	@Test
	public void testDeleteMember(){
		mapper.deleteMember("map3");
	}

	@Test
	public void testDeleteAuth(){
		mapper.deleteAuth("map3");
	}

	@Test
	public void testBlackList(){
		mapper.blackList("map3");
	}
	
	@Test
	public void testReadScore() {
		log.info(mapper.readScore("test1"));
	}

	@Test
	public void testMemberList() {
		List<MemberVO> list = mapper.getMemberList();
		log.info(list);
	}
	
	@Test
	public void testAuthList() {
		List<AuthVO> list = mapper.getAuthList();
		log.info(list);
	}
	
	
	@Test
	public void testInsertBookmark() {
		BookmarkVO vo = new BookmarkVO();
		vo.setId("test1");
		vo.setBookmark1("강남구 대치동");
		vo.setBookmark2("서울시 동작구");
		vo.setBookmark3("서울시 서대문구");
		
		mapper.insertBookmark(vo);
	}
	
	@Test
	public void testUpdateBookmark() {
		BookmarkVO vo = new BookmarkVO();
		vo.setId("test1");
		vo.setBookmark1("강남구 대치동");
		vo.setBookmark2("인천시 남동구");
		vo.setBookmark3("서울시 서대문구");
		
		mapper.updateBookmark(vo);
	}
	
	@Test
	public void testDeleteBookmark() {
		mapper.deleteBookmark("test1");
	}
	
	@Test
	public void testReadBookmark() {
		mapper.readBookmark("test1");
	}
	
	@Test
	public void testSearchId() {
		log.info(mapper.SearchId("test12@naver.com"));
	}
	
//	@Test
//	public void testSearchPassword() {
//		log.info(mapper.SearchPassword("test12@naver.com"));
//	}
	
//	@Test
//	public void testCountDeal() {
//		
//	}
	
	@Test
	public void testCountPost() {
		log.info(mapper.CountPost("test1"));
	}
	
	@Test
	public void testCountScore() {
		log.info(mapper.CountScore("test1"));
	}
}
