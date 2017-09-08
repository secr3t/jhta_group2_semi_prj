package pro.criteria.vo;

public class Criteria {

	private String opt;
	private String keyword;
	private int studentNo;
	private int lecturerNo;
	private int courseNo;
	private int beginIndex;
	private int endIndex;
	private String noAnswer;
	private int deptNo;
	
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	
	public String getOpt() {
		return opt;
	}
	public void setOpt(String opt) {
		this.opt = opt;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(int studentNo) {
		this.studentNo = studentNo;
	}
	public int getLecturerNo() {
		return lecturerNo;
	}
	public void setLecturerNo(int lecturerNo) {
		this.lecturerNo = lecturerNo;
	}
	public int getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}
	public int getBeginIndex() {
		return beginIndex;
	}
	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	public String getNoAnswer() {
		return noAnswer;
	}
	public void setNoAnswer(String noAnswer) {
		this.noAnswer = noAnswer;
	}
	@Override
	public String toString() {
		return "Criteria [opt=" + opt + ", keyword=" + keyword + ", studentNo=" + studentNo + ", lecturerNo="
				+ lecturerNo + ", courseNo=" + courseNo + ", beginIndex=" + beginIndex + ", endIndex=" + endIndex
				+ ", noAnswer=" + noAnswer + "]";
	}
	
	
}
