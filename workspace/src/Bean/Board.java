package Bean;

public class Board {
	/*************************************
	 * Static
	 ************************************/
	private static String FMT_BOARD_TOSTRING = "Member [no=%s, subject=%s, writer=%s, content=%s, regdate=%s, groupno=%s, orderno=%s, depth=%s]";
	
	/*************************************
	 * Variable
	 * 데이터베이스의 컬럼 이름과 동일하게 하는게 실수를 줄일 수 있다.
	 ************************************/
	private int no;
	private String subject;
	private String writer;
	private String content;
	private String regdate;
	
	private int groupno;
	private int orderno;
	private int depth;
	
	/*************************************
	 * Construct
	 ************************************/
	public Board() {}
	
	/*************************************
	 * toString
	 ************************************/
	@Override
	public String toString() {
		return String.format(FMT_BOARD_TOSTRING, no, subject, writer, content, regdate, groupno, orderno, depth);
	}
	
	
	/*************************************
	 * Getter & Setter
	 ************************************/
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getGroupno() {
		return groupno;
	}
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
}
