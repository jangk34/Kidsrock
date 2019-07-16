package poly.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.FaDTO;
import poly.service.IFainfoService;
/*import poly.service.IfaInfoService;*/
import poly.util.CmmUtil;

@Controller
public class FaController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FainfoService")
	private IFainfoService fainfoService;
	
	@RequestMapping(value="facility/fainfoList") //userList페이지를 요청 받을 때 매핑
	public String fainfoList(HttpServletRequest request, Model model) throws Exception{  //request, model객체를 매개변수로 하는 userList작성
		
		List<FaDTO> fList = fainfoService.getFainfoList();
		model.addAttribute("fList", fList);
		
		return "/facility/fainfoList"; // boardList 페이지로 이동
	}		
	
	//시설 상세보기
	
		@RequestMapping(value="facility/fainfoDetail",method=RequestMethod.GET)
		public String fainfoDetail(HttpServletRequest request,Model model,HttpSession session) throws Exception{
			//모델에저장해서 jsp 에 보내줘야됨
			
			/*String faname=CmmUtil.nvl(request.getParameter("faname"));
			log.info("fainfoDetail 시작:"+faname);*/
		//	HttpServletRequest request,
			String fano=CmmUtil.nvl(request.getParameter("fano"));
			log.info("fainfoDetail 시작:"+fano);
			
		/*	String ntSort=CmmUtil.nvl(request.getParameter("ntSort"));
			System.out.println(" nt sort:"+ntSort);*/
			/*String ntSort=request.getParameter("nMPtSort");
			System.out.println(" nt sort:"+ntSort);
			*/
				
			log.info("fainfoDetail 라인 오류체크 시작");
		
			FaDTO fDTO=new FaDTO();
			fDTO.setFano(fano);
			/*fDTO.setFaname(faname);*/
			
			fDTO=fainfoService.getFainfoDetail(fDTO);
		
			//nDTO1.setNtSort(ntSort);
			
			log.info("198라인 : "+fDTO.getFano());
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
			
			
			model.addAttribute("fDTO",fDTO);
						//nDTO =null;
			
			
			//호출 user 값을 불러서 regNo 에 세팅
		/*NoticeDTO nDTO =new NoticeDTO();*/
			
		/*	nDTO.setRegNo(userNo);
			nDTO.setNt_no(ntNo);
			NoticeDTO nDTO = noticeService.getNoticeDetail(userNo);*/

			model.addAttribute("fDTO",fDTO);//모델에 저장해서 jsp 에 보내줌
		
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
			
			return "/facility/fainfoDetail";
		}
/*	//이미지 /파일을 저장하기 위한 경로 설정
	String savePath= "C:\\SpringPRJ\\WebContent\\uploadImg\\";// 이거는 로컬 경로를 뜻하는지 알아야됨
	
	//시설관리 등록
	@RequestMapping(value="fa/faInfoReg")
	public String faInfoReg() throws Exception {
		return "/fa/faInfoReg";
	}
	
//시설 관리창
		@RequestMapping(value = "fa/faInfoReg")
		public String menuReg(HttpServletRequest req,Model model) throws Exception {
			List<faInfoDTO> cList = faService.getMenuList();
			
			log.info("faReg cList"+ cList.get(0).getfaNo());
			List<faAttachDTO> caList=faService.getfaListImg();
			
			model.addAttribute("mList", cList);
			model.addAttribute("caList",caList);
			
			log.info("faList End:"+this.getClass());
			return "/fa/faInfoReg";
		}
	
	 //시설관리 수정한것을 시설정보로 전송
	@RequestMapping(value="fa/faInfoProc", method=RequestMethod.POST)
	public String faInfoProc(HttpServletRequest request, Model model, @RequestParam("faimg") MultipartFile file) throws Exception {
		//dto 컬럼 추가    , 위에 img 관한 name을 받아야됨  @RequestParam(value="prdt") MultipartFile file
		//시설관리에대한 정보를 요청받고 dto 세팅 
		String faNo=CmmUtil.nvl(request.getParameter("faNo"));
		log.info("faNo: "+ faNo);
		String faName=CmmUtil.nvl(request.getParameter("faName"));
		log.info("faname: "+ faName);
		String faContent=CmmUtil.nvl(request.getParameter("faContent"));
		log.info("faContent: "+ faContent);
		String faAddr1=CmmUtil.nvl(request.getParameter("faAddr1"));
		log.info("faAddr1: "+ faAddr1);
		String faAddr2=CmmUtil.nvl(request.getParameter("faAddr2"));
		log.info("faAddr2: "+ faAddr2);
		String faPostAddr=CmmUtil.nvl(request.getParameter("faPostAddr"));
		log.info("fapostAddr: "+ faPostAddr);
		String faTel=CmmUtil.nvl(request.getParameter("faTel"));
		log.info("faTel: "+ faTel);
		String openDate=CmmUtil.nvl(request.getParameter("openDate"));
		log.info("openDate: "+ openDate);
		String faOpt=CmmUtil.nvl(request.getParameter("faOpt"));
		log.info("faOpt: "+ faOpt);
		String faClt=CmmUtil.nvl(request.getParameter("faClt"));
		log.info("faClt: "+ faClt);
		String regDate=CmmUtil.nvl(request.getParameter("regDate"));
		log.info("regDate: "+ regDate);
		String faHar=CmmUtil.nvl(request.getParameter("faHar"));
		log.info("faHar: "+ faHar);
		String faLat=CmmUtil.nvl(request.getParameter("faLat"));
		log.info("faLat: "+ faLat);
	
		FaDTO fDTO=new FaDTO(); 
		
		fDTO.setfaNo(faNo);
		fDTO.setfaName(faName);
		fDTO.setfaContent(faContent); //시설 내용을 셋팅
		fDTO.setfaAddr1(faAddr1); //시설 주소찾기1
		fDTO.setfaAddr2(faAddr2); //시설 주소찾기2
		fDTO.setfapostAddr(faPostAddr); //시설 주소
		fDTO.setfaTel(faTel);
		fDTO.setfaClt(faClt);
		fDTO.setfaOpt(faOpt);
		fDTO.setOpenDate(openDate);
		fDTO.setRegDate(regDate);
		fDTO.setfaLat(faLat); //위도
		fDTO.setfaHar(faHar); //경도
		
		FaAttachDTO caDTO= new FaAttachDTO();
		caDTO.setfaNo(faNo);
		caDTO.setRegDate(regDate);
		
		log.info("fDTO setting : " + fDTO.getfaName());
		
		if (file.getOriginalFilename().equals("")) {
			int result = faService.updatefaDetail(fDTO);
			String msg="";
			String url="";
			if(result==1) {
				msg="수정되었습니다.";
				url="/fa/faInfo.do?faNo=1";

			}else {
				msg="수정되지 않았습니다.";
				url="/fa/faInfo.do?faNo=1";
			}
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
			
			return "/alert";
		} else {
			
			
			int result=faService.deletefaImg(caDTO);
			log.info("delete confirm: " + result);
			if(result==1) {
		
		//이미지/ 파일업로드
		String reFileName=""; //파일이름을 재정의하기위환 변수 선언
		String fileOrgName=file.getOriginalFilename(); //원래의 파일명 // RequestParam name 요청으로 불러온 이미지의 원래 파일명
		log.info("fileOrgName:" +fileOrgName);
		String extended = fileOrgName.substring(fileOrgName.indexOf("."),fileOrgName.length()); //이미지의 명을 main.jpg 이런식으로 받아오는데 substring을 이용해 .뒤에 문자가 다나오도록 쓰는거 같음
		String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date()); //현재시간 나타내는 변수
		
		savePath =CmmUtil.nvl(savePath);// 저장할 위치에 변수가 널값이 들어오면 공백으로 바꿔주는 것 CmmUtil
		
		reFileName=savePath+now+extended;// 새로운 파일명으로 저장할 위치경로 +시간+ 확장자명 인거 같음 
		
		

		File newFile =new File(reFileName); //파일재정의 선언
		file.transferTo(newFile); //이 transferTo 는 MultiFile 에 내장된것/ 메소드를 사용해서 원하는 위치에 저장
		//InputStream을 얻은 다음에 직접 처리를 해줘도 되지만 성능 좋고 편하니까 transferTo()
		//데이터를 DTO에 세팅
		//2222
		
		faAttachDTO caDTO1 = new faAttachDTO();
		faaDTO1.setfaNo(faNo);
		faaDTO1.setfaImg(now+extended);
		faaDTO1.setfaImgOrg(fileOrgName);
		faaDTO1.setfaImgPath(savePath);
		faaDTO1.setRegDate(regDate);
			
		log.info("rrlagksrufs:"+caDTO1.getfaImg());
		int result2 = faService.updatefaDetail(fDTO);
		int result1 = faService.insertfaImg(faaDTO1);
		log.info("file result1" + result1);
		String msg="";
		String url="";
		if(result1+result2==2) {
			
			msg="수정되었습니다.";
			url="/fa/faInfo.do?faNo=1";
		}else {
			msg="수정되지 않았습니다.";
			url="/fa/faInfo.do?faNo=1";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		
		return "/alert";
	}
		
}
	log.info("faUpdateProc End" + this.getClass());
	return null;
	}
// 서비스 2개를 주고 result값에 입력, if문
*/	
	//시설정보로 이미지 불러오기
	@RequestMapping(value = "/facility/faInfo", method = RequestMethod.GET)
	public String faInfo(HttpServletRequest req,Model model) throws Exception { //jsp -> controller, controller ->jsp 
		
		String faNo = CmmUtil.nvl(req.getParameter("faNo"));
		log.info("faNo: "+ faNo);
		
		
	/*	String faImg = CmmUtil.nvl(req.getParameter("faImg"));
		String faImgPath = CmmUtil.nvl(req.getParameter("faImgPath"));
		String faImgOrg = CmmUtil.nvl(req.getParameter("faImgOrg"));*/ 
		
		
		//DTO세팅
	/*	FaDTO cDTO = new FaDTO();
		FaAttachDTO caDTO = new FaAttachDTO();
		
		//시설관리 넘버
		fDTO.setfaNo(faNo);
		log.info("cDTO getfaNo :" + fDTO.getfaNo());
		//시설관리 이미지 넘버
		faDTO.setfaNo(faNo);
		log.info("faaDTO getfaNo :" + faaDTO.getfaNo());

		fDTO = faService.getfaInfoDetail(fDTO);
		faaDTO = faService.getfaInfoAttach(faaDTO);*/
		
	/*//시설이미지
		caDTO2.setfaImg(faImg);
		log.info("caDTO getfaImg :"+ caDTO2.getfaImg());
		//시설이미지 경로
		caDTO2.setfaImgPath(faImgPath);
		log.info("caDTO getfaImgPath :"+ caDTO2.getfaImgPath());
		//시설이미지 원본명
		caDTO2.setfaImgOrg(faImgOrg);
		log.info("caDTO getfaImgOrg :"+ caDTO2.getfaImgOrg());*/
		
		/*model.addAttribute("cDTO", cDTO); // 키값, 밸류(저장한값)값
		model.addAttribute("caDTO", caDTO);*/
		
		return "/facility/faInfo";
		
	}
	
	////////////////////////////////////////////////////////////
	
		@RequestMapping(value="facility/fagd") //userList페이지를 요청 받을 때 매핑
		public String fagd(HttpServletRequest request, Model model) throws Exception{  //request, model객체를 매개변수로 하는 userList작성
			
			List<FaDTO> fList = fainfoService.getFagd();
			model.addAttribute("fList", fList);
			
			return "/facility/fagd"; // boardList 페이지로 이동
		}	
		
		
		//시설 상세보기
		
			@RequestMapping(value="facility/fagdDetail",method=RequestMethod.GET)
			public String fagdDetail(HttpServletRequest request,Model model,HttpSession session) throws Exception{
				//모델에저장해서 jsp 에 보내줘야됨
				
				/*String faname=CmmUtil.nvl(request.getParameter("faname"));
				log.info("fainfoDetail 시작:"+faname);*/
			//	HttpServletRequest request,
				String fano=CmmUtil.nvl(request.getParameter("fano"));
				log.info("fagdDetail 시작:"+fano);
				
			/*	String ntSort=CmmUtil.nvl(request.getParameter("ntSort"));
				System.out.println(" nt sort:"+ntSort);*/
				/*String ntSort=request.getParameter("nMPtSort");
				System.out.println(" nt sort:"+ntSort);
				*/
					
				log.info("fagdDetail 라인 오류체크 시작");
			
				FaDTO fDTO=new FaDTO();
				fDTO.setFano(fano);
				/*fDTO.setFaname(faname);*/
				
				fDTO=fainfoService.getFainfoDetail(fDTO);
			
				//nDTO1.setNtSort(ntSort);
				
				log.info("198라인 : "+fDTO.getFano());
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
				
				
				model.addAttribute("fDTO",fDTO);
							//nDTO =null;
				
				
				//호출 user 값을 불러서 regNo 에 세팅
			/*NoticeDTO nDTO =new NoticeDTO();*/
				
			/*	nDTO.setRegNo(userNo);
				nDTO.setNt_no(ntNo);
				NoticeDTO nDTO = noticeService.getNoticeDetail(userNo);*/

				model.addAttribute("fDTO",fDTO);//모델에 저장해서 jsp 에 보내줌
			
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
				
				return "/facility/fagdDetail";
			}
	/*	//이미지 /파일을 저장하기 위한 경로 설정
		String savePath= "C:\\SpringPRJ\\WebContent\\uploadImg\\";// 이거는 로컬 경로를 뜻하는지 알아야됨
		
		//시설관리 등록
		@RequestMapping(value="fa/faInfoReg")
		public String faInfoReg() throws Exception {
			return "/fa/faInfoReg";
		}
		
	//시설 관리창
			@RequestMapping(value = "fa/faInfoReg")
			public String menuReg(HttpServletRequest req,Model model) throws Exception {
				List<faInfoDTO> cList = faService.getMenuList();
				
				log.info("faReg cList"+ cList.get(0).getfaNo());
				List<faAttachDTO> caList=faService.getfaListImg();
				
				model.addAttribute("mList", cList);
				model.addAttribute("caList",caList);
				
				log.info("faList End:"+this.getClass());
				return "/fa/faInfoReg";
			}
		
		 //시설관리 수정한것을 시설정보로 전송
		@RequestMapping(value="fa/faInfoProc", method=RequestMethod.POST)
		public String faInfoProc(HttpServletRequest request, Model model, @RequestParam("faimg") MultipartFile file) throws Exception {
			//dto 컬럼 추가    , 위에 img 관한 name을 받아야됨  @RequestParam(value="prdt") MultipartFile file
			//시설관리에대한 정보를 요청받고 dto 세팅 
			String faNo=CmmUtil.nvl(request.getParameter("faNo"));
			log.info("faNo: "+ faNo);
			String faName=CmmUtil.nvl(request.getParameter("faName"));
			log.info("faname: "+ faName);
			String faContent=CmmUtil.nvl(request.getParameter("faContent"));
			log.info("faContent: "+ faContent);
			String faAddr1=CmmUtil.nvl(request.getParameter("faAddr1"));
			log.info("faAddr1: "+ faAddr1);
			String faAddr2=CmmUtil.nvl(request.getParameter("faAddr2"));
			log.info("faAddr2: "+ faAddr2);
			String faPostAddr=CmmUtil.nvl(request.getParameter("faPostAddr"));
			log.info("fapostAddr: "+ faPostAddr);
			String faTel=CmmUtil.nvl(request.getParameter("faTel"));
			log.info("faTel: "+ faTel);
			String openDate=CmmUtil.nvl(request.getParameter("openDate"));
			log.info("openDate: "+ openDate);
			String faOpt=CmmUtil.nvl(request.getParameter("faOpt"));
			log.info("faOpt: "+ faOpt);
			String faClt=CmmUtil.nvl(request.getParameter("faClt"));
			log.info("faClt: "+ faClt);
			String regDate=CmmUtil.nvl(request.getParameter("regDate"));
			log.info("regDate: "+ regDate);
			String faHar=CmmUtil.nvl(request.getParameter("faHar"));
			log.info("faHar: "+ faHar);
			String faLat=CmmUtil.nvl(request.getParameter("faLat"));
			log.info("faLat: "+ faLat);
		
			FaDTO fDTO=new FaDTO(); 
			
			fDTO.setfaNo(faNo);
			fDTO.setfaName(faName);
			fDTO.setfaContent(faContent); //시설 내용을 셋팅
			fDTO.setfaAddr1(faAddr1); //시설 주소찾기1
			fDTO.setfaAddr2(faAddr2); //시설 주소찾기2
			fDTO.setfapostAddr(faPostAddr); //시설 주소
			fDTO.setfaTel(faTel);
			fDTO.setfaClt(faClt);
			fDTO.setfaOpt(faOpt);
			fDTO.setOpenDate(openDate);
			fDTO.setRegDate(regDate);
			fDTO.setfaLat(faLat); //위도
			fDTO.setfaHar(faHar); //경도
			
			FaAttachDTO caDTO= new FaAttachDTO();
			caDTO.setfaNo(faNo);
			caDTO.setRegDate(regDate);
			
			log.info("fDTO setting : " + fDTO.getfaName());
			
			if (file.getOriginalFilename().equals("")) {
				int result = faService.updatefaDetail(fDTO);
				String msg="";
				String url="";
				if(result==1) {
					msg="수정되었습니다.";
					url="/fa/faInfo.do?faNo=1";

				}else {
					msg="수정되지 않았습니다.";
					url="/fa/faInfo.do?faNo=1";
				}
				model.addAttribute("url", url);
				model.addAttribute("msg", msg);
				
				return "/alert";
			} else {
				
				
				int result=faService.deletefaImg(caDTO);
				log.info("delete confirm: " + result);
				if(result==1) {
			
			//이미지/ 파일업로드
			String reFileName=""; //파일이름을 재정의하기위환 변수 선언
			String fileOrgName=file.getOriginalFilename(); //원래의 파일명 // RequestParam name 요청으로 불러온 이미지의 원래 파일명
			log.info("fileOrgName:" +fileOrgName);
			String extended = fileOrgName.substring(fileOrgName.indexOf("."),fileOrgName.length()); //이미지의 명을 main.jpg 이런식으로 받아오는데 substring을 이용해 .뒤에 문자가 다나오도록 쓰는거 같음
			String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date()); //현재시간 나타내는 변수
			
			savePath =CmmUtil.nvl(savePath);// 저장할 위치에 변수가 널값이 들어오면 공백으로 바꿔주는 것 CmmUtil
			
			reFileName=savePath+now+extended;// 새로운 파일명으로 저장할 위치경로 +시간+ 확장자명 인거 같음 
			
		

			File newFile =new File(reFileName); //파일재정의 선언
			file.transferTo(newFile); //이 transferTo 는 MultiFile 에 내장된것/ 메소드를 사용해서 원하는 위치에 저장
			//InputStream을 얻은 다음에 직접 처리를 해줘도 되지만 성능 좋고 편하니까 transferTo()
			//데이터를 DTO에 세팅
			//2222
			
			faAttachDTO caDTO1 = new faAttachDTO();
			faaDTO1.setfaNo(faNo);
			faaDTO1.setfaImg(now+extended);
			faaDTO1.setfaImgOrg(fileOrgName);
			faaDTO1.setfaImgPath(savePath);
			faaDTO1.setRegDate(regDate);
				
			log.info("rrlagksrufs:"+caDTO1.getfaImg());
			int result2 = faService.updatefaDetail(fDTO);
			int result1 = faService.insertfaImg(faaDTO1);
			log.info("file result1" + result1);
			String msg="";
			String url="";
			if(result1+result2==2) {
				
				msg="수정되었습니다.";
				url="/fa/faInfo.do?faNo=1";
			}else {
				msg="수정되지 않았습니다.";
				url="/fa/faInfo.do?faNo=1";
			}
			model.addAttribute("url",url);
			model.addAttribute("msg",msg);
			
			
			return "/alert";
		}
			
	}
		log.info("faUpdateProc End" + this.getClass());
		return null;
		}
	// 서비스 2개를 주고 result값에 입력, if문
	*/	
			
			//시설 상세보기
			@RequestMapping(value="facility/faSearch",method=RequestMethod.GET)
			public String faSerach(HttpServletRequest request,Model model,HttpSession session) throws Exception{
				//모델에저장해서 jsp 에 보내줘야됨
				
				/*String faname=CmmUtil.nvl(request.getParameter("faname"));
				log.info("fainfoDetail 시작:"+faname);
			//	HttpServletRequest request,
				String fano=CmmUtil.nvl(request.getParameter("fano"));
				log.info("fainfoDetail 시작:"+fano);
				
				String ntSort=CmmUtil.nvl(request.getParameter("ntSort"));
				System.out.println(" nt sort:"+ntSort);
				String ntSort=request.getParameter("nMPtSort");
				System.out.println(" nt sort:"+ntSort);
				
					
				log.info("faSearch 라인 오류체크 시작");
			
				FaDTO fDTO=new FaDTO();
				fDTO.setFano(fano);
				fDTO.setFaname(faname);
				
				fDTO=fainfoService.getFainfoDetail(fDTO);
			
				//nDTO1.setNtSort(ntSort);
				
				log.info("198라인 : "+fDTO.getFano());
				//nDTO.setNtSort(ntSort);
				
				NoticeDTO nDTO=noticeService.getBoardDetail(nDTO);
				log.info(FantNo);
				//
				int updateCount=noticeService.updateBoardCount(FantNo);
				log.info("142번 :"+updateCount);
				//System.out.println(("142번 :"+updateCount));
				//여기가 고친부분 지금 2018년 7월 4일@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			
				/////////////////////////////////////////////////////////여기까지는 detail
			
				log.info("152 카운트:"+nDTO.getNtCount());
				
				
				model.addAttribute("fDTO",fDTO);
							//nDTO =null;
				
				
				//호출 user 값을 불러서 regNo 에 세팅
			NoticeDTO nDTO =new NoticeDTO();
				
				nDTO.setRegNo(userNo);
				nDTO.setNt_no(ntNo);
				NoticeDTO nDTO = noticeService.getNoticeDetail(userNo);

				model.addAttribute("fDTO",fDTO);//모델에 저장해서 jsp 에 보내줌
			
								
									HashMap<String,Object> map = new HashMap<String,Object>();
									map.put("user_no", userNo);// 파라미터값 , 
									map.put("nt_no", ntNo);
									map.put("nt_sort", ntSort);
									map.put("qa_grpno", qaGrpno);
									//detail 	//count
									
									
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
				
				return "/facility/faSearch";
			}
}
