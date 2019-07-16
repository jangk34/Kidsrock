package poly.service;

import java.util.List;

import poly.dto.NoticeDTO;

public interface INoticeService {
	// 게시판 등록
	public int insertNotice(NoticeDTO nDTO) throws Exception;

	// 게시판 목록
	public List<NoticeDTO> getBoardList() throws Exception;

	// 게시판 상세
	public NoticeDTO getBoardDetail(NoticeDTO nDTO) throws Exception;

	// 게시판 삭제
	public int deleteBoard(String ntNo) throws Exception;

	// 게시판 수정
	public int updateBoard(NoticeDTO nDTO) throws Exception;

	// 게시판 조회수
	public int updateBoardCount(String FantNo) throws Exception;

	// 답변 게시판 조회
	public NoticeDTO getAnswerNoticeDetail(String qaGrpno) throws Exception;

	// 답글 중복확인
	public int getAnswerCheck(String FantNo) throws Exception;

	// 마이페이지 > 내가 쓴 글 보기 -----------------------
	public List<NoticeDTO> userWriteList() throws Exception;

	/*
	 * //질문 답변달았는지 안달았는지 업데이트 public int qnaExpYn(String ntNo) throws Exception;
	 */
}
