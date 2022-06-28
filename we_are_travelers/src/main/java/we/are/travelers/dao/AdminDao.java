package we.are.travelers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import we.are.travelers.vo.MemberVo;

@Repository
public class AdminDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "we.are.travelers.admin";
	
	@Autowired
	public AdminDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<MemberVo> getMemberList() {
		return sqlSession.selectList(MAPPER+".getMemberList");
	}

}
