package dao;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import domain.Board;
import domain.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
public class BoardDaoTests {
	private BoardDao boardDao = BoardDao.getInstance();
	
	@Test
	public void testExist() {
		log.info(boardDao);
		assertNotNull(boardDao);
	}
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<Board> boards = boardDao.list(cri);
		log.info(boardDao.list(cri));
	}
	
	@Test
	public void testRegister() {
		Board board = new Board();
		Criteria cri = new Criteria();
		
		board.setTitle("test");
		board.setContent("test-content");
		board.setWriter("kyoungbow");
		board.setCategory(1);
		boardDao.register(board);
		
		log.info(boardDao.list(cri));
		
	}
	
	@Test
	public void testModify() {
		Board board = boardDao.get(549L);
		log.info(boardDao.get(549L));
		board.setTitle("test-modify");
		board.setContent("test-modify-content");
		boardDao.modify(board);
		log.info(boardDao.get(549L));
	}
	
	@Test
	public void testModifyNullByWriter() {
		Board board = boardDao.get(525L);
		log.info(board);
		boardDao.modifyNullByWriter(board.getWriter());
		log.info(board);
	
	}
	
	@Test
	public void testRemove() {
		boardDao.remove(548L);
		log.info(boardDao.get(548L));
	}
	
	@Test
	public void testGet() {
		log.info(boardDao.get(542L));
	}
	@Test
	public void testCount() {
		Criteria cri = new Criteria(); 
		cri.setCategory(3);
		boardDao.count(cri);
		log.info(boardDao.list(cri));
	}
}
