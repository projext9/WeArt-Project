package we.are.travelers.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import we.are.travelers.service.MapService;
import we.are.travelers.vo.MapVo;

@Controller
public class MapController {
	private MapService mapService;
	@GetMapping("/activityList.do")
	public String activity(Model model) {

		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);

		return "map/activity/activityList";
	}

	@GetMapping("/attractionList.do")
	public String attraction(Model model) {

		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);

		return "map/attraction/attractionList";
	}

	@GetMapping("/fishingList.do")
	public String fishing(Model model) {

		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);

		return "map/fishing/fishingList";
	}

	@GetMapping("/campingList.do")
	public String camping(Model model) {

		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);

		return "map/camping/campingList";
	}

	@GetMapping("/lodgingList.do")
	public String lodging(Model model) {
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);

		return "map/lodging/lodgingList";

	}

	@GetMapping("/admin_CompanyList.do")
	public String admin_CompanyList(Model model) {

		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);

		return "admin/mapList/admin_CompanyList";
	}
	
	@Autowired // 의존 자동 주입: 생성자 방식
	public MapController(MapService mapService) {

		this.mapService = mapService; // 객체주입을 요청

	}

	@GetMapping("/activityMap.do")
	public String activityMap(int map_idx, Model model) {

		List<MapVo> mapList = mapService.getMapSearch(map_idx);
		model.addAttribute("mapSearch", mapList);

		return "map/activity/activityMap";
	}

	@GetMapping("/attractionMap.do")
	public String attractionMap(int map_idx, Model model) {

		List<MapVo> mapList = mapService.getMapSearch(map_idx);
		model.addAttribute("mapSearch", mapList);

		return "map/attraction/attractionMap";
	}

	@GetMapping("/fishingMap.do")
	public String fishingMap(int map_idx, Model model) {

		List<MapVo> mapList = mapService.getMapSearch(map_idx);
		model.addAttribute("mapSearch", mapList);

		return "map/fishing/fishingMap";
	}

	@GetMapping("/campingMap.do")
	public String campingMap(int map_idx, Model model) {

		List<MapVo> mapList = mapService.getMapSearch(map_idx);
		model.addAttribute("mapSearch", mapList);

		return "map/fishing/fishingMap";
	}

	@GetMapping("/lodgingMap.do")
	public String lodgingMap(int map_idx, Model model) {

		List<MapVo> mapList = mapService.getMapSearch(map_idx);
		model.addAttribute("mapSearch", mapList);

		return "map/lodging/lodgingMap";
	}
	
    
	@PostMapping("/mapRegion.do")
	@ResponseBody
	public List<MapVo> mapRegion(@RequestParam("map_region") String map_region, Model model) {
        System.out.println(map_region);
        List<MapVo> mapList = mapService.getMapList(map_region);
        model.addAttribute("mapList", mapList);
		return mapList;
	}
	
	@PostMapping("/admin_CompanyList.do")
	public String mapRegion2(@RequestParam("map_region") String map_region, Model model) {

		 List<MapVo> mapList = mapService.getMapList(map_region);
	     model.addAttribute("mapList", mapList);
	     model.addAttribute("map_region2", map_region);
	     String[] regionArr = {"전체","전북","전남","충북","충남","경북","경남","울산","부산","광주","대전","강원도","경기도","서울","제주도"};
	     model.addAttribute("regionArr",regionArr);
		return "admin/mapList/admin_CompanyList";
	}
	@GetMapping("/admin_mapSearch.do") // get방식 요청 처리 <!-- admin_mapSearch.jsp 호출 -->
	public String getAdmin_mapSearch(int map_idx, Model model) {

		List<MapVo> mapList = mapService.getMapSearch(map_idx); // MemberVo를 memberList 라는 이름으로...
		// 모델객체에 회원목록을 추가함 //adminService의 getMemberList 메소드 실행
		model.addAttribute("mapSearch", mapList); // 모델객체에 memberList라는 이름으로 저장

		return "admin/mapList/admin_mapSearch"; // 저장된 객체를 여기로 보냅
	}
	


	
}
