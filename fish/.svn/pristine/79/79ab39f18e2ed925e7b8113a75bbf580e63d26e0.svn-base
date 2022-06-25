package domain;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
@Builder
public class Board {
	
	private Long bno ;
	private String title;
	private String content;
	private int hitcount; 
	private String regDate;
	private int category;
	
	private String writer; 
	
	private List<Attach> attachs = new ArrayList<>();
	private int replyCnt;
	
	public Board(String title, String content, String writer, int category) {
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.category = category;
				
	}
	
	public Board(Long bno, String title, String content, int category) {
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.category = category;
	}
	
	public Board(Long bno, String title, String content, int hitcount, String regDate, int category, String writer) {
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.hitcount = hitcount;
		this.regDate = regDate;
		this.category = category;
		this.writer = writer;
	}
	
}
