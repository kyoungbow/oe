package service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;

import domain.Board;
import domain.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
public class BoardServiceTests {
	private BoardService boardService = BoardService.getInstance();
	
	@Test
	public void testExist() {
		log.info(boardService);
		assertNotNull(boardService);
	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<Board> list = boardService.list(cri);
		log.info(list);
	}
	@Test
	public void testGet() {
		log.info(boardService.get(542L));
	}
	
	@Test
	public void testRegister() {
		Board board = new Board();
		Criteria cri = new Criteria();
		
		board.setTitle("service-test");
		board.setContent("service-test-content");
		board.setWriter("kyoungbow");
		board.setCategory(1);
		boardService.register(board);
		
		log.info(boardService.list(cri));
	}
	
	@Test
	public void testModify() {
		Board board = boardService.get(554L);
		log.info(boardService.get(554L));
		board.setTitle("service-test-modify");
		board.setContent("service-modify-content");
		boardService.modify(board);
		log.info(boardService.get(549L));
	}
	
	@Test
	public void testRemove() {
		boardService.remove(525L);
		log.info(boardService.get(524L));
	}
	@Test
	public void testCount() {
		Criteria cri = new Criteria(); 
		cri.setCategory(3);
		boardService.count(cri);
		log.info(boardService.list(cri));
	}
	
}
