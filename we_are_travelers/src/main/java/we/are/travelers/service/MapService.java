package we.are.travelers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import we.are.travelers.dao.MapDao;
import we.are.travelers.vo.MapVo;


@Service
public class MapService {
	
	private MapDao mapDao;
	
	@Autowired
	public MapService(MapDao mapDao) {
		this.mapDao = mapDao;
	}
	
	public List<MapVo> getMapList() { //AdminController에서 getMemberList 실행시
		return mapDao.getMapList(); //adminDao의 getMemberList 메소드 실행
	}
	
	public List<MapVo> getMapSearch(int map_idx)
	{
		return mapDao.getMapSearch(map_idx);
	}

}
