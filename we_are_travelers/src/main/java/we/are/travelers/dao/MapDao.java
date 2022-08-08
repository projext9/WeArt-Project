package we.are.travelers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import we.are.travelers.vo.MapVo;

@Repository
public class MapDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "we.are.travelers.map";
	
	@Autowired
	public MapDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<MapVo> getMapList() { //AdminService에서 ADminDao의 getMemberList 실행시
		return sqlSession.selectList(MAPPER+".getMapList"); //namespace가 "we.are.travelers.map" 인 mapper 실행
	} //해당 mapper의 getMemberList 메소드 실행 후 값 반환 -> sqlSession에 값 저장
     
	
	public List<MapVo> getMapSearch(int map_idx){
		
		return sqlSession.selectList(MAPPER+".getMapSearch" ,map_idx);
	}

	public List<MapVo> getMapList2(String map_region) {

		return sqlSession.selectList(MAPPER+".getMapList2" ,map_region);
	}



}
