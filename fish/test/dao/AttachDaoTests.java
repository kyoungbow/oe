package dao;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;

import domain.Attach;
import lombok.extern.log4j.Log4j;

@Log4j
public class AttachDaoTests {
	private AttachDao attachDao = AttachDao.getInstance();
	
	@Test
	public void testExist() {
		log.info(attachDao);
		assertNotNull(attachDao);
	}
	@Test
	public void testList() {
		List<Attach> attachs = attachDao.list(542L);
		log.info(attachs);
	}
	
	@Test
	public void testInsert() {
		Attach attach = new Attach();
		attach.setUuid("test-Uuid");
		attach.setOrigin("test-Origin");
		attach.setPath("test-Path");
		attach.setImage(true);
		attach.setOrd(1);
		attach.setBno(542L);
		attachDao.insert(attach);
		log.info(attach);
		
	}
	
	@Test
	public void testRemove() {
		attachDao.remove(542L);
		log.info(attachDao.list(542L));
	}
	
}
