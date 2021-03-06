/*package poly.dto;

*//** * @author 이협건
 * @version 1.1 공지사항 DTO
 *//*
public class NoticeDTO {

	private String notice_seq; // 기본키, 순번
	private String title; // 제목
	private String notice_yn; // 공지글 여부
	private String contents; // 글 내용
	private String user_id; // 작성자
	private String read_cnt; // 조회수
	private String reg_id; // 등록자 아이디
	private String reg_dt; // 등록일
	private String chg_id; // 수정자 아이디
	private String chg_dt; // 수정일

	private String user_name; // 등록자명

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getNotice_seq() {
		return notice_seq;
	}

	public void setNotice_seq(String notice_seq) {
		this.notice_seq = notice_seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNotice_yn() {
		return notice_yn;
	}

	public void setNotice_yn(String notice_yn) {
		this.notice_yn = notice_yn;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getRead_cnt() {
		return read_cnt;
	}

	public void setRead_cnt(String read_cnt) {
		this.read_cnt = read_cnt;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getChg_id() {
		return chg_id;
	}

	public void setChg_id(String chg_id) {
		this.chg_id = chg_id;
	}

	public String getChg_dt() {
		return chg_dt;
	}

	public void setChg_dt(String chg_dt) {
		this.chg_dt = chg_dt;
	}

}
*/
package poly.dto;

public class BoardDTO {
	//DTO : Data Transfer Object
		//데이터 전송을 위한 객체
		//DTO 형식은 데이터베이스 형식과 똑같이 만드는게 보편적임
	
	private String fantNo;
	private String ntTitle;
	private String ntCont;
	private String ntCount;
	private String ntWriter;
	private String regDate;
	private String regNo;
	private String updDate;
	private String updNo;
	private String userInfo;
	private String userNo;
	
	public String getFantNo() {
		return fantNo;
	}
	public void setFantNo(String fantNo) {
		this.fantNo = fantNo;
	}
	public String getNtTitle() {
		return ntTitle;
	}
	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}
	public String getNtCont() {
		return ntCont;
	}
	public void setNtCont(String ntCont) {
		this.ntCont = ntCont;
	}
	public String getNtCount() {
		return ntCount;
	}
	public void setNtCount(String ntCount) {
		this.ntCount = ntCount;
	}
	public String getNtWriter() {
		return ntWriter;
	}
	public void setNtWriter(String ntWriter) {
		this.ntWriter = ntWriter;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getUpdDate() {
		return updDate;
	}
	public void setUpdDate(String updDate) {
		this.updDate = updDate;
	}
	public String getUpdNo() {
		return updNo;
	}
	public void setUpdNo(String updNo) {
		this.updNo = updNo;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}
}
