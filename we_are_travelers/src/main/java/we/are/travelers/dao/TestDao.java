package we.are.travelers.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao {
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "we.are.travelers.test";
	
	@Autowired
	public TestDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public HashMap<String, String> testlogin(HashMap<String, String> map){
		return sqlSession.selectOne(MAPPER+".testlogin", map);	  
	}
	
	public HashMap<String, String> testlogincompany(HashMap<String, String> map){
		return sqlSession.selectOne(MAPPER+".testlogincompany", map);	  
	}

}

