package project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.dto.Bom_DTO;
import project.dto.Materials_DTO;
import project.dto.ProductionProcessDescription_DTO;
import project.dto.Products_DTO;
import project.dto.User_DTO;
import project.service.Build_of_Materials.Build_of_Materials_service;
import project.service.Standard_total_service.MaterialsProducts_service;
import project.service.Standard_total_service.Materials_service;
import project.service.Standard_total_service.Products_service;
import project.service.production_process_service.production_process_service;
//자 여기는 bom,재고,관련된 controller입니다 싹다 몰아주세요 
//원재료 완제품 조회
@Controller
public class Bom_total_controller {

	@Autowired
	Materials_service materials_service;
	@Autowired
	Products_service Products_service;
	@Autowired
	MaterialsProducts_service materialsProducts_service;
	@Autowired
	production_process_service service; 
	@Autowired
	Build_of_Materials_service build_of_Materials_service;
	
	@Autowired
	private ServletContext servletContext;
	

	
	
	
//	@RequestMapping("/standard" )
	@RequestMapping(value="/standard",method=RequestMethod.GET)
	public String standard(Model model,@RequestParam(value="view_value", required=false)String view_value,
			HttpSession httpSession,
			Materials_DTO materials_DTO,
			Products_DTO products_DTO ) {
		User_DTO Field2 = (User_DTO) httpSession.getAttribute("user");
		String Field = Field2.getJob();
		System.out.println("Field2"+Field2);
		System.out.println("Field :"+ Field);
		String id = (String)httpSession.getAttribute("id");
		System.out.println("Field ="+ Field);
		
		
		try {

			System.out.println("---------view_value :"+view_value);
			if(view_value == null) {
				view_value = "1";
				System.out.println("view_value 널이벤트값 :"+view_value);
			}
			if(view_value.equals("1")) {
				System.out.println("1번원재료조회");
				System.out.println("1번 view_value 값"+view_value);
				Map map = materials_service.selectMaterials(materials_DTO);
				
				model.addAttribute("map",map);
				model.addAttribute("mDTO",materials_DTO);
				
				System.out.println("map : "+map +""+ "materials_DTO :"+materials_DTO);
				
			}else if(view_value.equals("2")) {
				System.out.println("2번완제품조회");
				System.out.println("2번 view_value 값"+view_value);
				
				Map map = Products_service.selectProducts(products_DTO);
				
				model.addAttribute("map",map);
				model.addAttribute("pDTO",products_DTO);
				
				System.out.println("map : "+map +""+ "products_DTO :"+products_DTO);
				
			}else if(view_value.equals("3")) {
				System.out.println("3번완제품조회");
				Map map = materialsProducts_service.selectMaterialsProducts(materials_DTO);
				
				model.addAttribute("map",map);
				model.addAttribute("materials_DTO",materials_DTO);
				
				System.out.println("map : "+map +""+ "materials_DTO :"+materials_DTO);
			}
			
			model.addAttribute("Field",Field);
			model.addAttribute("view_value",view_value);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "standard";
	}
	
//	원재료 생성, 삭제(수정) , 수정 
	//생성
	@ResponseBody
	@RequestMapping(value="/standard_insert",method=RequestMethod.POST)
	public int standardinsert(@RequestBody Materials_DTO materials_DTO ) {
		System.out.println("standard_insert 실행");
		System.out.println("materials_DTO 값은 ="+materials_DTO);
		int result = 0;
		try {			
			result = materials_service.insertMaterials(materials_DTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("materials_insert_post :"+result);
		return result;
	}
	//수정
	@ResponseBody
	@RequestMapping(value="/standard_update",method=RequestMethod.PUT)
	public int standardupdate(@RequestBody Materials_DTO materials_DTO ) {
		System.out.println("standard_update 실행");
		System.out.println("materials_DTO 값은 ="+materials_DTO);
		int result = 0;
		try {			
			result = materials_service.updateMaterials(materials_DTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("materials_update_put :"+result);
		return result;
	}
	
	//삭제
	@ResponseBody
	@RequestMapping(value="/standard_delet",method=RequestMethod.PUT)
	public int standarddelet(@RequestBody Materials_DTO materials_DTO) {
		System.out.println("standard_delet 실행");
		System.out.println("materials_DTO 값은 ="+materials_DTO);
		
		int result = 0;
		try {			
			result = materials_service.deleteMaterials(materials_DTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("materials_update_put :"+result);
		return result;
		
		
	}
	
//	=====완제품 생성, 삭제(수정) , 수정 
	//생성
	@ResponseBody
	@RequestMapping(value="/products_insert",method=RequestMethod.POST)
	public int productsinsert(@RequestBody Products_DTO products_DTO ) {
		System.out.println("products_insert 실행");
		System.out.println("products_DTO 값은 ="+products_DTO);
		int result = 0;
		try {			
			result = Products_service.insertProducts(products_DTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("products_insert_post :"+result);
		return result;
	}
	//수정
	@ResponseBody
	@RequestMapping(value="/products_update",method=RequestMethod.PUT)
	public int productsupdate(@RequestBody Products_DTO products_DTO ) {
		System.out.println("products_update 실행");
		System.out.println("products_DTO 값은 ="+products_DTO);
		int result = 0;
		try {			
			result = Products_service.updateProducts(products_DTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("products_update_put :"+result);
		return result;
	}
	
	//삭제
	@ResponseBody
	@RequestMapping(value="/products_delet",method=RequestMethod.PUT)
	public int productsdelet(@RequestBody Products_DTO products_DTO) {
		System.out.println("products_delet 실행");
		System.out.println("products_DTO 값은 ="+products_DTO);
		int result = 0;
		try {			
			result = Products_service.deleteProducts(products_DTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("products_update_put :"+result);
		return result;
		
		
	}
//-----------------------------------------------------------------	
	

// 검사기준 
//----------------------------------------------------------------
	//전체 조회
	@RequestMapping(value="/inspectionStandards",method=RequestMethod.GET)
	public String inspectionStandards(Model model,
			HttpSession httpSession,
			Products_DTO products_DTO
			)  {
		System.out.println("inspectionStandards 실행");
		System.out.println("컨트롤러가 받은값 :"+products_DTO);
		User_DTO Field2 = (User_DTO) httpSession.getAttribute("user");
		String Field = Field2.getJob();
		String nameserch = products_DTO.getSerch();
		System.out.println("products_DTO.getSerch() 값은 :"+nameserch);
		try {
//			Map map = Products_service.selectFinishedProduct(products_DTO);
//			List name_list = Products_service.selectProductname();
			Map map = Products_service.selectProductnameserch(products_DTO);
			List name_list = Products_service.selectProductname();
			
			
			model.addAttribute("nameserch",nameserch);
			model.addAttribute("map",map);
			model.addAttribute("pDTO",products_DTO);
			model.addAttribute("name_list",name_list);
			model.addAttribute("Field",Field);
			System.out.println("map : "+map);
			System.out.println("products_DTO"+products_DTO.getSerch());
			System.out.println("name_list"+name_list);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		 
		return "inspectionStandards";
	}
	
	// 검색어조회
	@ResponseBody
	@RequestMapping(value="/insSelectone",method=RequestMethod.GET)
	public Map<String,Object> insSelectone(
			 Products_DTO products_DTO ,
			HttpSession httpSession
			) {
		System.out.println("검색값 productname"+products_DTO);
		User_DTO Field2 = (User_DTO) httpSession.getAttribute("user");
		String Field = Field2.getJob();
		
		Map<String,Object> map = new HashMap();
		Map<String,Object> pickname = new HashMap();
		try {
			pickname = Products_service.selectProductnameserch(products_DTO);
			List name_list = Products_service.selectProductname();
			
//			Map map = Products_service.selectFinishedProduct(products_DTO);
//			List name_list = Products_service.selectProductname();
			
			
			map.put("Field", Field);
			map.put("pickname",pickname);
			map.put("name_list",name_list);
			map.put("pDTO",products_DTO);
			System.out.println("밀키트 검색한 결과값name_list ="+name_list);
			System.out.println("--------------");
			System.out.println("pickname ="+pickname);
			System.out.println("--------------");
			System.out.println("Field ="+Field);
		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return map ;
	}
	
	//수정클릭시 프러덕트id기준으로 조회
	@ResponseBody
	@RequestMapping(value="/insSelectproductid",method=RequestMethod.GET)
	public Map<String,Object> insSelectproductid(
			@RequestParam("productid") int productid,
			Model model,
			HttpSession httpSession

			) {
		
		System.out.println("insSelectproductid_프러덕트id검색");
		System.out.println("검색값 productid"+productid);
		User_DTO Field2 = (User_DTO) httpSession.getAttribute("user");
		String Field = Field2.getJob();
		Map<String,Object> result = new HashMap();
		
		try {
			List pickid = Products_service.selectProducidserch(productid);
			List name_list = Products_service.selectProductname();
			
			result.put("Field", Field);
			result.put("pickid",pickid);
			result.put("name_list",name_list);
			System.out.println("밀키트 검색한 결과값name_list ="+name_list);
			System.out.println("pickid ="+pickid);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result ;
	}
	
	

	
	//수정 및 파일 업로드 
	@ResponseBody
	@RequestMapping("/upload")
    public int upload( 
    		MultipartHttpServletRequest req 
    		) throws IOException {
		System.out.println("파일업로드컨트롤러실행");
		req.setCharacterEncoding("utf-8");
		
		String productid = req.getParameter("pid");
		String productname = req.getParameter("pname");
		String normalcriteria = req.getParameter("normalProduct");
		String abnormalcriteria = req.getParameter("abnormalProduct");
		
		System.out.println("productid"+productid);
		System.out.println("productname"+productname);
		System.out.println("normalcriteria"+normalcriteria);
		System.out.println("abnormalcriteria"+abnormalcriteria);
	
		
		MultipartFile mf = req.getFile("uplodeFile");
		long fileSize = mf.getSize();
		
		System.out.println("fileSize"+fileSize);
		String fileName = mf.getOriginalFilename();
		System.out.println("fileName"+fileName);
		int result = 0;
		try {

		
			
//			String realPath = "C:\\Users\\admin\\Desktop\\project\\Project_Spring\\src\\main\\webapp\\resources\\img";
			String realPath = "C:\\project\\img";
			String productimage = System.currentTimeMillis() + "_" + fileName;
			String safeFileName = realPath + "\\" +productimage;
		
			System.out.println("safeFileName"+safeFileName);
			File file = new File(safeFileName);
			System.out.println("mf.transferTo전file"+file);
			try {
				mf.transferTo( file );			
				System.out.println("파일업로드성공");
			}catch (IOException e) {
				e.printStackTrace();
			
			}
			System.out.println();
			
			//이미지 네임 set으로 넣음
			
			Products_DTO dto = new Products_DTO();
		
			dto.setProductId(Integer.parseInt(productid));
			dto.setProductname(productname);
			dto.setNormalcriteria(abnormalcriteria);
			dto.setAbnormalcriteria(abnormalcriteria);
			dto.setProductimage(productimage);
			result = Products_service.updateProductsFhinish(dto);
			// jsp에 프러덕트 id있는지 확인 1.html에 id있는지확인 있으면 아작스  formData에담기 
			System.out.println("완제품 업데이트결과:"+ result);
			
		}catch (IllegalStateException e) {
			e.printStackTrace();
		}
		
		System.out.println("redirect:/inspectionStandards");
		return result;
			
	}
	
	//파일다운로드 컨트롤러 
		@RequestMapping("/download")
	    public void download(
	    		HttpServletRequest request,HttpServletResponse response  
	    		) throws IOException {
				System.out.println("download 싱행");
			
			try {
				String fileName = request.getParameter("filename");
				System.out.println("fileName --"+fileName);
			
//				String path = "C:\\Users\\admin\\Desktop\\project\\Project_Spring\\src\\main\\webapp\\resources\\img";
				String path = "C:\\project\\img";
				File file = new File(path + "\\" + fileName);
				
				//브라우저 캐시를 사용하지 않도록 설정
				response.setHeader("Cashe-Control", "no-cashe");
				//지금 응답이 첨부파일이라는 것
				//그리고 그 파일 이름이 뭐 라는 것
				response.addHeader("Content-Disposition", "attachment; fileName"+fileName);
				//파일 보낼꺼야 알려주기
				
				
				// 파일 읽기
				FileInputStream fis = new FileInputStream(file);
				// 메모리로 퍼 올릴 바가지 크기 설정
				byte[] buf = new byte[1024 * 1]; // 보통은 8kB
				
				OutputStream os = response.getOutputStream();
				
				int count = -1;
				//바가지 크기 만큼 읽음
				//읽을게 없으면 -1
				while( (count = fis.read(buf)) != -1 ) {
					// 브라우저로 내보냄
					// 0 : 컨너뛸 byte 수
					// count : 보낼 byte 수
					os.write(buf, 0, count);
				}
				os.flush();
				os.close();
				fis.close();
				
				
				
			}catch (IllegalStateException e) {
				e.printStackTrace();
			}
			
			
			
		}
	
	
//생산공정 
//----------------------
	@RequestMapping(value="/production_process",method=RequestMethod.GET)
	public String production_process(Model model,
			HttpSession httpSession
			) {
		try {
			User_DTO Field2 = (User_DTO) httpSession.getAttribute("user");
			String Field = Field2.getJob();

			System.out.println("production_process 실행");
			List plist = service.SelectProductPnamePid();
			List dlist = service.SelectProcessDescription(1);
			
			model.addAttribute("plist",plist);
			model.addAttribute("dlist",dlist);
			model.addAttribute("Field",Field);
			System.out.println("plist"+plist+""+"dlist"+dlist);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "production_process";
	}
	
//생상공정 value에따라 화면 출력
	@ResponseBody
	@RequestMapping(value="/production_process_view",method=RequestMethod.GET)
	public Map<String,Object> production_process(@RequestParam("select_value") int select_value
			,HttpSession httpSession
			) {  
		User_DTO Field2 = (User_DTO) httpSession.getAttribute("user");
		String Field = Field2.getJob();
		Map<String,Object> map = new HashMap();

		try {
			System.out.println("production_process 실행");
			System.out.println("select_value"+select_value);
			
			List Descriptionlist = service.SelectProcessDescription(select_value);
		

			map.put("Descriptionlist", Descriptionlist);
			map.put("Field",Field);
		
			System.out.println("Descriptionlist"+Descriptionlist);
			
		}catch (Exception e) {
		e.printStackTrace();
		}
	
		
		return map;
	}
	
	//생산공정 생성
	@ResponseBody
	@RequestMapping(value="/production_process_insert",method=RequestMethod.POST)
	public int production_process_insert(@RequestBody ProductionProcessDescription_DTO dto
			) {  
		System.out.println("production_process_insert 실행");
		
		int result = 0;
		try {
			 result = service.ProductionProcessInsert(dto);
			
		}catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	//생산공정 수정
	@ResponseBody
	@RequestMapping(value="/production_process_update",method=RequestMethod.PUT)
	public int production_process_update(@RequestBody ProductionProcessDescription_DTO dto
			) {  
		System.out.println("production_process_update 실행");
		
		int result = 0;
		try {
			 result = service.ProductionProcessUpdate(dto);
			
		}catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	//생산공정 한줄만 수정 화면이벤트
		@ResponseBody
		@RequestMapping(value="/production_process_one_line",method=RequestMethod.GET)
		public List production_process_one_line(@RequestParam ("processid") int processid
				) {  
			System.out.println("production_process_one_line 실행");
			
			List list = null;
			try {
				 list = service.ProductionProcess_select_one_line(processid);
				System.out.println("list :" +list);
			}catch (Exception e) {
				e.printStackTrace();
			}

			return list;
		}
		
	//생산공정 삭제이벤트
			@ResponseBody
			@RequestMapping(value="/production_process_delete",method=RequestMethod.PUT)
			public int production_process_delete(@RequestBody ProductionProcessDescription_DTO dto
					) {  
				System.out.println("production_process_delete 실행");
				int result = 0;
				
				try {
					System.out.println("dto :"+dto);
					result = service.ProductionProcessDelete(dto);
					System.out.println("result :" +result);
				}catch (Exception e) {
					e.printStackTrace();
				}

				return result;
			}
	
	
	
	
	
	
//완제품 BOM
//----
	@RequestMapping(value="/bom_v2",method=RequestMethod.GET)
	public String Bom_v2( HttpSession httpsession ,Model model,
			@RequestParam(value="page",required = false) String page
			
			)  {
		System.out.println("bom_v2 입장~~~");
		User_DTO Field2 = (User_DTO) httpsession.getAttribute("user");
		String Field = Field2.getJob();
//				String Field = "ADMIN";
		model.addAttribute("Field",Field);
		model.addAttribute("pageNo",page);
		
		
		return "bom_v2";
	}
			
//조회 및 화면 렌더링
	@ResponseBody
	@RequestMapping(value="/bom_v2_select",method=RequestMethod.GET)
	public Map<String,Object> bom_v2_select(
			Products_DTO dto
			
			)  {
		Map<String, Object> map = new HashMap();
		List list = null;
		System.out.println("=============================");
		System.out.println("전달받은페이지"+dto.getPage());
		System.out.println("=============================");
		try {
			String nameserch = dto.getSerch();
			
			Map slect = build_of_Materials_service.Product_All(dto);
			
			System.out.println("list : "+ list);
			map.put("pDTO", dto);
			map.put("slect", slect);
			map.put("nameserch", nameserch);
			System.out.println("dto :"+dto);
			System.out.println("---------------");
			System.out.println("slect :"+slect);
			System.out.println("---------------");
			System.out.println("dto :"+dto);
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return map;
	}
	
//완제품 > 원재료 메인홤면 > 타이틀 완제품 이름, 생성시 들어가는 원재료 이름ㅁ
	@RequestMapping("/bomlist")
	public String Bomlist(Model model,
			@RequestParam(value="pname",required = false) String pname,
			@RequestParam(value="pid",required = false) String pid,
			@RequestParam(value="page",required = false) int page,
			 HttpSession httpsession
			) {
		User_DTO Field2 = (User_DTO) httpsession.getAttribute("user");
		String Field = Field2.getJob();

		List mlist = null;
		try {
			mlist = build_of_Materials_service.BuildOfMaterials_materialList();
			model.addAttribute("mlist",mlist);
			model.addAttribute("Field",Field);
			model.addAttribute("pid",pid);
			model.addAttribute("pname",pname);
			model.addAttribute("page",page);
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return "bomlist";
	}
	
	//완제품 > 원재료 메인홤면
	@ResponseBody
	@RequestMapping(value="/bomlistSlect",method=RequestMethod.GET)
	public Map<String,Object> bomlistSlect(
			Materials_DTO materials_DTO,
			HttpSession httpSession
			) {
		
		System.out.println("bomlistSlect 시작");
		Map<String, Object> map = new HashMap();
		User_DTO Field2 = (User_DTO) httpSession.getAttribute("user");
		String Field = Field2.getJob();
		List materiallist = null;
		int productid = materials_DTO.getProductid();
		try {
			
			System.out.println("----------");
			System.out.println("받아온값 getPage--"+materials_DTO.getPage()+"  getProductid"+materials_DTO.getProductid());
			System.out.println("---------");
			Map list = build_of_Materials_service.BuildOfMaterials_materialSelect(materials_DTO);
			System.out.println("materiallist :"+materiallist);
			map.put("list", materiallist);
			map.put("Field",Field);
			map.put("productid", productid);
			map.put("list", list);
			map.put("pDTO", materials_DTO);
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return map;
	}
	
	//생성
	@ResponseBody
	@RequestMapping(value="/bominsert",method=RequestMethod.POST)
	public int bominsert(
			@RequestBody Bom_DTO dto
			) {
		System.out.println("bominsert 시작");
		
		int result= 0;
		try {
			result=build_of_Materials_service.BuildOfMaterials_materialListInsert(dto);
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return result;
	}
	//삭제
	@ResponseBody
	@RequestMapping(value="/bomDelete",method=RequestMethod.PUT)
	public int bomDelete(
			@RequestBody Bom_DTO dto
			) {
		System.out.println("bomDelete 시작");
		
		int result= 0;
		try {
			result=build_of_Materials_service.BuildOfMaterials_materialListDelete(dto);
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return result;
	}
	
	//완제품 > 원재료 수정클릭시 한출만 출력
		@ResponseBody
		@RequestMapping(value="/bomlistSlectOne",method=RequestMethod.GET)
		public List bomlistSlectOne(
				@RequestParam(value="bomid",required = false) int bomid
				) {
			System.out.println("bomlistSlectOne 시작");
			List list = null;
			List materiallist = null;
			try {
				list = build_of_Materials_service.BuildOfMaterials_materialOneList(bomid);
			
				
			}catch (Exception e) {
				e.printStackTrace();
				
			}
			return list;
		}
		
		//수정
		@ResponseBody
		@RequestMapping(value="/bomUpdate",method=RequestMethod.PUT)
		public int bomUpdate(
				@RequestBody Bom_DTO dto
				) {
			System.out.println("bomUpdate 시작");
			
			int result= 0;
			try {
				result=build_of_Materials_service.BuildOfMaterials_materialUpdate(dto);
				
			}catch (Exception e) {
				e.printStackTrace();
				
			}
			return result;
		}
	

	
	
	
	
}
