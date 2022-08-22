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
	
	
	//맵 셀렉터 리스트
	@GetMapping("/jeonBuk_Activity.do")
	public String jeonbuk_activity(Model model)
	{
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);
		
		return "map/regionMap_activity/jeonbuk";
	}
	@GetMapping("/buSan_Activity.do")
	public String buSan_activity(Model model)
	{
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);
		
		return "map/regionMap_activity/buSan";
	}
	@GetMapping("/chungBuk_Activity.do")
	public String chungBuk_activity(Model model)
	{
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);
		
		return "map/regionMap_activity/chungBuk";
	}
	@GetMapping("/jeonNam_Activity.do")
	public String jeonNam_activity(Model model)
	{
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);
		
		return "map/regionMap_activity/jeonNam";
	}
	@GetMapping("/chungNam_Activity.do")
	public String chungNam_activity(Model model)
	{
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);
		
		return "map/regionMap_activity/chungNam";
	}
	@GetMapping("/daeJeon_Activity.do")
	public String daeJeon_activity(Model model)
	{
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);
		
		return "map/regionMap_activity/daeJeon";
	}
	@GetMapping("/gwangJu_Activity.do")
	public String gwangJu_activity(Model model)
	{
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);
		
		return "map/regionMap_activity/gwangJu";
	}
	@GetMapping("/gyeongBuk_Activity.do")
	public String gyeongBuk_activity(Model model)
	{
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);
		
		return "map/regionMap_activity/gyeongBuk";
	}
	@GetMapping("/gyeongGi_do_Activity.do")
	public String gyeongGi_do_activity(Model model)
	{
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);
		
		return "map/regionMap_activity/gyeongGi_do";
	}
	@GetMapping("/gyeongNam_Activity.do")
	public String gyeongNam_activity(Model model)
	{
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);
		
		return "map/regionMap_activity/gyeongNam";
	}
	@GetMapping("/seoul_Activity.do")
	public String seoul_activity(Model model)
	{
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);
		
		return "map/regionMap_activity/seoul";
	}
	@GetMapping("/ulSan_Activity.do")
	public String ulSan_activity(Model model)
	{
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);
		
		return "map/regionMap_activity/ulSan";
	}
	@GetMapping("/jeJu_Activity.do")
	public String jeJu_activity(Model model)
	{
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);
		
		return "map/regionMap_activity/jeJu";
	}
	@GetMapping("/gangWondo_Activity.do")
	public String ganWondo_activity(Model model)
	{
		List<MapVo> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);
		
		return "map/regionMap_activity/gangWondo";
	}
	
	//맵 셀렉터 리스트 -attraction 부분
		@GetMapping("/jeonBuk_attraction.do")
		public String jeonbuk_attraction(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_attraction/jeonbuk";
		}
		@GetMapping("/buSan_attraction.do")
		public String buSan_attraction(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_attraction/buSan";
		}
		@GetMapping("/chungBuk_attraction.do")
		public String chungBuk_attraction(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_attraction/chungBuk";
		}
		@GetMapping("/jeonNam_attraction.do")
		public String jeonNam_attraction(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_attraction/jeonNam";
		}
		@GetMapping("/chungNam_attraction.do")
		public String chungNam_attraction(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_attraction/chungNam";
		}
		@GetMapping("/daeJeon_attraction.do")
		public String daeJeon_attraction(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_attraction/daeJeon";
		}
		@GetMapping("/gwangJu_attraction.do")
		public String gwangJu_attraction(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_attraction/gwangJu";
		}
		@GetMapping("/gyeongBuk_attraction.do")
		public String gyeongBuk_attraction(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_attraction/gyeongBuk";
		}
		@GetMapping("/gyeongGi_do_attraction.do")
		public String gyeongGi_do_attraction(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_attraction/gyeongGi_do";
		}
		@GetMapping("/gyeongNam_attraction.do")
		public String gyeongNam_attraction(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_attraction/gyeongNam";
		}
		@GetMapping("/seoul_attraction.do")
		public String seoul_attraction(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_attraction/seoul";
		}
		@GetMapping("/ulSan_attraction.do")
		public String ulSan_attraction(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_attraction/ulSan";
		}
		@GetMapping("/jeJu_attraction.do")
		public String jeJu_attraction(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_attraction/jeJu";
		}
		@GetMapping("/gangWondo_attraction.do")
		public String ganWondo_attraction(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_attraction/gangWondo";
		}
		
		//맵 셀렉터 리스트 - lodging 부분
		@GetMapping("/jeonBuk_lodging.do")
		public String jeonbuk_lodging(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_lodging/jeonbuk";
		}
		@GetMapping("/buSan_lodging.do")
		public String buSan_lodging(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_lodging/buSan";
		}
		@GetMapping("/chungBuk_lodging.do")
		public String chungBuk_lodging(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_lodging/chungBuk";
		}
		@GetMapping("/jeonNam_lodging.do")
		public String jeonNam_lodging(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_lodging/jeonNam";
		}
		@GetMapping("/chungNam_lodging.do")
		public String chungNam_lodging(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_lodging/chungNam";
		}
		@GetMapping("/daeJeon_lodging.do")
		public String daeJeon_lodging(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_lodging/daeJeon";
		}
		@GetMapping("/gwangJu_lodging.do")
		public String gwangJu_lodging(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_lodging/gwangJu";
		}
		@GetMapping("/gyeongBuk_lodging.do")
		public String gyeongBuk_lodging(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_lodging/gyeongBuk";
		}
		@GetMapping("/gyeongGi_do_lodging.do")
		public String gyeongGi_do_lodging(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_lodging/gyeongGi_do";
		}
		@GetMapping("/gyeongNam_lodging.do")
		public String gyeongNam_lodging(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_lodging/gyeongNam";
		}
		@GetMapping("/seoul_lodging.do")
		public String seoul_lodging(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_lodging/seoul";
		}
		@GetMapping("/ulSan_lodging.do")
		public String ulSan_lodging(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_lodging/ulSan";
		}
		@GetMapping("/jeJu_lodging.do")
		public String jeJu_lodging(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_lodging/jeJu";
		}
		@GetMapping("/gangWondo_lodging.do")
		public String ganWondo_lodging(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_lodging/gangWondo";
		}
		
		//맵 셀렉터 리스트 - fishing 부분
		@GetMapping("/jeonBuk_fishing.do")
		public String jeonbuk_fishing(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_fishing/jeonbuk";
		}
		@GetMapping("/buSan_fishing.do")
		public String buSan_fishing(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_fishing/buSan";
		}
		@GetMapping("/chungBuk_fishing.do")
		public String chungBuk_fishing(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_fishing/chungBuk";
		}
		@GetMapping("/jeonNam_fishing.do")
		public String jeonNam_fishing(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_fishing/jeonNam";
		}
		@GetMapping("/chungNam_fishing.do")
		public String chungNam_fishing(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_fishing/chungNam";
		}
		@GetMapping("/daeJeon_fishing.do")
		public String daeJeon_fishing(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_fishing/daeJeon";
		}
		@GetMapping("/gwangJu_fishing.do")
		public String gwangJu_fishing(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_fishing/gwangJu";
		}
		@GetMapping("/gyeongBuk_fishing.do")
		public String gyeongBuk_fishing(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_fishing/gyeongBuk";
		}
		@GetMapping("/gyeongGi_do_fishing.do")
		public String gyeongGi_do_fishing(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_fishing/gyeongGi_do";
		}
		@GetMapping("/gyeongNam_fishing.do")
		public String gyeongNam_fishing(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_fishing/gyeongNam";
		}
		@GetMapping("/seoul_fishing.do")
		public String seoul_fishing(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_fishing/seoul";
		}
		@GetMapping("/ulSan_fishing.do")
		public String ulSan_fishing(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_fishing/ulSan";
		}
		@GetMapping("/jeJu_fishing.do")
		public String jeJu_fishing(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_fishing/jeJu";
		}
		@GetMapping("/gangWondo_fishing.do")
		public String ganWondo_fishing(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_fishing/gangWondo";
		}
		
		//맵 셀렉터 리스트 - camping 부분
		@GetMapping("/jeonBuk_camping.do")
		public String jeonbuk_camping(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_camping/jeonbuk";
		}
		@GetMapping("/buSan_camping.do")
		public String buSan_camping(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_camping/buSan";
		}
		@GetMapping("/chungBuk_camping.do")
		public String chungBuk_camping(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_camping/chungBuk";
		}
		@GetMapping("/jeonNam_camping.do")
		public String jeonNam_camping(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_camping/jeonNam";
		}
		@GetMapping("/chungNam_camping.do")
		public String chungNam_camping(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_camping/chungNam";
		}
		@GetMapping("/daeJeon_camping.do")
		public String daeJeon_camping(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_camping/daeJeon";
		}
		@GetMapping("/gwangJu_camping.do")
		public String gwangJu_camping(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_camping/gwangJu";
		}
		@GetMapping("/gyeongBuk_camping.do")
		public String gyeongBuk_camping(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_camping/gyeongBuk";
		}
		@GetMapping("/gyeongGi_do_camping.do")
		public String gyeongGi_do_camping(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_camping/gyeongGi_do";
		}
		@GetMapping("/gyeongNam_camping.do")
		public String gyeongNam_camping(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_camping/gyeongNam";
		}
		@GetMapping("/seoul_camping.do")
		public String seoul_camping(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_camping/seoul";
		}
		@GetMapping("/ulSan_camping.do")
		public String ulSan_camping(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_camping/ulSan";
		}
		@GetMapping("/jeJu_camping.do")
		public String jeJu_camping(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_camping/jeJu";
		}
		@GetMapping("/gangWondo_camping.do")
		public String ganWondo_camping(Model model)
		{
			List<MapVo> mapList = mapService.getMapList();
			model.addAttribute("mapList", mapList);
			
			return "map/regionMap_camping/gangWondo";
		}



	
}
