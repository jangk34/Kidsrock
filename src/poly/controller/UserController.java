package poly.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import poly.dto.UserDTO;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.Email;
import poly.util.EmailSender;

@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass()); //톰캣으로 오는 요청을 파일로 기록한다는 뜻
	
	@Autowired
	private EmailSender emailSender;
	
	@Resource(name="UserService")	//이름을 UserService로 명명
	private IUserService userService; //IUserService 타입의 userService 선언
	
	/***********************메인페이지**************************/
	@RequestMapping(value="main/main") //main.jsp를 요청 할 때 
	public String main(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		return "/main/main";
	}

	/***********************회원 등록 페이지**************************/
	@RequestMapping(value="user/userReg") //userReg.jsp를 요청할 때
	public String userReg() throws Exception{
		return "/user/userReg"; 	//userReg페이지를 반환합니다.
	}
	
	/***********************마이페이지**************************/
		@RequestMapping(value="user/myPage")
		public String noticeReg(HttpServletRequest request,Model model) throws Exception {
			return "/user/myPage";
		}
	
	/***********************회원 등록페이지 내의 회원등록 버튼을 누를 때**************************/
	@RequestMapping(value="user/userRegProc", method=RequestMethod.POST)	//userRegProc를 요청하고 전송방식은 post라고 할 떄
	public String userRegProc(HttpServletRequest request, Model model) throws Exception{		
		/*******UserDTO의 객체를 새로 선언하여 받은 인자 값을 이용하여 저장*******/		
		String email=CmmUtil.nvl(request.getParameter("email"));
		log.info("email: "+email);
		String password=CmmUtil.nvl(request.getParameter("password"));
		System.out.println("35:"+password);
		log.info("password: "+ password);
		String gender=CmmUtil.nvl(request.getParameter("gender"));
		log.info("gender: "+ gender);
		String name=CmmUtil.nvl(request.getParameter("name"));
		log.info("name: "+ name);
		String birth=CmmUtil.nvl(request.getParameter("birth"));
		log.info("birth: "+ birth);
		String userTel=CmmUtil.nvl(request.getParameter("userTel"));
		log.info("userTel"+userTel);
		String postAddr=CmmUtil.nvl(request.getParameter("postAddr"));
		log.info("postAddr: "+ postAddr);
		String addr1=CmmUtil.nvl(request.getParameter("addr1"));
		log.info("addr1: "+ addr1);
		String addr2=CmmUtil.nvl(request.getParameter("addr2"));
		log.info("addr2: "+ addr2);
		String regDate=CmmUtil.nvl(request.getParameter("regDate"));
		log.info("regDate: "+ regDate);
		String regNo=CmmUtil.nvl(request.getParameter("regNo"));
		log.info("regNo: "+ regNo);
		String updDate=CmmUtil.nvl(request.getParameter("updDate"));
		log.info("updDate: "+ updDate);
		String updNo=CmmUtil.nvl(request.getParameter("updNo"));
		log.info("updNo: "+ updNo);
		
		//데이터를 받기위한 uDTO 선언
		
		UserDTO uDTO=new UserDTO();
		uDTO.setEmail(email);
		uDTO.setPassword(password);
		uDTO.setGender(gender);
		uDTO.setName(name);
		uDTO.setBirth(birth);
		uDTO.setUserTel(userTel);
		uDTO.setPostAddr(postAddr);
		uDTO.setAddr1(addr1);
		uDTO.setAddr2(addr2);
		uDTO.setRegDate(regDate);
		uDTO.setRegDate(regNo);
		uDTO.setUpdDate(updDate);
		uDTO.setUpdNo(updNo);
	
		//upd 는 아직안받아옴
		int result =userService.insertUser(uDTO);
		
		UserDTO uDTO2 = new UserDTO();
		
		uDTO2.setRegNo(uDTO.getUserNo());
		int result2=userService.updateUserRegNo(uDTO2);
		//경고창에 메시지를 띄우기 위해
		String msg="";
		String url="";
		
		if(result+result2 ==2 ) { //반환된갯수가 0이아니면 즉 회원가입이 되면 
			//회원가입이 정상적으로 이루어진 상태
			msg="회원가입에 성공하셨습니다.";
			url = "/main.do";
		}else {
			//회원가입이 이루어지지않은 상태
			msg="회원가입 실패";
			url="/user/userReg.do";
		}
		
		model.addAttribute("msg",msg);//객체로 보내줌
		model.addAttribute("url",url);
		uDTO = null;
		
		return "/alert";
	}
	
	/***********************회원 리스트 보기**************************/
	@RequestMapping(value="user/userList") //userList페이지를 요청 받을 때 매핑
	public String userList(HttpServletRequest request, Model model) throws Exception{  //request, model객체를 매개변수로 하는 userList작성
		
		List<UserDTO> uList = userService.getUserList(); //List형식으로 userService의 getUserList메소드를 호출
		model.addAttribute("uList", uList); //uList를 uList라는 변수명으로 전송
		
		return "user/userList"; // userList 페이지로 이동
	}
	

	/***********************회원 상세 보기**************************/
	@RequestMapping(value="user/userDetail", method=RequestMethod.GET) //GET방식으로 데이터를 받음
	public String userDetail(HttpServletRequest request, Model model) throws Exception {
		String userNo = request.getParameter("userNo"); //userNo라는 변수의 데이터를 받고 userNo의 변수에 저장
		log.info("See user's detail");
		log.info("userNo: " + userNo);					// 로그로 출력하여 확인
		UserDTO uDTO = userService.getUserDetail(userNo);	//UserDTO타입의 값을 반환하는 서비스내의 회원상세보기 메소드 호출
		model.addAttribute("uDTO", uDTO); //저장된 uDTO변수를 전송
		return "user/userDetail";		  //userDetail페이지로 이동
	}
	
	/***********************회원 삭제**************************/
	@RequestMapping(value="user/userDelete", method=RequestMethod.GET) //GET방식으로 데이터를 받아옴
	public String userDelete(HttpServletRequest request, Model model) throws Exception {
		String userNo = request.getParameter("userNo"); //userNo라는 변수로 받은 값을 userNo에 저장
		log.info("userNo " + userNo + " is deleted");	//console에서 확인하기 위해 받고 저장 된 값 출력
		int result = userService.deleteUser(userNo); //userDelete메소드를 호출하여 성공/실패 int값을  result값에 저장

		String msg = "";			//보여줄 문자를 저장할 변수 선언
		String url ="";				//이동할 주소를 저장할 변수 선언
		if(result !=0) { 			//회원 삭제 성공시 result에 1 리턴이 되었을 때

			msg = "회원 삭제에 성공하셨습니다 !"; 
			url = "/main.do";
		}else {				//회원 삭제 실패시 result에 0 리턴이 되었을 때
			msg = "회원삭제 실패";
			url = "/main.do";
		}
		
		model.addAttribute("msg",msg); // alert페이지에 넘겨줄 msg 보내기
		model.addAttribute("url",url); // alert페이지에 넘겨줄 url 보내기
		
		return "/alert"; 	//alert를 띄워주면서 url로 보내주는 alert페이지로 이동
	}
	//회원체크
	
	//회원 체크
		@RequestMapping(value="user/userChecked")
		@ResponseBody // ajax사용을 위해 지정해줘야됨 json으로 넘어온 email 매개변수 사용Map<Object,Object>@RequestBody String email
		public void getUserEmailCheck(HttpServletRequest req,HttpServletResponse res) throws Exception{
			String email=CmmUtil.nvl(req.getParameter("email"));
			
			
			int count=0;// 이메일 중복을 체크하기 위한 변수선언
			//Map<Object, Object> map = new HashMap<Object,Object>();
			
			count = userService.getUserEmailCheck(email);
			
			
			log.info(count);
			System.out.println("115번쨰 카운트:"+count);
			
			//getwriter 는  한개만 보낼때
			res.getWriter().println(count);
			//map.put("cnt", count);		
		}
		
		//회원 찾기 화면
		@RequestMapping(value="user/userSearch")
		public String userFind() throws Exception{
			
			return "/user/userSearch";
			
		}

		//이메일찾기 ajax  리스트 형식으로 넘어올때는 
		
		
			@RequestMapping(value="/idFind")
			public @ResponseBody String idFind(HttpServletRequest req ) throws Exception{
				log.info("emailFind start");
				String name=CmmUtil.nvl(req.getParameter("name"));
				log.info("name:"+name);
				String userTel=CmmUtil.nvl(req.getParameter("userTel"));
				log.info("userTel:"+userTel);
				UserDTO uDTO=new UserDTO();
				uDTO.setName(name);
				uDTO.setUserTel(userTel);
				
				log.info("getName"+uDTO.getName());
				log.info("getUserTel"+uDTO.getUserTel());
				//log.info("uDTOName:"+uDTO.getName());
				
				//리스트 !! 로 받아오기//안해도됨 전화번호
				//int count=0;
				//List<UserDTO> uList=userService.getEmailFind(uDTO);
				
				String result = userService.getidFind(uDTO); //이메일값
				
				log.info("emailFind end");
				return result;
			}
			
			//비밀번호 찾기
			
			@RequestMapping(value="/pwFind")
			public @ResponseBody String pwFind(HttpServletRequest req, Model model ) throws Exception{
				log.info("emailFind start");
				String pwname=CmmUtil.nvl(req.getParameter("pwname"));
				log.info("name:"+pwname);
				String pwuserTel=CmmUtil.nvl(req.getParameter("pwuserTel"));
				log.info("userTel:"+pwuserTel);
				String pwemail=CmmUtil.nvl(req.getParameter("pwemail"));
				log.info("userTel:"+pwemail);
				
				//이메일을 보내기 위한 생성자
				
				Email sendEmail = new Email();
				
				UserDTO uDTO = new UserDTO();
				
				uDTO.setEmail(pwemail);
				uDTO.setName(pwname);
				
				HashMap<String,Object> hMap = new HashMap<>();
				hMap.put("uDTO", uDTO);
				hMap=userService.updateTmpPass(hMap);
				
				String msg = "";
				String url = "";
				
				int result = (int)hMap.get("result"); //해쉬맵 반환값을 사용
				if(result == 0 ) {
			         msg= "회원 정보가 일치하지 않습니다.";
			         url="/main.do";
			      }else {
			         sendEmail.setReciver(pwemail); //받는사람의 이메일 저장 // sendEmail은 dto
			         log.info(sendEmail.getReciver());
			         sendEmail.setSubject(pwname+"님 임시비밀번호");
			         sendEmail.setContent(sendEmail.setContents(hMap));
			         
			         emailSender.SendEmail(sendEmail);
			         
			         msg = "가입하신 이메일로 임시비밀번호가 전송되었습니다.";
			         url = "/main.do";
			      }
			      model.addAttribute("url", url);
			      model.addAttribute("msg", msg);
			      hMap = null;
			      uDTO = null;
				
				return null;
			}
	/***********************회원 수정**************************//*
	@RequestMapping(value="user/userUpdateView", method=RequestMethod.GET)
	public String userUpdateView(HttpServletRequest request, Model model) throws Exception{
		String userNo = request.getParameter("userNo");
		log.info("User Update");
		log.info("user NO: " + userNo);
		
		UserDTO uDTO = userService.getUserDetail(userNo);
		model.addAttribute("uDTO", uDTO);
			
		return "/user/userUpdateView";
	}
	
	@RequestMapping(value="user/userUpdateProc", method=RequestMethod.POST)
	public String userUpdateProc(HttpServletRequest request, Model model) throws Exception{
		
		String userNo = request.getParameter("userNo");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		log.info("User update");
		log.info("userNo: "+ userNo);
		log.info("id: " +id);
		log.info("password: "+password);
		log.info("name: "+ name);
		log.info("Age: " + age);

		UserDTO uDTO = new UserDTO();
		uDTO.setUser_no(userNo);
		uDTO.setId(id);
		uDTO.setPassword(password);
		uDTO.setName(name);
		uDTO.setAge(age);
		
		int result = userService.updateUserDTO(uDTO);
		
		String msg = "";
		String url = "/main.do";

		if(result != 0) {
			return "redirect:/main.do"; //redirect방식<->forward , 해당 requestMapping으로 이동
		}
		else {
			msg = "회원 정보 수정 실패";
			url = "/user/userUpdateView.do?userNo=" + userNo;
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "/alert";
		}
	}
	}
	*/

			
			
			
	//로그인화면
	
	/*@RequestMapping("user/userLogin")
	public ModelAndView userlogin(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView();
	
	if (request.getSession().getAttribute("loginInfo") != null)
	{ 
	  String msg = "이미 로그인된 상태입니다.";
      mav.addObject("msg", msg);
      mav.setViewName("/user/loginSuccess");
	}
	else
	{
		mav.setViewName("/user/login");
	}
		return mav;
	}
	
	@RequestMapping(value="/user/loginTry")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap) throws Exception {
	ModelAndView mav = new ModelAndView("/user/loginSuccess");
	
	Map<String, Object> map = userService.selectUserInfo(commandMap.getMap());
	//로그인 정보가 있다면 로그인
	if(map == null)
	{
		mav.addObject("msg", "로그인에 실패하였습니다.");
	}
	else
	{
		request.getSession().setAttribute("loignInfo", map);
		request.getSession().setMaxInactiveInterval(60*30);
		
		mav.addObject("msg", "로그인에 성공하였습니다.");
	}
	return mav;
	}*/
			
			
			
			/*@RequestMapping(value="user/userLoginProc", method=RequestMethod.POST)

			public String userLoginProc(@RequestParam HashMap<String, String> param, HttpSession session, Model model) throws Exception{

				UserDTO uDTO = userService.getLogin(param);
				if(uDTO==null){

					//로그인 실패 상태

					model.addAttribute("msg", "로그인 실패");

				}else{

					//로그인 성공

					session.setAttribute("email", uDTO.getEmail());

					model.addAttribute("msg", "로그인 성공");

				}

				model.addAttribute("url", "/main.do");

				

				return "/alert";

			}

			

			@RequestMapping(value="user/userLogout")

			public String userLogout(HttpSession session) throws Exception{

				//세션을 초기화 하는 함수

				//세션이 초기화가 됐으니 로그인이 풀렸겠죠???

				session.invalidate();

				

				//그다음 메인 페이지를 보여줘라...

				return "redirect:/main.do";

			}
*/
			

			@RequestMapping(value="/user/idChk")

			public @ResponseBody String idChk(@RequestParam(value="mail") String email) throws Exception{

				UserDTO uDTO = new UserDTO();
				

				uDTO.setEmail(CmmUtil.nvl(email));

				System.out.println(email);

				String idChk = userService.getIdChk(uDTO);

				

				System.out.println(idChk);

				

				return idChk;

			}
	
	
	/***********************로그인 **************************/
	@RequestMapping(value="user/userLogin")
	public String userloginProc(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		
		return "/user/userLogin";
	}
	
	//로그인 전송
	
	@RequestMapping(value="/user/userLoginProc")
	public String userLoginProc(HttpServletRequest request,HttpSession session,Model model) throws Exception {
		//1. 
		System.out.println("userLoginProc");
		String email=CmmUtil.nvl(request.getParameter("email"));
		log.info("email"+email);
		String password= CmmUtil.nvl(request.getParameter("password"));
		log.info("password:"+password);
		
		//로그인을 하고나서는 정보를 다받아와야되니 UserDTO 
		//2.데이터를 받아와서
		UserDTO uDTO =new UserDTO();
		uDTO.setEmail(email);
		uDTO.setPassword(password);
		
		uDTO=userService.getUserLogin(uDTO);// 성공하지못하면 아무것도 가져오지 못해서 널
		String msg="";
		String url="";
		
		if(uDTO==null) {
			//로그인 실패
			msg="로그인실패하셨습니다.";
			url = "/main.do";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "/alert";
		}else {
			//로그인 성공
			session.setAttribute("email", uDTO.getEmail());
			session.setAttribute("name",uDTO.getName());
			session.setAttribute("userNo",uDTO.getUserNo());
		}
		//관리자만 관리버튼 나오게 하려고받는 것
		// userNo 도 받아야됨
		System.out.println("session : " + session.getAttribute("email"));
		
		return "redirect:/main.do";
	}
	
     //회원 로그아웃
	@RequestMapping(value="/user/logout")
	public String logout(HttpSession session, Model model) throws Exception{
		
		//세션을 초기화 시키는 함수
		session.invalidate();
		//로그아웃끝
		String msg="";
		String url="";
		
			//회원가입이 정상적으로 이루어진 상태
			msg="로그아웃 성공하였습니다.";
			url = "/main.do";
		model.addAttribute("msg",msg);//객체로 보내줌
		model.addAttribute("url",url);
		
		return "/alert";
	}
	
	/***********************게시판**************************/
	@RequestMapping(value="bbs") //bbs.jsp를 요청 할 때 
	public String bbs(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info("Access bbs");
		return "/bbs";
	}
	
	@RequestMapping(value="/kakaoCallback")
    public String kakaoCallback(HttpServletRequest req, HttpSession session) throws Exception {
       String id = CmmUtil.nvl(req.getParameter("kId"));
       String name = CmmUtil.nvl(req.getParameter("kName"));
       String email=CmmUtil.nvl(req.getParameter("kEmail"));
       log.info("콜백"+id);
       log.info("콜백"+name);
       UserDTO uDTO =new UserDTO();
       
       name=CmmUtil.spec(name, "\"");
       email=CmmUtil.spec(email, "\"");

       uDTO.setEmail(email);
       uDTO.setName(name);

       int result = userService.getUserEmailCheck(email);
       if(result==0) {
          int result1 = userService.insertUserRegSns(uDTO);
          String userNo=uDTO.getUserNo();
          session.setAttribute("userNo", userNo);
          session.setAttribute("name", name);
          session.setAttribute("email", email);
          session.setAttribute("snsVal", "y");
       }else {
          String userNo=userService.getFindUserNo(uDTO);
          session.setAttribute("userNo", userNo);
          session.setAttribute("name", name);
          session.setAttribute("email", email);
          session.setAttribute("snsVal", "y");
       }
       
       
    
       return "redirect:/main.do";
    }
}
