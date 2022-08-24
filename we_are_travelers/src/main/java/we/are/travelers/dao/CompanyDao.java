 	package we.are.travelers.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import we.are.travelers.vo.CompanyVo;
import we.are.travelers.vo.MemberVo;

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
	  
	  public int checkComId1(String id) {
		  
			return sqlSession.selectOne(MAPPER+".checkComId1", id);
	}
	  public int checkComName(String name) {
		  
			return sqlSession.selectOne(MAPPER+".checkComName", name);
	}
	  
	  
	  public CompanyVo findComId(CompanyVo cv) {
		  
		  return sqlSession.selectOne(MAPPER+".findComId", cv);
	  }
	  public int findComPwd(String company_id) {
			 
			return sqlSession.selectOne(MAPPER+".findComPwd", company_id);
		}
	 
	 public CompanyVo changeComPwd(HashMap<String, Object> target_com_id) throws NoSuchAlgorithmException {
		 
		    String SHA_pwd = (String) target_com_id.get("company_pwd");
			
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			 
	        md.update(SHA_pwd.getBytes());
	 
	        StringBuilder builder = new StringBuilder();
	 
	        for (byte b: md.digest()) {
	            builder.append(String.format("%02x", b));
	        }
	        String pwd_com_result = builder.toString();
	        
	        System.out.println(pwd_com_result); //88d4266fd4e6338d13b845fcf289579d209c897823b9217da3e161936f031589
	        
	        target_com_id.put("change_com_pwd" , pwd_com_result );
	        
			return sqlSession.selectOne(MAPPER+".changeComPwd", target_com_id );
		}

}
