package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import domain.Board;
import domain.Criteria;
import utils.DBConn;

public class BoardDao {
	private static BoardDao boardDao = new BoardDao();
	public static BoardDao getInstance() {
		return boardDao;
	}
	private BoardDao() {
	}
	
	public List<Board> list(Criteria cri) {
		List<Board> list = new ArrayList<Board>();
		try {
			Connection conn = DBConn.getConnection();
			
			String sql = "SELECT B.*,(SELECT COUNT(*) FROM KB_REPLY R WHERE R.BNO = B.BNO) REPLYCNT\n" + 
					"FROM(\n" + 
					"SELECT\n" + 
					"    /*+ INDEX_DESC(KB_BOARD PK_BOARD)*/\n" + 
					"    BNO, \n" + 
					"    TITLE, \n" + 
					"    HITCOUNT, \n" + 
					"    CASE\n" + 
					"        WHEN SYSDATE - REGDATE > 1 THEN TO_CHAR(REGDATE, 'YY/MM/DD')\n" + 
					"        ELSE TO_CHAR(REGDATE, 'HH24:MI:SS')\n" + 
					"    END REGDATE,\n" + 
					"    CATEGORY, \n" + 
					"    WRITER, \n" + 
					"    ROWNUM RN\n" + 
					"FROM KB_BOARD\n" + 
					"WHERE CATEGORY = ?\n" + 
					"AND ROWNUM <= ?\n" + 
					") B\n" + 
					"WHERE RN > ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cri.getCategory());
			pstmt.setInt(2, cri.getPageNum() * cri.getAmount());
			pstmt.setInt(3, (cri.getPageNum() - 1 ) * cri.getAmount());
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board(rs.getLong(1), rs.getString(2), null, 
						rs.getInt(3), rs.getString(4),rs.getInt(5), rs.getString(6));
				board.setReplyCnt(rs.getInt("REPLYCNT"));
				list.add(board);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void register(Board board) {
		try {
			Connection conn = DBConn.getConnection();
			
			String sql = "SELECT SEQ_BOARD.NEXTVAL FROM DUAL";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			board.setBno(rs.getLong(1));
			
			sql = "INSERT INTO KB_BOARD(BNO, TITLE, CONTENT, WRITER, CATEGORY) "
					+ "VALUES (?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			int idx = 1;
			pstmt.setLong(idx++, board.getBno());
			pstmt.setString(idx++, board.getTitle());
			pstmt.setString(idx++, board.getContent());
			pstmt.setString(idx++, board.getWriter());
			pstmt.setInt(idx++, board.getCategory());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void modify(Board board) {
		try {
			Connection conn = DBConn.getConnection();
			
			String sql = "UPDATE KB_BOARD SET\r\n" + 
					"TITLE = ?,\r\n" + 
					"CONTENT = ?,\r\n" + 
					"REGDATE = SYSDATE\r\n" + 
					"WHERE BNO = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setLong(3, board.getBno());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void modifyNullByWriter(String writer) {
		try {
			Connection conn = DBConn.getConnection();
			
			String sql = "UPDATE KB_BOARD SET\r\n" + 
					"WRITER = NULL\r\n" + 
					"WHERE WRITER = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, writer);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void remove(Long bno) {
		try {
			Connection conn = DBConn.getConnection();
			
			String sql = "DELETE KB_BOARD\r\n" + 
					"WHERE BNO = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, bno);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public Board get(Long bno) {
		Board board = null;
		try {
			Connection conn = DBConn.getConnection();
			
			String sql = "UPDATE KB_BOARD SET\r\n" + 
					"HITCOUNT = HITCOUNT + 1\r\n" + 
					"WHERE BNO = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, bno);
			
			pstmt.executeUpdate();
			
			sql = "SELECT BNO, TITLE, CONTENT, HITCOUNT, \r\n" + 
					"CASE\r\n" + 
					"    WHEN SYSDATE - REGDATE > 1 THEN TO_CHAR(REGDATE, 'YY/MM/DD')\r\n" + 
					"    ELSE TO_CHAR(REGDATE, 'HH24:MI:SS')\r\n" + 
					"END REGDATE,\r\n" + 
					"CATEGORY, WRITER FROM KB_BOARD WHERE BNO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, bno);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int idx = 1;
				board = new Board(rs.getLong(idx++), rs.getString(idx++), rs.getString(idx++), 
						rs.getInt(idx++), rs.getString(idx++), rs.getInt(idx++), rs.getString(idx++));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return board;
	}
	
	public int count(Criteria cri) {
		int count = 0;
		try {
			Connection conn = DBConn.getConnection();
			
			String sql = "SELECT COUNT(*) FROM KB_BOARD WHERE CATEGORY = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cri.getCategory());
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
}

