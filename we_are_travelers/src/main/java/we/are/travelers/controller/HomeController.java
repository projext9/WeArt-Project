package we.are.travelers.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import we.are.travelers.service.GalleryService;
import we.are.travelers.service.MapService;
import we.are.travelers.vo.GalleryVo;
import we.are.travelers.vo.MapVo;
import we.are.travelers.vo.MemberVo;

@Controller
public class HomeController {
	private GalleryService galleryService;
	private MapService mapService;
	
	@Autowired //의존 자동 주입: 생성자 방식
	public HomeController(GalleryService galleryService , MapService mapService) {
		this.galleryService = galleryService; //객체주입 요청
		this.mapService = mapService; // 객체주입을 요청
	
		
	}
	

	
	@GetMapping("/")//get방식 요청 처리
	public String home1() {
		return "home";
	}
	
	@GetMapping("/home.do")//get방식 요청 처리
	public String home2() {
		return "home";
	}
	
	@GetMapping("/fileUpload.do")//get방식 요청 처리
	public String fileUpload() {
		return "gallery/fileUpload";
	}
	
	@GetMapping("/activityList.do")
	public String activity(Model model)
	{
		
	
		List<MapVo> mapList = mapService.getMapList(); 
		model.addAttribute("mapList",mapList);
		
		return "map/activity/activityList";
	}
	@GetMapping("/attractionList.do")
	public String attraction(Model model)
	{
		
	
		List<MapVo> mapList = mapService.getMapList(); 
		model.addAttribute("mapList",mapList);
		
		return "map/attraction/attractionList";
	}
	@GetMapping("/fishingList.do")
	public String fishing(Model model)
	{
		
	
		List<MapVo> mapList = mapService.getMapList(); 
		model.addAttribute("mapList",mapList);
		
		return "map/fishing/fishingList";
	}@GetMapping("/campingList.do")
	public String camping(Model model)
	{
		
	
		List<MapVo> mapList = mapService.getMapList(); 
		model.addAttribute("mapList",mapList);
		
		return "map/camping/campingList";
	}
	@GetMapping("/lodgingList.do")
	public String lodging(Model model)
	{
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList",mapList);
		
		return "map/lodging/lodgingList";
		
	}
	
	
	
	@GetMapping("/admin_CompanyList.do")
	public String admin_CompanyList(Model model)
	{
		
		List<MapVo> mapList = mapService.getMapList(); 
		model.addAttribute("mapList",mapList);
		
		return "admin/mapList/admin_CompanyList";
	}
	

	
	@PostMapping("/fileUploadProcess.do")
	public String fileUploadProcess(@RequestParam("uploadFile") MultipartFile uploadFile,
			String gallery_content, Model model, HttpServletRequest request) throws IllegalStateException, IOException{
		//<input type ="file" name="uploadFile" />에서 업로드된 파일객체를 MultipartFile uploadFile에 저장
		
		//업로드된 파일을 프로젝트 내의 upload 폴더에 저장하기 전에 DB의 upload_file 테이블에 저장할 
		//origin_filename과 system_filename 값을 세팅함
		
		String origin_fileName = uploadFile.getOriginalFilename();
		
		//시스템 파일명은 원본 파일명에서 파일명과 확장자를 분리한 다음 파일명에 시스템시간을 추가한 후 다시 확장자를 붙이는 식으로 생성
		int dot_idx = origin_fileName.lastIndexOf(".");
		String fileName1 = origin_fileName.substring(0, dot_idx);
		String extension = origin_fileName.substring(dot_idx+1);
		String fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
		String system_fileName = fileName2+"."+extension;
		
		//upload 디렉토리에 대한 실제 경로 확인을 위해 ServletContext객체를 이용
		String upload_dir = "resources/upload/";
		
		String realPath = request.getServletContext().getRealPath(upload_dir);
		System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
		
		//지정된 경로에 파일 저장
		//realPath와 system_fileName을 합쳐서 전체경로를 얻어야 함
		String fullPath = realPath+system_fileName;
		uploadFile.transferTo(new File(fullPath));
		
		if(gallery_content.length() == 0) gallery_content = null;
		
		int result=0;//0:입력 실패
		
		GalleryVo galleryVo = new GalleryVo();
		galleryVo.setGallery_content(gallery_content);
		galleryVo.setOrigin_filename(origin_fileName);
		galleryVo.setSystem_filename(system_fileName);
		
		result = galleryService.addGallery(galleryVo);
		String viewPage="gallery/fileUpload";
		
		if(result ==1) {
			model.addAttribute("content", gallery_content);
			model.addAttribute("fileName", system_fileName);
			viewPage = "gallery/fileUpload_result";
		}
		
		return viewPage;
	}
	
	@GetMapping("/gallery_home.do")//get방식 요청 처리
	public String gallery_home(Model model) {
		
		List<GalleryVo> galleryList = galleryService.getGalleryList();
		model.addAttribute("galleryList", galleryList);
		
		return "gallery/gallery_home";
	}
	

	
	
	
}