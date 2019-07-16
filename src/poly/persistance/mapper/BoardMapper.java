package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BoardDTO;

@Mapper("BoardMapper")
public interface BoardMapper {

	public List<BoardDTO> getBoardList() throws Exception;
	public BoardDTO getBoardDetail(String writing_In) throws Exception;
	public int deleteBoard(String writing_In) throws Exception; // int를 반환하는 userNo를 인자로 받는 회원 삭제 메소드
	public int updateBoardDTO(BoardDTO bDTO) throws Exception;
	public int insertBoardDTO(BoardDTO bDTO) throws Exception;
	
	

	
}
