package poly.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.NoticeDTO;
import poly.service.IBoardService;
import poly.service.INoticeService;
import poly.service.IUserService;
import poly.util.CmmUtil;

@Controller
public class NoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="NoticeService")
	private INoticeService noticeService;
	
	//커뮤니티 탭  게시판 목록
	@RequestMapping(value="community/communityOne")
	public String communityTab(HttpServletRequest request,Model model) throws Exception {
		//noticeDTO 형의 리스트로  받음
		//공지사항  qna분류
		log.info("community start");
	/*	String nt_sort=request.getParameter("nt_sort");
			log.info(nt_sort);*/
		
		List<NoticeDTO> nList = noticeService.getBoardList();
/*	if(nList==null) {
		log.info(nList);
	}else {
		log.info(nList.size());
	}*/

		//model 데이터 저장
		model.addAttribute("nList",nList);
		log.info("community end");
		return "/community/communityOne";
	}
	
	@Resource(name="UserService")
	private IUserService userService;
	
    @Resource(name="BoardService")
    private IBoardService boardService;
    
	//공지사항 목록
	@RequestMapping(value="board/boardList") //userList페이지를 요청 받을 때 매핑
	public String boardList(HttpServletRequest request, Model model) throws Exception{  //request, model객체를 매개변수로 하는 userList작성
		
		List<NoticeDTO> nList = noticeService.getBoardList();
		model.addAttribute("nList", nList);
		
		return "/board/boardList"; // boardList 페이지로 이동
	}	

	//공지사항 등록창
	@RequestMapping(value="board/boardReg")
	public String noticeReg(HttpServletRequest request,Model model) throws Exception {
		
		return "/board/boardReg";
	}
	
	//게시판 등록
	@RequestMapping(value="board/boardRegProc",method=RequestMethod.POST)
	public String insertNotice(HttpServletRequest request,Model model) throws Exception {
		
		System.out.println("welcome insertNotice!!");
		String fantNo=request.getParameter("fantNo");
		log.info("ntno:"+fantNo);
		String ntTitle=request.getParameter("ntTitle");
		log.info("title:"+ntTitle);
		String ntCont=request.getParameter("ntCont");
		log.info("cont:"+ntCont);
		String ntWriter=request.getParameter("ntWriter");
		log.info("writer:"+ntWriter);
		String ntCount=request.getParameter("ntCount");
		log.info("count:"+ntCount);
		String regDate=request.getParameter("regDate");
		log.info("regdate: "+ regDate);
		String regNo=request.getParameter("regNo");
		log.info("regno: "+ regNo);
		String updDate=request.getParameter("updDate");
		log.info("updDate: "+ updDate);
		String updNo=request.getParameter("updNo");
		log.info("updNo: "+ updNo);
		
		//set 값저장
		NoticeDTO nDTO=new NoticeDTO();
		nDTO.setFantNo(fantNo);
		nDTO.setNtTitle(ntTitle);
		nDTO.setNtCont(ntCont);
		nDTO.setNtCount(ntCount);
		nDTO.setRegDate(regDate);
		nDTO.setRegNo(regNo);
		nDTO.setUpdDate(updDate);
		nDTO.setUpdNo(updNo);
		nDTO.setNtWriter(ntWriter);

		int result =noticeService.insertNotice(nDTO);
				
				//경고창에 메시지를 띄우기 위해
				String msg="";
				String url="";
				
				if(result !=0 ) { //반환된갯수가 0이아니면 즉 회원가입이 되면 
					//회원가입이 정상적으로 이루어진 상태
	
					msg="글쓰기에 성공하셨습니다.";
					url = "/notice/communityTab.do";
				}else {
					//회원가입이 이루어지지않은 상태
					msg="글쓰기 실패";
					url="/home.do";
					
				}
				
				model.addAttribute("msg",msg);//객체로 보내줌
				model.addAttribute("url",url);
				
				System.out.println("End insertNotice!!");
				
				return "/alert";
			}
	
	//공지사항 상세보기
	
	@RequestMapping(value="board/boardDetail",method=RequestMethod.GET)
	public String boardDetail(HttpServletRequest request,Model model,HttpSession session) throws Exception{
		//모델에저장해서 jsp 에 보내줘야됨
		
	//	HttpServletRequest request,
		String fantNo=CmmUtil.nvl(request.getParameter("fantNo"));
		log.info("boardDetail 시작:"+fantNo);
		
	
	/*	String ntSort=CmmUtil.nvl(request.getParameter("ntSort"));
		System.out.println(" nt sort:"+ntSort);*/
		/*String ntSort=request.getParameter("nMPtSort");
		System.out.println(" nt sort:"+ntSort);
		*/
			
		log.info("boardDetail 라인 오류체크 시작");
	
		NoticeDTO nDTO=new NoticeDTO();
		nDTO.setFantNo(fantNo);
		
		nDTO=noticeService.getBoardDetail(nDTO);
		
		//nDTO1.setNtSort(ntSort);
		
		log.info("198라인 : "+nDTO.getRegNo());
		//nDTO.setNtSort(ntSort);
		
		/*NoticeDTO nDTO=noticeService.getBoardDetail(nDTO);
		log.info(FantNo);
		//
		int updateCount=noticeService.updateBoardCount(FantNo);
		log.info("142번 :"+updateCount);*/
		//System.out.println(("142번 :"+updateCount));
		//여기가 고친부분 지금 2018년 7월 4일@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
		/////////////////////////////////////////////////////////여기까지는 detail
	
		/*log.info("152 카운트:"+nDTO.getNtCount());*/
		
		
		model.addAttribute("nDTO",nDTO);
					//nDTO =null;
		
		
		//호출 user 값을 불러서 regNo 에 세팅
	/*NoticeDTO nDTO =new NoticeDTO();*/
		
	/*	nDTO.setRegNo(userNo);
		nDTO.setNt_no(ntNo);
		NoticeDTO nDTO = noticeService.getNoticeDetail(userNo);*/

		model.addAttribute("nDTO",nDTO);//모델에 저장해서 jsp 에 보내줌
	
					/*	
							HashMap<String,Object> map = new HashMap<String,Object>();
							map.put("user_no", userNo);// 파라미터값 , 
							map.put("nt_no", ntNo);
							map.put("nt_sort", ntSort);*/
						/*	map.put("qa_grpno", qaGrpno);*/
							//detail 	//count
							
							/*
							 	List noList =new ArrayList();
							noList.add(map.get("nt_no"));//0
							noList.add(map.get("user_no"));//1
							noList.add(map.get("nt_sort"));//2 
							model.addAttribute("noList",noList);
							log.info("140번:"+map.get("nt_no"));
							log.info("141:"+ntNo);
							//변수 초기화(메모리 효율화 시키기 위해 사용함)
									noList = null;
							  */
		
		return "/board/boardDetail";
	}
	//질문등록창
	@RequestMapping(value="qna/questionReg")
	public String questionReg(HttpServletRequest request,Model model) throws Exception {
	
		
		/*NoticeDTO nDTO1=new NoticeDTO();
		NoticeDTO nDTO= noticeService.getNoticeDetail(nDTO1);
		model.addAttribute("nDTO",nDTO);	*/
		return "/qna/questionReg";
	}
	//질문등록 데이터 보내기
	@RequestMapping(value="qna/questionRegProc",method=RequestMethod.POST)
	public String questionRegProc(HttpServletRequest request,Model model) throws Exception {
		
		System.out.println("welcome questionRegProcNotice!!");
		String fantNo=request.getParameter("fantNo");
		log.info("ntno:"+fantNo);
		String ntTitle=request.getParameter("ntTitle");
		log.info("title:"+ntTitle);
		String ntCont=request.getParameter("ntCont");
		log.info("cont:"+ntCont);
		String ntCount=request.getParameter("ntCount");
		log.info("cont:"+ntCont);
		String ntWriter=request.getParameter("ntWriter");
		log.info("writer:"+ntWriter);
		String regDate=request.getParameter("regDate");
		log.info("regdate: "+ regDate);
		String regNo=request.getParameter("regNo");
		log.info("regno: "+ regNo);
		String updDate=request.getParameter("updDate");
		log.info("updDate: "+ updDate);
		String updNo=request.getParameter("updNo");
		log.info("updNo: "+ updNo);
		
		//set 값저장
		NoticeDTO nDTO=new NoticeDTO();
		nDTO.setFantNo(fantNo);
		nDTO.setNtTitle(ntTitle);
		nDTO.setNtCont(ntCont);
		nDTO.setNtCount(ntCount);
		nDTO.setRegDate(regDate);
		nDTO.setRegNo(regNo);
		nDTO.setUpdDate(updDate);
		nDTO.setUpdNo(updNo);
		nDTO.setNtWriter(ntWriter);

		//log.info("112번쨰 sort:"+nDTO.getNtSort());
		int result =noticeService.insertNotice(nDTO);
				
				//경고창에 메시지를 띄우기 위해
				String msg="";
				String url="";
				
				if(result !=0 ) { //반환된갯수가 0이아니면 즉 회원가입이 되면 
					//회원가입이 정상적으로 이루어진 상태
	
					msg="글쓰기에 성공하셨습니다.";
					url = "/notice/communityTab.do";
				}else {
					//회원가입이 이루어지지않은 상태
					msg="글쓰기 실패";
					url="/home.do";
					
				}
				
				model.addAttribute("msg",msg);//객체로 보내줌
				model.addAttribute("url",url);
				
				System.out.println("End questioninsertNotice!!");
				
				return "/alert";
		
	}
	//질문상세보기
	@RequestMapping(value="qna/questionDetail")
	public String questionDetail(HttpServletRequest request,Model model) throws Exception {
		String regNo=CmmUtil.nvl(request.getParameter("regNo"));
		log.info("questionDetail 시작:"+regNo);
		String FantNo=CmmUtil.nvl(request.getParameter("fantNo"));
		System.out.println(" fa nt no:"+FantNo);
	/*	String ntSort=CmmUtil.nvl(request.getParameter("ntSort"));
		NoticeDTO nDTO1=new NoticeDTO();
		nDTO1.setFantNo(FantNo);
		nDTO1.setRegNo(regNo);
		/*nDTO1.setNtSort(ntSort);*/
		//nDTO1.setNtSort(ntSort);
		
		NoticeDTO nDTO1 = null;
		NoticeDTO nDTO=noticeService.getBoardDetail(nDTO1);
		model.addAttribute("nDTO",nDTO);
		
		return "/qna/questionDetail";
		
	}
	
	
	
	//답글 상세조회
	@RequestMapping(value="qna/answerDetail",method=RequestMethod.GET)
	public String answerQna(HttpServletRequest request,Model model) throws Exception {
	/*
		NoticeDTO anDTO=noticeService.getAnswerNoticeDetail(qaGrpNo);
		anDTO.setQa_grpno(qaGrpno);
		log.info("answerNotice시작 title:"+anDTO.getNtTitle());
		log.info("answerNotice cont: "+anDTO.getNtCont());
		log.info("answerNotice regdate: "+anDTO.getRegDate() );
		model.addAttribute("anDTO",anDTO);*/
		/*	String userNo=request.getParameter("userNo");
		String ntSort=request.getParameter("ntSort");
		log.info("noticeDetail nrSort 시작:"+ntSort);
		String ntNo=request.getParameter("ntNo");
		System.out.println(" nt no:"+ntNo);
		// 변수 3개를 가지고 조회해야함
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("user_no", userNo);
		map.put("ntSort", ntSort);// 파라미터값 , 
		map.put("nt_no", ntNo);
		NoticeDTO nDTO=noticeService.getAnswerNoticeDetail(map);
		model.addAttribute("nDTO",nDTO);*/
	
		
		
		return "/qna/answerDetail";
		
	}
	
	@RequestMapping(value="qna/answerReg")
	public String answerReg(HttpServletRequest request,Model model) throws Exception {
		log.info("answerReg start");
		String regNo=request.getParameter("regNo");
		log.info("answerReg start regno:"+regNo);
		String FantNo=request.getParameter("fantNo");
		log.info("FantNo "+FantNo);
		/*String ntSort=CmmUtil.nvl(request.getParameter("ntSort"));
		log.info(" ntSort:"+ntSort);*/
		NoticeDTO nDTO=new NoticeDTO();
		nDTO.setRegNo(regNo);
		nDTO.setFantNo(FantNo);
		//nDTO.setNtSort(ntSort);
		log.info("answerReg 355 regNo"+nDTO.getRegNo());
		log.info("answerReg 356 FantNo"+nDTO.getFantNo());
		/*log.info("answerReg 357 ntSort"+nDTO.getNtSort());*/
		NoticeDTO nDTO1=noticeService.getBoardDetail(nDTO);
		
		log.info("answerReg 359 nDTO1 ntNo:"+nDTO1.getFantNo());
		log.info("answerReg 359 nDTO1 regNo:"+nDTO1.getRegNo());
		/*log.info("answerReg 359 nDTO1 ntSort:"+nDTO1.getNtSort());*/
		model.addAttribute("nDTO",nDTO1);
		return "/qna/answerReg";
	}
	//답변 데이터 보내기
		@RequestMapping(value="qna/answerRegProc",method=RequestMethod.POST)
		public String answerRegProc(HttpServletRequest request,Model model) throws Exception {
			
			System.out.println("welcome answerRegProcNotice!!");
			String ntTitle=request.getParameter("ntTitle");
			log.info("title:"+ntTitle);
			String ntCont=request.getParameter("ntCont");
			log.info("cont:"+ntCont);
			String ntCount=request.getParameter("ntCount");
			log.info("count:"+ntCount);
			String ntWriter=request.getParameter("ntWriter");
			log.info("writer:"+ntWriter);
			String regDate=request.getParameter("regDate");
			log.info("regdate: "+ regDate);
			String regNo=request.getParameter("regNo");
			log.info("regno: "+ regNo);
			String updDate=request.getParameter("updDate");
			log.info("regdate: "+ regDate);
			String updNo=request.getParameter("updNo");
			log.info("regno: "+ updNo);
				
			
			//set 값저장
			NoticeDTO nDTO=new NoticeDTO();
			nDTO.setNtTitle(ntTitle);
			nDTO.setNtCont(ntCont);
			nDTO.setNtCount(ntCount);
			nDTO.setRegDate(regDate);
			nDTO.setRegNo(regNo);
			nDTO.setUpdDate(updDate);
			nDTO.setUpdNo(updNo);
			nDTO.setNtWriter(ntWriter);

			int result =noticeService.insertNotice(nDTO);
					
					//경고창에 메시지를 띄우기 위해
					String msg="";
					String url="";
					
					if(result !=0 ) { //반환된갯수가 0이아니면 즉 회원가입이 되면 
						//회원가입이 정상적으로 이루어진 상태
		
						msg="글쓰기에 성공하셨습니다.";
						url = "/notice/communityTab.do";
					}else {
						//회원가입이 이루어지지않은 상태
						msg="글쓰기 실패";
						url="/home.do";
						
					}
					
					model.addAttribute("msg",msg);//객체로 보내줌
					model.addAttribute("url",url);
					
					System.out.println("End questioninsertNotice!!");
					
					return "/alert";
			
		}
	

	
	//공지사항 삭제
	@RequestMapping(value="notice/noticeDelete",method=RequestMethod.GET)
	public String noticeDelete(HttpServletRequest request,Model model) throws Exception{
		// ntno 으로 요청받음
		String ntNo=request.getParameter("ntNo");
		log.info(ntNo);
		System.out.println("173:"+ntNo);
		int result =noticeService.deleteBoard(ntNo);
		String msg="";
		String url="";
		
		
		if(result !=0 ) { //반환된갯수가 0이아니면 즉 회원가입이 되면 
			//회원가입이 정상적으로 이루어진 상태
			msg="글삭제에 성공하셨습니다.";
			url = "/notice/communityTab.do";
		}else {
			//회원가입이 이루어지지않은 상태
			msg="글삭제 실패";
			url="/notice/communityTab.do";
			
		}
		model.addAttribute("msg",msg);//객체로 보내줌
		model.addAttribute("url",url);
		
				
				return "/alert";
	
	}

	
	//공지사항수정 화면 
	@RequestMapping(value="notice/noticeUpdateView",method=RequestMethod.GET)
	public String noticeUpdate(HttpServletRequest request,Model model) throws Exception {
		
		String regNo=request.getParameter("regNo");
		log.info("updateview regno:"+regNo);
		String FantNo=request.getParameter("ntNo");
		log.info("updateview ntNo:"+FantNo);
		
		
		
		NoticeDTO nDTO1=new NoticeDTO();
		nDTO1.setFantNo(FantNo);
		nDTO1.setRegNo(regNo);
		
		log.info("351번 : "+nDTO1.getRegNo());
		//nDTO.setNtSort(ntSort);
		
		NoticeDTO nDTO=noticeService.getBoardDetail(nDTO1);
		log.info("noticeUpdateView 라인 오류체크 끝 no:"+nDTO.getFantNo());
		log.info("noticeUpdateView 라인 오류체크 끝 cont:"+nDTO.getNtCont());
		log.info("noticeUpdateView 라인 오류체크 끝 title:"+nDTO.getNtTitle());
		log.info("noticeUpdateView 라인 오류체크 끝 regdt:"+nDTO.getRegDate());
		
		/*HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("user_no", userNo);// 파라미터값 , 
		map.put("nt_no", ntNo);
		NoticeDTO nDTO=noticeService.getNoticeDetail(map);

		
		
		List noList =new ArrayList();
		noList.add(map.get("nt_no"));
		noList.add(map.get("user_no"));
		model.addAttribute("noList",noList);
		*/
		model.addAttribute("nDTO",nDTO);
		return "/notice/noticeUpdateView";
	}
	
	//공지사항 수정 데이터
	
	@RequestMapping(value="notice/noticeUpdateProc",method=RequestMethod.POST)
	public String noticeUpdateProc(HttpServletRequest request,Model model) throws Exception{
		//바꿔야될 데이터      요청받기
		String FantNo=request.getParameter("ntNo");
		log.info("383번 업데이트 전송 시작nt_no:"+FantNo);
		String ntTitle= request.getParameter("ntTitle");
		log.info("ntTitle:"+ntTitle);
		String ntCont= request.getParameter("ntCont");
		log.info("ntCont:"+ntCont);
		String ntCount= request.getParameter("ntCount");
		log.info("ntCount:"+ntCount);
		String ntWriter= request.getParameter("ntWriter");
		log.info("ntWriter:"+ntWriter);
		String regNo= request.getParameter("regNo");
		log.info("regNo:"+regNo);
		String regDate= request.getParameter("regDate");
		log.info("regDate:"+regDate);
		String updNo=request.getParameter("updNo");
		log.info("updNo:"+updNo);
		String updDate=request.getParameter("updDate");
		log.info("updDate:"+updDate);
	/*	String qaGrpno=request.getParameter("qa_grpno");
		log.info("264:qa_grpno: "+ qaGrpno);*/
		//세팅시킴
				NoticeDTO nDTO =new NoticeDTO();
				nDTO.setFantNo(FantNo);;
				nDTO.setNtTitle(ntTitle);
				nDTO.setNtCont(ntCont);
				nDTO.setNtWriter(ntWriter);
				nDTO.setRegNo(regNo);
				nDTO.setRegDate(regDate);
				nDTO.setUpdNo(updNo);
				nDTO.setUpdNo(updDate);
				/*nDTO.setQa_grpno(qaGrpno);*/
				
				//결과값으로 수정성공 실패 숫자로 반환되니까 
				int result=noticeService.updateBoard(nDTO);
				
				if(result!=0) {
					return "redirect:/home.do";//데이터 전송없이   뷰가 아니라 url 리다이렉트하면 위에서 main.do 찾아서
				}else{
					String msg="수정실패";
					String url="/notice/noticeUpdateView.do?regNo="+regNo+"&FantNo="+FantNo;
					model.addAttribute("msg",msg);
					model.addAttribute("url",url);
					return "/alert";
							
				}
				
		
	}
	
	//답글 존재여부  ajax
	@RequestMapping(value="/notice/ansChk")
	@ResponseBody
	public void getAnswerCheck(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String ntNo=request.getParameter("ntNo");
		int count=0; //answer 중복 체크 하기 위한 변수 선언
		
		count =noticeService.getAnswerCheck(ntNo);
		log.info(count);
	
		response.getWriter().println(count);
	}
	
	


	
	

	

	
	/*//회원 체크
	@RequestMapping(value="user/userChecked")
	@ResponseBody // ajax사용을 위해 지정해줘야됨 json으로 넘어온 email 매개변수 사용Map<Object,Object>@RequestBody String email
	public void getUserEmailCheck(HttpServletRequest req,HttpServletResponse res) throws Exception{
		String email=req.getParameter("email");
		
		
		int count=0;// 이메일 중복을 체크하기 위한 변수선언
		//Map<Object, Object> map = new HashMap<Object,Object>();
		
		count = userService.getUserEmailCheck(email);
		
		
		log.info(count);
		System.out.println("595번쨰 카운트:"+count);
		
		res.getWriter().println(count);
		//map.put("cnt", count);		
	}*/
	
}
