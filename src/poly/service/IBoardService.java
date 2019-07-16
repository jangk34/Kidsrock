package poly.service;

import java.util.List;

import poly.dto.BoardDTO;

public interface IBoardService {
	
	public List<BoardDTO> getBoardList() throws Exception;
	public BoardDTO getBoardDetail(String writing_In) throws Exception;
	public int deleteBoard(String writing_In) throws Exception; //int값을 반환하는 회원삭제 메소드
	public int updateBoardDTO(BoardDTO bDTO) throws Exception; //int값을 반환하는 UserDTO를 매개변수로 받는 회원정보 수정 메소드
	public int insertBoardDTO(BoardDTO bDTO) throws Exception; //UserDTO 형식의 변수를 매개변수로 받는 회원정보를 입력하는 메소드
	
	

	

}
