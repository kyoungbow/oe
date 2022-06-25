package domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDto {
	private static final int PAGE_COUNT = 10;
	
	private int start;
	private int end; 
	private int total; 
	private boolean next; 
	private boolean prev; 
	private Criteria cri; 
	
	
	public PageDto(int total, Criteria cri) {
		this.total = total;
		this.cri = cri;
		
		end = (cri.getPageNum() + (PAGE_COUNT-1)) / PAGE_COUNT * PAGE_COUNT;
		start = end - PAGE_COUNT + 1;
		
		int realEnd= (total + (cri.getAmount()-1)) / cri.getAmount();
		if (realEnd < end) {
			end = realEnd;
		}
		
		prev = cri.getPageNum() > 1;
		next = cri.getPageNum() < realEnd;
		
	}
	
}
