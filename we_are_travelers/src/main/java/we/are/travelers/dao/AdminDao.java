package we.are.travelers.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import we.are.travelers.vo.MemberVo;

@Repository
public class AdminDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.admin";
	
	@Autowired
	public AdminDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<MemberVo> getMemberList() { //AdminService에서 ADminDao의 getMemberList 실행시
		return sqlSession.selectList(MAPPER+".getMemberList"); //namespace가 "ezen.dev.spring.admin" 인 mapper 실행
	} //해당 mapper의 getMemberList 메소드 실행 후 값 반환 -> sqlSession에 값 저장

	public int updateMemberGrade(HashMap<String, Integer> map) {
		return sqlSession.update(MAPPER+".updateMemberGrade", map);
	}

	public int deleteMemberInfo(List<Integer> member_idx_list) {
		return sqlSession.delete(MAPPER+".deleteMemberInfo", member_idx_list);
	}
	
	
	
	
	
	
	
	
	

}