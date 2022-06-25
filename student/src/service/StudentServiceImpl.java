package service;

import static utils.StudentUtil.nextInt;
import static utils.StudentUtil.nextLine;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

import app.Test;
import domain.Student;
import exception.RangeException;

public class StudentServiceImpl implements StudentService{
	List<Student> students = new ArrayList<Student>();
	{
		
		try {
			ObjectInputStream ois = new ObjectInputStream(new FileInputStream("students.ser")); 
			students = (List<Student>) ois.readObject();
		} catch (FileNotFoundException e) {
			String[] names = {"김수한무거북이", "김경보","김동엽", "김상현", "김승종", "김예찬", "김치형", "김태윤"};
			
			for(int i = 0 ; i < names.length ; i++) {
				students.add(new Student(220000 + i + 1 + "", names[i]));
			}
			System.out.println("임시 데이터 초기화 완료");
		} catch (IOException e) {
			e.printStackTrace();
			System.exit(0);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	
	// 1. 조회하기
	public void list() {
//		System.out.println("학번        이름        국어        영어        수학        총점        평균\r\n" + 
//				"=============================================================================");
		System.out.println(String.format("%s%s%s%s%s%s%s"
				, Test.convert("학번", 10)
				, Test.convert("이름", 20)
				, Test.convert("국어", 10)
				, Test.convert("영어", 10)
				, Test.convert("수학", 10)
				, Test.convert("총점", 10)
				, Test.convert("평균", 10)
				));
		System.out.println("====================================================================================");
		for(Student s : students) {
			System.out.print(Test.convert(s.getNo(), 10));
			System.out.print(Test.convert(s.getName(), 20));
			System.out.print(Test.convert(s.getKor()+"", 10));
			System.out.print(Test.convert(s.getEng()+"", 10));
			System.out.print(Test.convert(s.getMat()+"", 10));
			System.out.print(Test.convert(s.sum()+"", 10));
			System.out.print(Test.convert(s.avg()+"", 10));
			System.out.println();
		}
	}
	// 2. 등록하기
	public void register() {
		students.add(new Student(nextLine("학번 >"), nextLine("이름 >", true), 
				nextInt("국어 >"), nextInt("영어 >"), nextInt("수학 >")));
		save();
	}
	
	// 3. 수정하기
	public void modify() {
		Student student = findBy(nextLine("수정할 학생의 학번 >"));
		if(student == null) {
			System.out.println("존재하지 않는 학번입니다");
			return;
		}
		student.setName(nextLine("이름 > ", true));
		
		student.setKor(nextInt("국어 > "));
		student.setEng(nextInt("영어 > "));
		student.setMat(nextInt("수학 > "));
		save();
	}
	// 10ms 12ms
	// 4. 삭제하기
	public void remove() {
		students.remove(findBy(nextLine("수정할 학생의 학번 >")));
		save();
	}
	private Student findBy(String no) {
		Student student = null;
		for(Student s : students) {
			if(s.getNo().equals(no)) {
				student = s;
			}
		}
		return student;
	}
	private void save() {
		ObjectOutputStream oos;
		try {
			oos = new ObjectOutputStream(new FileOutputStream("students.ser"));
			oos.writeObject(students);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

