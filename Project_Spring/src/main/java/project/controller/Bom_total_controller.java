package project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
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

import project.dto.Materials_DTO;
import project.dto.ProductionProcessDescription_DTO;
import project.dto.Products_DTO;
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
			Products_DTO products_DTO) {

//		String Field = (String)httpSession.getAttribute("Field");
		String Field = "ADMIN";
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
		String Field = "ADMIN";

		try {
			Map map = Products_service.selectFinishedProduct(products_DTO);
			List name_list = Products_service.selectProductname();
			
			model.addAttribute("map",map);
			model.addAttribute("pDTO",products_DTO);
			model.addAttribute("name_list",name_list);
			model.addAttribute("Field",Field);
			System.out.println("map : "+map);
			System.out.println("products_DTO"+products_DTO);
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
			@RequestParam("serchname") String serchname,
			Model model
			) {
		System.out.println("검색값 productname"+serchname);
		String Field = "ADMIN";
		Map<String,Object> result = new HashMap();
		
		try {
			List pickname = Products_service.selectProductnameserch(serchname);
			List name_list = Products_service.selectProductname();
			
			result.put("Field", Field);
			result.put("pickname",pickname);
			result.put("name_list",name_list);
			System.out.println("밀키트 검색한 결과값name_list ="+name_list);
			System.out.println("pickname ="+pickname);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result ;
	}
	
	//수정클릭시 프러덕트id기준으로 조회
	@ResponseBody
	@RequestMapping(value="/insSelectproductid",method=RequestMethod.GET)
	public Map<String,Object> insSelectproductid(
			@RequestParam("productid") int productid,
			Model model
			) {
		System.out.println("insSelectproductid_프러덕트id검색");
		System.out.println("검색값 productid"+productid);
		String Field = "ADMIN";
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
    		) throws UnsupportedEncodingException {
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
			//현재프로젝트 내의 img경로 저장
//			String realPath = servletContext.getRealPath("img");
			String realPath = "C:\\Users\\admin\\Desktop\\project\\Project_Spring\\src\\main\\webapp\\resources\\img";
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
			dto.setProductid(Integer.parseInt(productid));
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
				String path = "C:\\project\\Project_Spring\\src\\main\\webapp\\resources\\img";
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
	public String production_process(Model model
			) {
		try {
			System.out.println("production_process 실행");
			List plist = service.SelectProductPnamePid();
			List dlist = service.SelectProcessDescription(1);
			String Field = "ADMIN";
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
			) {  
		
		Map<String,Object> map = new HashMap();
	
		try {
			System.out.println("production_process 실행");
			System.out.println("select_value"+select_value);
			
			List Descriptionlist = service.SelectProcessDescription(select_value);
			String Field = "ADMIN";

			map.put("Descriptionlist", Descriptionlist);
			map.put("Field", Field);
			System.out.println("Descriptionlist"+Descriptionlist+""+"Field"+Field);
			
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
			public String Bom_v2( 
					
					)  {
				System.out.println("bom_v2 입장~~~");
				return "bom_v2";
			}
			
			
	@ResponseBody
	@RequestMapping(value="/bom_v2_select",method=RequestMethod.GET)
	public Map<String,Object> Bom_v2(@RequestParam (value="processname",required=false) String processname 
			
			)  {
		
	
		Map<String, Object> map = new HashMap();
		List list = null;
		try {
			list = build_of_Materials_service.Product_All(processname);
			System.out.println("list : "+ list);
			map.put("list", list);
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return map;
	}
	
//완제품 > 원재료 메인홤면
	@RequestMapping("/bomlist")
	public String Bomlist(Model model,
			@RequestParam(value="pname",required = false) String pname,
			@RequestParam(value="pid",required = false) String pid
			) {
		String Field = "ADMIN";
		List mlist = null;
		try {
			model.addAttribute("Field",Field);
			model.addAttribute("pid",pid);
			model.addAttribute("pname",pname);
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return "bomlist";
	}
	
	//완제품 > 원재료 메인홤면
	@RequestMapping(value="/bomlistSlect",method=RequestMethod.GET)
	public Map<String,Object> bomlistSlect(
			@RequestParam(value="pid",required = false) int pid
			) {
		Map<String, Object> map = new HashMap();
		List list = null;
		try {
			list = build_of_Materials_service.BuildOfMaterials_materialSelect(pid);
			System.out.println("mlist :"+list);
			map.put("list", list);
			
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return map;
	}
	
	

	
	
	
	
}
