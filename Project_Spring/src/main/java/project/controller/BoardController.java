package project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.service.Board_service.ComService;
import project.service.Board_service.FileService;
import project.service.Board_service.LinkService;
import project.service.Board_service.ProService;
import project.dto.Comdto;
import project.dto.Filedto;
import project.dto.Linkdto;
import project.dto.Prodto;



@Controller
public class BoardController {

	
	@Autowired
	// EmpService 타입에 넣음
	ProService ProService;
	
	@Autowired
	ComService Comservice;
	
	@Autowired
	LinkService Linkservice;
	
	@Autowired
	FileService Fileservice;
	
	
//	// 목록 전시
//	@RequestMapping(value = "/select")
//	public String selectEmp(
//			Model model, 
//			
//			@ModelAttribute // dto값 파라미터
//			Prodto dto
////			HttpServletRequest request
//			
//			) {
//
//		// 리스트로 담기 // 호출
//		List<Prodto> list = ProService.getEmpList();
//		System.out.println(" 목록 크기 " + list.size());
//		int view = ProService.Viewcount(dto);
//		model.addAttribute("select", list);
//
//		return "board";
//		// "Model 객체를 사용하여 명시적"으로 추가하고 있습니다.
//		// "클라이언트 요청 파라미터"를 처리하지 않으므로 @ModelAttribute의 자동 바인딩 기능이 필요하지 않습니다.
//	}
	
	
	
	
	
	
	         // 목록에 표시
	        // 페이지 겸 셀렉트
			// 전체조회 // 메소드 GET
			@RequestMapping(value = "/select")
			public String Pagesel(
					Model model, 
//					@RequestParam("category") String categoryValue,
					@ModelAttribute // dto값 파라미터
					Prodto dto,
					HttpServletRequest request
					
					) {
				
System.out.println("접속중....");
		            
				
				
HttpSession session = request.getSession();
String userId = (String) session.getAttribute("userId");
dto.setUserid(userId);
String iduser = dto.getUserid();
System.out.println("Prodto.getUserid(); : " + iduser);
System.out.println("유저아이디 : " + userId);
//if(userId.contains("admin")) {
//         dto.setNotify("P");
//} else {
//	     dto.setNotify("H");
//}
//
//String not = dto.getNotify();
//System.out.println("공지사항 항목은 뭐가 나올까" + not);
				
				
				
				
				
				
//				int page = 1;
//				String stpage = request.getParameter("page");
//				if(stPage != null) {
//					page = Integer.parseInt(stpage);
//				} "null값 방지"
//				
//				
//				하드코딩
//				int viewCount = 3;
//				dto.setPage(page);
//				dto.setViewCount(viewCount); 
				
				
int normalCount = ProService.totalist(dto);
model.addAttribute("normalCount", normalCount);
System.out.println("일반게시글 숫자 :" + normalCount);				
				
				
//                List<Prodto> search = ProService.search(dto);
                
                
				int view = ProService.Viewcount(dto);
			     // ??????????
				// 리스트로 담기 // 호출
				// List<EmpDTO> list = EmpService.getEmpList();
				Map map = ProService.SelectPage(dto);
				System.out.println(" 페이지겸셀렉트dto :" + dto);
				System.out.println(" 맵 크기 " + map.size());
				System.out.println(" 맵 내용 : " + map);
//				System.out.println("list.size : " + list.size());
				model.addAttribute("map", map);  // 돌려줄때 map.empno처럼 표기.
				model.addAttribute("dto", dto);   // 명시적으로 쓰기
				
				
//				model.addAttribute("search", search);   // 명시적으로 쓰기
//				model.addAttribute("list", list);

				
				
				
//				if (dto.getPage() <= 0) {
//				    dto.setPage(1);
//				}
//				if (dto.getPagecount() <= 0) {
//				    dto.setPagecount(3);                
//				    
//				  
//				}
				  // 기본값 설정
//				if(categoryValue.equals("normal")) {
//					dto.setNotify("N");  // 일반게시판
//				} else {
//					dto.setNotify("Y");  // 공지사항
//				}
//				
				
				
				String notifydto = dto.getNotify();
				System.out.println("이것은 notifydto : " + notifydto);
				
				
				
				
//				 if (notifydto == null || notifydto.isEmpty()) {
//				        return "redirect:/select?notify=N";
//				    } else if (notifydto.equals("Y")) {
//				    	return "redirect:notify";
//				    } else {
//				    	return "board";
//				    }
				
				
				if (notifydto == null || notifydto.isEmpty()) {
					return "redirect:/select?notify=N";
			    } 
				
				    // 이거 그냥쓰면 jsp라 비어있음
			    	return "board";
				
						
								
				// "Model 객체를 사용하여 명시적"으로 추가하고 있습니다.
				// "클라이언트 요청 파라미터"를 처리하지 않으므로 @ModelAttribute의 자동 바인딩 기능이 필요하지 않습니다.
			}
	
	
	
	// 생성 입구
	@RequestMapping(value = "/write")
	public String writeEmp() {
			
	
		return "Write";
		
	}
	
	// 생성 데이터
//	@ResponseBody
	@RequestMapping(value = "/insert")
	public String insertEmp(
			                               
			@RequestParam("category") String categoryValue,
			Model model, 
			
			@ModelAttribute
			Prodto Prodto,
			
			@ModelAttribute
			Linkdto Linkdto,
			
//			@ModelAttribute
//			Filedto Filedto,
			
			
			MultipartHttpServletRequest req,
			HttpServletRequest request
			
			) {
   
		if(categoryValue.equals("normal")) {
			Prodto.setNotify("N");  // 일반게시판
		} else if(categoryValue.equals("notify")){
			Prodto.setNotify("Y");  // 공지사항
		} else {
			return "redirect:write";
		}

		
		
		
		
		
		
		
		
		// 1. 글 생성 // 글쓰기에서 목록으로 
		int intdto = ProService.insertEmpList(Prodto);
		
		
		
		System.out.println( "옵션 : " + categoryValue);
		
		
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userId");
		Prodto.setUserid(userid);
		
		String iduser = Prodto.getUserid();
		System.out.println("Prodto.getUserid(); : " + iduser);
		System.out.println("유저아이디 : " + userid);
		
		
		String not = Prodto.getNotify();
		System.out.println("공지사항 항목은 뭐가 나올까" + not);
		
		
		
		
		
		
		
		// 키포인트
		int id = Prodto.getPostid();
		System.out.println("post아이디 : " + id);
		// 키포인트
		
		
		// 2. 링크 생성
		Linkdto.setPostid(id);
//		System.out.println("post아이디2 : " + id2);
		// file_name
		int linkdto = Linkservice.Linkint(Linkdto);
		System.out.println(" Linkdto : " + Linkdto);
		System.out.println(" 글 생성 성공시 1 :  " + intdto);
		
		
		
		// 3. 파일 생성
		// "DB" 저장
		
		
//		Filedto.setPostid(id);
//		int filedto = Fileservice.Fileint(Filedto);
//		System.out.println(" Filedto : " + Filedto);
		
		
		
		
		// 3-2. 파일 "업로드" 처리
		// 업로드를 해야 다운로드 가능
//         MultipartFile Mf = req.getFile("file1");
		
		  List<MultipartFile> fileList = req.getFiles("file_name");
          for(MultipartFile mf : fileList) {
  
  	long fileSize = mf.getSize();
      System.out.println("fileSize: "+ fileSize);
      
      String fileName = mf.getOriginalFilename();
      System.out.println("fileName: "+ fileName);
      
      try {
          String path = "C:\\temp\\upload";
          
          String safeFileName = path +"\\"+ fileName;
          System.out.println("safeFileName: "+ safeFileName);
          File file = new File(safeFileName);
          
          Filedto filedto = new Filedto();
          filedto.setPostid(id);
          filedto.setFile_name(fileName);
          int dtofile = Fileservice.Fileint(filedto);
          System.out.println(" 파일 생성 성공시 1 :  " + dtofile);
          
          mf.transferTo( file );
          
      } catch (IllegalStateException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
      } catch (IOException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
      }
  }
		
		
            Map map = ProService.SelectPage(Prodto);
			System.out.println(" 페이지겸셀렉트dto :" + Prodto);
			System.out.println(" 맵 크기 " + map.size());
			System.out.println(" 맵 내용 : " + map);
//			System.out.println("list.size : " + list.size());
			model.addAttribute("map", map);  // 돌려줄때 map.empno처럼 표기.
			model.addAttribute("dto", Prodto);   // 명시적으로 쓰기
		
		
		
		
		
		
          String notifydto = Prodto.getNotify();
		
		
//          if (notifydto == null || notifydto.isEmpty()) {
//		        return "redirect:/select?notify=N";
//		    } else if (notifydto.equals("Y")) {
//		    	return "Notify";
//		    } else {
//		    	return "board";
//		    }
//		
		
		
			/*
			 * if (notifydto == null || notifydto.isEmpty()) { return
			 * "redirect:/select?notify=N"; }
			 */
			
			    // 이거 그냥쓰면 jsp라 비어있음
		    	return "redirect:/select?notify=" + notifydto;
	}
	

		
	
	
	// 글 내용 // 목록에서 상세글로 
	@RequestMapping(value = "/Content")
	public String contentEmp(
			
			@RequestParam(value="postid") int postid,
			@ModelAttribute
			Prodto prodto, 
			Comdto comdto,
			Linkdto Linkdto,
			Filedto Filedto,
			Model model
			
			
			) {
		
		
//		    int linkdto = Linkservice.Linkint(Linkdto);
		    
		
		
		String notifydto = prodto.getNotify();
		System.out.println("공지사항dto 확인하기!!!! : " + notifydto);
		
		
		    System.out.println(" 컨텐츠 DTO :" + prodto);
		    Prodto dtopro = ProService.Contentemp(prodto);
		    int view = ProService.Viewcount(prodto);
		    model.addAttribute("con", dtopro);
		    model.addAttribute("cons", notifydto);
		    
		    
//	        List<Comdto> comsel = Comservice.Comsel(postid);
//	        // 입력한 값
//		    System.out.println(" Comdto :" + postid);
//		    // 전체 목록
//		    System.out.println(" 댓글목록 Content :" + comsel);
//		    model.addAttribute("comsel", comsel);
	
		    // 댓글 미리 조회하기 * 중요
		    List<Comdto> selcom = Comservice.Comselid(postid);
	        System.out.println(" Comdto " + postid);
	        System.out.println(" 댓글 하나 Content " + selcom);
		    model.addAttribute("selcom", selcom);
		    
		    // 상세글에 링크 뿌리기
		    Linkdto Linkselid = Linkservice.Linkselid(Linkdto);
		    System.out.println("링크  DTO : " + Linkdto);
		    System.out.println("링크 하나만 뽑기 : " + Linkselid);
		    model.addAttribute("Linkselid", Linkselid);
		    
		    // 상세글에 파일 뿌리기
		    List<Filedto> Fileselid = Fileservice.Fileselid(Filedto);
		    System.out.println("파일  DTO : " + Filedto);
		    System.out.println("파일 하나만 뽑기 : " + Fileselid);
		    model.addAttribute("Fileselid", Fileselid);
		    
		    
		    
		    
		    
		return "Content";
		
	}
	
	
	
	
	
	
	// 글 삭제
		@RequestMapping(value = "/condel")
		public String condel(
				
				@ModelAttribute
				Prodto prodto
				
				
				
				) {
			
			    
			    int condel = ProService.Condel(prodto);
			    
			    System.out.println(" 컨텐츠 삭제되면 1이뜸 " + condel);
			    
		
			return "forward:select";
			
		}
		
	    
		
		
		// 글 수정 정보
		@RequestMapping(value = "/conmod", method = RequestMethod.GET)
		public String conmod(
				
				
				@ModelAttribute Prodto prodto,
				@ModelAttribute Linkdto linkdto,
				@ModelAttribute Filedto Filedto,
				Model model
									
				) {
			
			
			    System.out.println(" 컨텐츠 수정 정보 DTO " + prodto);
			    Prodto conmod = ProService.Contentemp(prodto);
			    System.out.println(" 컨텐츠 수정  정보 DTO2 " + conmod);
			    model.addAttribute("modi", conmod);
			    
			    System.out.println(" 링크 수정 정보 DTO " + linkdto);
			    Linkdto dtolink = Linkservice.Linkselid(linkdto);
			    System.out.println(" 링크 수정 정보 DTO2 :" + dtolink);
			    model.addAttribute("dtolink", dtolink);
			
			    // 상세글에 파일 뿌리기
			    List<Filedto> Fileselid = Fileservice.Fileselid(Filedto);
			    System.out.println("파일  DTO : " + Filedto);
			    System.out.println("파일 하나만 뽑기 : " + Fileselid);
			    model.addAttribute("Fileselid", Fileselid);
			    
			    
			    
				
			return "Modify";
			
		}	
		
		// 수정 입구
		@RequestMapping(value = "/Modifyin")
		public String Modifyin() {
				
		
			return "Modify";
			
		}
		
		// 글 수정
		@RequestMapping(value = "/conup")
		public String conup(
				
				HttpServletRequest request,
				@RequestParam("category") String categoryValue,
				MultipartHttpServletRequest req,
				@ModelAttribute Prodto prodto,
				@ModelAttribute Linkdto linkdto,
				Model model
//				Filedto filedto
//				Model model
									
				) {
			
				// 키포인트
				int id = prodto.getPostid();
				System.out.println("post아이디 수정씨 : " + id);
				// 키포인트
			
			    // 공지사항 일반게시판 글 구분
				if(categoryValue.equals("normal")) {
					prodto.setNotify("N");  // 일반게시판
				} else {
					prodto.setNotify("Y");  // 공지사항
				}
			
			
			    System.out.println(" 컨텐츠 수정임 DTO " + prodto);
			    int conmod = ProService.Conup(prodto);
		        System.out.println(" 컨텐츠 수정임 DTO2 " + conmod);
			    int modlink = Linkservice.Linkfix(linkdto);
			    System.out.println(" 링크 수정임 ㅇㅇ " + modlink);
//		        model.addAttribute("modi", conmod);
			    
			
				
			    
			    
			    List<MultipartFile> fileList = req.getFiles("file_name");
		          for(MultipartFile mf : fileList) {
		  
		  	long fileSize = mf.getSize();
		      System.out.println("fileSize: "+ fileSize);
		      
		      String fileName = mf.getOriginalFilename();
		      System.out.println("fileName: "+ fileName);
		      
		      try {
		          String path = "C:\\temp\\upload";
		          
		          String safeFileName = path +"\\"+ fileName;
		          System.out.println("safeFileName: "+ safeFileName);
		          File file = new File(safeFileName);
		          
		          Filedto filedto = new Filedto();
		          filedto.setPostid(id);
		          filedto.setFile_name(fileName);
		          int dtofile = Fileservice.Fileint(filedto);
		          int modfile = Fileservice.Filefix(filedto);
		          System.out.println(" 파일 생성 성공시 1 :  " + modfile);
		          
		          mf.transferTo( file );
		          
		      } catch (IllegalStateException e) {
		          // TODO Auto-generated catch block
		          e.printStackTrace();
		      } catch (IOException e) {
		          // TODO Auto-generated catch block
		          e.printStackTrace();
		      }
		  }
			    
			    
			    
		          HttpSession session = request.getSession();
		  		String userid = (String) session.getAttribute("userId");
		  		prodto.setUserid(userid);
		  		
		  		String iduser = prodto.getUserid();
		  		System.out.println("Prodto.getUserid(); : " + iduser);
		  		System.out.println("유저아이디 : " + userid);
		  		
		  		
		  		String not = prodto.getNotify();
		  		System.out.println("공지사항 항목은 뭐가 나올까" + not);
			    
			    
			    
			    
			    
		            Map map = ProService.SelectPage(prodto);
					System.out.println(" 페이지겸셀렉트dto :" + prodto);
					System.out.println(" 맵 크기 " + map.size());
					System.out.println(" 맵 내용 : " + map);
//					System.out.println("list.size : " + list.size());
					model.addAttribute("map", map);  // 돌려줄때 map.empno처럼 표기.
					model.addAttribute("dto", prodto);   // 명시적으로 쓰기	    
			    
					
			    
					if(categoryValue.equals("normal")) { 
						prodto.setNotify("N");
						
//						return "redirect:/select?notify=N";
					} else if(categoryValue.equals("notify")){
						prodto.setNotify("Y");
						
//						return "redirect:/select?notify=Y";
					} else {
						 return "redirect:/conmod?postid=" + prodto.getPostid();
						
					}
					
					
					
					
					ProService.Conup(prodto);
					return "redirect:/select?notify=" + prodto.getNotify();
			
		}	
		
		
		
		
		
		
		
		
		
		
		// 파일 다운로드
		@RequestMapping(value = "/downloads")
		public String download(
				
				
				HttpServletRequest request,
				HttpServletResponse response
									
				) throws IOException {
			
			
			   
			String fileName = request.getParameter("file_name");
			System.out.println("download fileName : "+ fileName );
		      String path = "C:\\temp\\upload";
		      File file = new File(path +"\\"+ fileName);
		      
		      // 브라우저 캐시를 사용하지 않도록 설정
		      response.setHeader("Cache-Control", "no-cache");
		      // 지금 응답이 첨부파일이라는 것
		      // 그리고 그 파일 이름이 뭐 라는 것
		      response.addHeader("Content-disposition", "attachment; fileName="+ fileName);
		      
		      // 파일 읽기
		      FileInputStream fis = new FileInputStream(file);
		      // 메모리로 퍼 올릴 바가지 크기 설정
		      byte[] buf = new byte[1024 * 1]; // 보통은 8kB
		      
		      OutputStream os = response.getOutputStream();
		      
		      int count = -1;
		      // 바가지 크기 만큼 읽음
		      // 읽을게 없으면 -1
		      while(  (count = fis.read(buf)) != -1  ) {
		         // 브라우저로 내보냄
		         // 0 : 건너뛰 byte 수
		         // count : 보낼 byte 수
		         os.write(buf, 0, count);
		      }
		      os.flush();
		      os.close();
		      fis.close();
			
			
			
			
			
			
			
			
				
			return "board";
			
		}	

		
		
		// 파일 삭제
		@RequestMapping(value = "/filedel")
		public String filedel(
				
				@ModelAttribute Filedto filedto,
				@ModelAttribute Prodto prodto
				
				) {
			
			    System.out.println("??????????? :" + filedto);
			    int filedel = Fileservice.Filedel(filedto);
			    int postid = prodto.getPostid();
			    System.out.println(" 파일 삭제 포스트아이디" + prodto.getPostid());
			    System.out.println(" 파일 삭제되면 1이뜸 " + filedel);
			    
		
			return "redirect:/conmod?postid=" + postid;
			
		}
		
		
		
		
		// 검색
		@RequestMapping(value = "/search")
		public String search(
				
				// 404시 이쪽으로 안들어오는거
				@ModelAttribute Prodto prodto,
				HttpServletRequest request,
				Model model
				
				
				) {
			
			
		        System.out.println("검색 title: " + prodto.getTitle());
		        System.out.println("검색 notify: " + prodto.getNotify());
			    System.out.println("검색 prodto 조회 :" + prodto);
			    
			    Map<String, Object> maps = ProService.search(prodto);
			    System.out.println(" 검색맵 크기 " + maps.size());
			    
				
			    
			    
//			    System.out.println("검색 결과 수: " + ((List)map.get("resultList")).size());
//			    int postid = prodto.getPostid();
//			    System.out.println(" 파일 삭제 포스트아이디" + prodto.getPostid());
			    System.out.println(" 검색 맵 " + maps);
			    model.addAttribute("map", maps);
			    model.addAttribute("dto", prodto);
	            
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    if(prodto.getTitle() == null || prodto.getTitle().trim().isEmpty()) {
					
					return "redirect:select";
					
				} else {
					
					return "board";					
				}
			    
			
		}

}
