package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BoardDTO;
import poly.persistance.mapper.BoardMapper;
import poly.service.IBoardService;

@Service("BoardService")
public class BoardService implements IBoardService {

   @Resource(name = "BoardMapper")
   private BoardMapper boardMapper;
   
   @Override //회원 정보 가져올 때, 매개변수 필요 없음
	public List<BoardDTO> getBoardList() throws Exception { //List<UserDTO>타입을 반환하는 매개변수없는 회원정보 출력 메소드
		return boardMapper.getBoardList(); // Mapper의 아이디가 getUserList인 메소드를 호출
	}
   
   @Override
	public BoardDTO getBoardDetail(String writing_In) throws Exception {
		return boardMapper.getBoardDetail(writing_In);		//UserMapper.xml 작성 이전에는 오류가 남
	}

  
   	@Override
	public int deleteBoard(String writing_In) throws Exception {
		return boardMapper.deleteBoard(writing_In);	// 매퍼의 boardDelete를 호출합니다.
		
	}
   	
   	@Override
	public int updateBoardDTO(BoardDTO bDTO) throws Exception {
		return boardMapper.updateBoardDTO(bDTO); // 매퍼의 회원정보수정 mapper를 호출
		
	}
   	@Override 
	public int insertBoardDTO(BoardDTO bDTO) throws Exception { //UserDTO타입의 매개변수를 받는 회원가입 메소드
		return boardMapper.insertBoardDTO(bDTO); 	// Mapper에서 아이디가 inserUserDTO인 메소드를 호출
	}

}