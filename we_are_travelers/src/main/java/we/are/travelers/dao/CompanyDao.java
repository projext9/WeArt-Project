 	package we.are.travelers.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import we.are.travelers.vo.CompanyVo;

@Repository
public class CompanyDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "we.are.travelers.company";
	
	@Autowired
	public CompanyDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int joinCompany(CompanyVo companyVo) {
		//sqlSession객체를 이용한 입력작업: insert("Mapper파일의 네임스페이스.id값", 입력값/입력객체)
	
		return sqlSession.insert(MAPPER + ".joinCompany", companyVo);
	}
	  public CompanyVo loginCompany(CompanyVo cv){
		  
		  return sqlSession.selectOne(MAPPER + ".loginCompany", cv);   
	}
      public CompanyVo loginCompany_auth(CompanyVo cv){
		  
		  return sqlSession.selectOne(MAPPER + ".loginCompany_auth", cv);   
		  
	}public CompanyVo loginCompany_delynS(CompanyVo cv){
		  
		  return sqlSession.selectOne(MAPPER + ".loginCompany_delynS", cv);   
	}
	  public int checkComId(String id) {
		  
			return sqlSession.selectOne(MAPPER+".checkComId", id);
	}
	  public int checkComName(String name) {
		  
			return sqlSession.selectOne(MAPPER+".checkComName", name);
	}

}
