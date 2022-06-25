package service;

import exception.RangeException;

public interface StudentService {
	void list();
	
	void register();
	
	void modify() throws RangeException;
	
	void remove();
}
