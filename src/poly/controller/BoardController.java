/*package poly.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.BoardDTO;
import poly.service.IBoardService;


 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * 
@Controller
public class BoardController {
	private Logger log = Logger.getLogger(this.getClass());
	
	
	 * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨)
	 * 
	//공지사항 게시판
	
	@RequestMapping(value="board/notice")
	public String notice() {
		return "board/notice";
	}
	@Resource(name = "BoardService")
	private IBoardService boardService;
	
	
	
	*//***********************글 리스트 보기**************************//*
	@RequestMapping(value="board/boardList") //userList페이지를 요청 받을 때 매핑
	public String boardList(HttpServletRequest request, Model model) throws Exception{  //request, model객체를 매개변수로 하는 userList작성
		log.info("boardList access...");
		List<BoardDTO> bList = boardService.getBoardList(); //List형식으로 userService의 getUserList메소드를 호출
		model.addAttribute("bList", bList); //uList를 uList라는 변수명으로 전송
		log.info(bList.get(0).getTitle());
		return "board/boardList"; // userList 페이지로 이동
	}
	
	*//***********************글 상세 보기**************************//*
	@RequestMapping(value="board/boardDetail", method=RequestMethod.GET) //GET방식으로 데이터를 받음
	public String boardDetail(HttpServletRequest request, Model model) throws Exception {
		String writing_In = request.getParameter("notice_seq"); //userNo라는 변수의 데이터를 받고 userNo의 변수에 저장
		log.info("See writingIn's detail");
		log.info("writingIn: " + writing_In);					// 로그로 출력하여 확인
		BoardDTO bDTO = boardService.getBoardDetail(writing_In);	//UserDTO타입의 값을 반환하는 서비스내의 회원상세보기 메소드 호출
		model.addAttribute("bDTO", bDTO); //저장된 uDTO변수를 전송
		log.info(bDTO.getContents());
		return "board/boardDetail";		  //userDetail페이지로 이동
	}
	
	*//***********************글 삭제**************************//*
	@RequestMapping(value="board/boardDelete", method=RequestMethod.GET) //GET방식으로 데이터를 받아옴
	public String boardDelete(HttpServletRequest request, Model model) throws Exception {
		String writing_In = request.getParameter("notice_seq"); //userNo라는 변수로 받은 값을 userNo에 저장
		log.info("writingIn" + writing_In + " is deleted");	//console에서 확인하기 위해 받고 저장 된 값 출력
		int result = boardService.deleteBoard(writing_In); //boardDelete메소드를 호출하여 성공/실패 int값을  result값에 저장

		String msg = "";			//보여줄 문자를 저장할 변수 선언
		String url ="";				//이동할 주소를 저장할 변수 선언
		if(result !=0) { 			//회원 삭제 성공시 result에 1 리턴이 되었을 때

			msg = "글 삭제에 성공하셨습니다 !"; 
			url = "/main.do";
		}else {				//회원 삭제 실패시 result에 0 리턴이 되었을 때
			msg = "글삭제 실패";
			url = "/main.do";
		}
		
		model.addAttribute("msg",msg); // alert페이지에 넘겨줄 msg 보내기
		model.addAttribute("url",url); // alert페이지에 넘겨줄 url 보내기
		
		return "/alert"; 	//alert를 띄워주면서 url로 보내주는 alert페이지로 이동
	}
	
	
	
	
	*//***********************글 수정**************************//*
	@RequestMapping(value="board/boardUpdateView", method=RequestMethod.GET)
	public String boardUpdateView(HttpServletRequest request, Model model) throws Exception{
		String writing_In = request.getParameter("notice_seq");
		log.info("User Update");
		log.info("Writing In: " + writing_In);
		
		BoardDTO bDTO = boardService.getBoardDetail(writing_In);
		model.addAttribute("bDTO", bDTO);
			
		return "/board/boardUpdateView";
	}
	
	@RequestMapping(value="board/boardUpdateProc", method=RequestMethod.POST)
	public String boardUpdateProc(HttpServletRequest request, Model model) throws Exception{
		
		String writing_In = request.getParameter("notice_seq");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");


		
		log.info("User update");
		log.info("writing_In: "+ writing_In);
		log.info("title: " +title);
		log.info("contents: "+contents);


		BoardDTO bDTO = new BoardDTO();
		bDTO.setNotice_seq(writing_In);
		bDTO.setTitle(title);
		bDTO.setContents(contents);

		
		int result = boardService.updateBoardDTO(bDTO);
		
		String msg = "";
		String url = "/main.do";
		

		if(result != 0) {
			return "redirect:/main.do"; //redirect방식<->forward , 해당 requestMapping으로 이동
		}
		else {
			msg = "회원 정보 수정 실패";
			url = "/user/userUpdateView.do?writing_In=" + writing_In;
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "/alert";
			
		}

		
	}
	
	
	
	
	
	
	
	*//***********************글쓰기 페이지**************************//*
	@RequestMapping(value="board/boardReg") //boardReg.jsp를 요청할 때
	public String boardReg() throws Exception{
		return "board/boardReg"; 	//boardReg페이지를 반환합니다.
	}
	
	*//***********************회원 등록페이지 내의 회원등록 버튼을 누를 때**************************//*
	@RequestMapping(value="board/boardRegProc", method=RequestMethod.POST)	//userRegProc를 요청하고 전송방식은 post라고 할 떄
	public String boardRegProc(HttpServletRequest request, Model model) throws Exception{
		
		String title = request.getParameter("title"); //password변수에 받아온 password의 값을 저장합니다.
		String contents = request.getParameter("contents"); //name변수에 받아온 name의 값을 저장합니다.
		String user_in = request.getParameter("user_in"); //age변수에 받아온 age의 값을 저장합니다.
		
		*//*******변수에 저장된 값을 Console창에 출력********//*
		log.info("User has been registered");
		log.info("id: " + title);
		log.info("password: " + contents);
		log.info("name: " + user_in);
		
		
		*//*******UserDTO의 객체를 새로 선언하여 받은 인자 값을 이용하여 저장*******//*		
 BoardDTO bDTO = new BoardDTO(); //userDTO타입의 uDTO객체 선언
		
		bDTO.setTitle(title);
		bDTO.setContents(contents);
		bDTO.setUser_in(user_in);

		
		int result = boardService.insertBoardDTO(bDTO); //서비스 내의 회원을 등록하는 메소드 출력하여 result에 저장 

		*//************회원등록에 실패했는지 성공했는지 확인************//*
		String msg = ""; 			// alert으로 띄워줄 메시지 변수
		String url ="";				// 이동할 페이지 주소를 저장할 변수
		if(result !=0) { 			//회원가입 성공시 result값에 1이 반환됩니다.
			msg = "회원가입에 성공하셨습니다 !"; 
			url = "/main.do";
		}else {
			msg = "회원가입 실패";
			url = "/user/userReg.do";
		}
		model.addAttribute("msg",msg); //저장된 msg변수를 전송
		model.addAttribute("url",url); //저장된 url변수를 전송
		return "/alert";				//alert페이지로 이동
	}
	
	
	
	
	 * 함수명 위의 value="notice/NoticeList" => /notice/NoticeList.do로 호출되는 url은 무조건 이 함수가 실행된다.
	 * method=RequestMethod.GET => 폼 전송방법을 지정하는 것으로 get방식은 GET, post방식은 POST이다.
	 * method => 기입안하면 GET, POST 모두 가능하나, 가급적 적어주는 것이 좋다.
	 * 
	

	
	
	
	
	*//**
	 * 게시판 리스트 보여주기
	 * *//*
	@RequestMapping(value="notice/NoticeList", method=RequestMethod.GET)
	public String NoticeList(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		//로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".NoticeList start!");
		
		//공지사항 리스트 가져오기
		List<NoticeDTO> rList = noticeService.getNoticeList();
		
		if (rList==null){
			rList = new ArrayList<NoticeDTO>();
			
		}
		
		//조회된 리스트 결과값 넣어주기
		model.addAttribute("rList", rList);
		
		//변수 초기화(메모리 효율화 시키기 위해 사용함)
		rList = null;
		
		//로그 찍기(추후 찍은 로그를 통해 이 함수 호출이 끝났는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".NoticeList end!");
		
		//함수 처리가 끝나고 보여줄 JSP 파일명(/WEB-INF/view/notice/NoticeList.jsp) 
		return "/notice/NoticeList";
	}
}*/