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
public class MapController {

	private MapService mapService;
	
	@Autowired //의존 자동 주입: 생성자 방식
	public MapController(GalleryService galleryService , MapService mapService) {
	
		this.mapService = mapService; // 객체주입을 요청
	
		
	}
		
	@GetMapping("/activityMap.do")
	public String activityMap(int map_idx,Model model)
	{
		
		List<MapVo> mapList = mapService.getMapSearch(map_idx); 
		model.addAttribute("mapSearch",mapList);
		
		return "map/activity/activityMap";
	}
	
	@GetMapping("/attractionMap.do")
	public String attractionMap(int map_idx,Model model)
	{
		
		List<MapVo> mapList = mapService.getMapSearch(map_idx); 
		model.addAttribute("mapSearch",mapList);
		
		return "map/attraction/attractionMap";
	}
	
	@GetMapping("/fishingMap.do")
	public String fishingMap(int map_idx,Model model)
	{
		
		List<MapVo> mapList = mapService.getMapSearch(map_idx); 
		model.addAttribute("mapSearch",mapList);
		
		return "map/fishing/fishingMap";
	}@GetMapping("/campingMap.do")
	public String campingMap(int map_idx,Model model)
	{
		
		List<MapVo> mapList = mapService.getMapSearch(map_idx); 
		model.addAttribute("mapSearch",mapList);
		
		return "map/fishing/fishingMap";
	}
	@GetMapping("/lodgingMap.do")
	public String lodgingMap(int map_idx,Model model)
	{
		
		List<MapVo> mapList = mapService.getMapSearch(map_idx); 
		model.addAttribute("mapSearch",mapList);
		
		return "map/lodging/lodgingMap";
	}
	


	
}