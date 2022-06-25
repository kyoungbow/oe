package domain;

import java.io.Serializable;
import java.util.Arrays;

// VO
// 생성자 만드세요
// 복사copy 복제clone
public class Student implements Serializable{
	// 학번, 이름, 국어, 영어, 수학
	private String no;
	private String name;
	private int kor; // 0 ~ 100
	private int eng;
	private int mat;
	
	
	public Student() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Student(String no, String name) {
		this(no, name, getScore(), getScore(), getScore());
	}



	public Student(String no, String name, int kor, int eng, int mat) {
		super();
		this.no = no;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}



	public String getNo() {
		return no;
	}



	public void setNo(String no) {
		this.no = no;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public int getKor() {
		return kor;
	}



	public void setKor(int kor) {
		this.kor = kor;
	}



	public int getEng() {
		return eng;
	}



	public void setEng(int eng) {
		this.eng = eng;
	}



	public int getMat() {
		return mat;
	}



	public void setMat(int mat) {
		this.mat = mat;
	}



	// 총점, 평균
	public int sum() {
		return this.kor + this.eng + this.mat;
	}
	
	public double avg() {
		return (int)(sum() / 3d * 100) / 100d;
	}

	// 점수 랜덤
	private static int getScore() {
		return (int)(Math.random() * 41) + 60;
	}
	
	public String toString() {
		String str = getNo() + "     " + getName() + "        " + kor + "          " + eng+
				"          " + mat + "          " + sum() +	"        " + avg();
		return str;
	}
	
}
