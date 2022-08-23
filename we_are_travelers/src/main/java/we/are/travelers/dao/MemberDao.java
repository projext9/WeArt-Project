package we.are.travelers.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import we.are.travelers.vo.MemberVo;

@Repository
public class MemberDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "we.are.travelers.member";
	
	@Autowired
	public MemberDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//회원가입 
	public int joinMember(MemberVo memberVo) {
		//sqlSession객체를 이용한 입력작업: insert("Mapper파일의 네임스페이스.id값", 입력값/입력객체)
		
		return sqlSession.insert(MAPPER+".joinMember", memberVo);
	}
	  //로그인 처리
	  public MemberVo loginMember(MemberVo mv){
		  	  
		  return sqlSession.selectOne(MAPPER+".loginMember", mv);	  
	}
	  //사용 정지 회원 로그인 처리
	  public MemberVo loginMemberDelynS(MemberVo mv){
	  	  
		  return sqlSession.selectOne(MAPPER+".loginMemberDelynS", mv);	  
	}
	  
    //회원가입 아이디
	public int checkId(String member_id) {
		System.out.println("dao");
		return sqlSession.selectOne(MAPPER+".checkId", member_id);
	}
	
	public int checkId1(String member_id) {
		return sqlSession.selectOne(MAPPER+".checkId1", member_id);
	}
	
	
	//닉네임 중복 체크
	public int checkNick(String nick) {
		return sqlSession.selectOne(MAPPER+".checkNick", nick);
	}
	
	 //카카오 소셜로그인
	  public MemberVo findKakao(HashMap<String, Object> userInfo){
	  	  System.out.println("카카오 아이디:"+userInfo.get("member_id"));
	  	  System.out.println("카카오 닉네임:"+userInfo.get("member_nick"));
		  return sqlSession.selectOne(MAPPER+".findKakao", userInfo);	  
	}
	
    public Object insertKakao(HashMap<String, Object> userInfo) {
    	
		int regCode = 1;
		
		String idx ="";
		for (int i = 1; i <= 12; i++) {
            int pick = (int)((Math.random() * (20 - 1)) + 1);
                if (pick <= 8) {
                    char ch = (char) ((Math.random() * 26) + 65);
                    idx= idx + String.valueOf(ch);
                } else if (pick <= 14) {
                    char ch = (char) ((Math.random() * 26) + 97);
                    idx= idx + String.valueOf(ch);
                } else if (pick <= 16) {
                    char ch = (char) ((Math.random() * 10) + 48);
                    idx= idx + String.valueOf(ch);
                } else if (pick <= 18) {
                    char ch = 33;
                    idx= idx + String.valueOf(ch);
                } else if (pick <= 20) {
                    char ch = 64;
                    idx= idx + String.valueOf(ch);
                }
            }
		
		userInfo.put("member_idx", idx);
		userInfo.put("member_pwd" , idx);
		userInfo.put("member_regCode" , regCode);
		
		return sqlSession.selectOne(MAPPER+".insertKakao", userInfo);	
		
	}
	
	 public MemberVo findNaver(HashMap<String, Object> naverInfo){
	  	  System.out.println("네이버 아이디:"+naverInfo.get("member_id"));
	  	  System.out.println("네이버 닉네임:"+naverInfo.get("member_ncik"));
		  return sqlSession.selectOne(MAPPER+".findNaver", naverInfo);	  
	}
	 
	 public MemberVo insertNaver(HashMap<String, Object> naverInfo) {
		 int regCode = 2;
			String idx ="";
			for (int i = 1; i <= 12; i++) {
	            int pick = (int)((Math.random() * (20 - 1)) + 1);
	                if (pick <= 8) {
	                    char ch = (char) ((Math.random() * 26) + 65);
	                    idx= idx + String.valueOf(ch);
	                } else if (pick <= 14) {
	                    char ch = (char) ((Math.random() * 26) + 97);
	                    idx= idx + String.valueOf(ch);
	                } else if (pick <= 16) {
	                    char ch = (char) ((Math.random() * 10) + 48);
	                    idx= idx + String.valueOf(ch);
	                } else if (pick <= 18) {
	                    char ch = 33;
	                    idx= idx + String.valueOf(ch);
	                } else if (pick <= 20) {
	                    char ch = 64;
	                    idx= idx + String.valueOf(ch);
	                }
	            }
			
			MemberVo memberVo = new MemberVo();
			memberVo.setMember_idx(idx);
			memberVo.setMember_pwd(idx);
			memberVo.setMember_regCode(regCode);
			
			naverInfo.put("member_pwd", idx);
			naverInfo.put("member_idx", idx);
			naverInfo.put("member_regCode", regCode);
			
			return sqlSession.selectOne(MAPPER+".insertNaver", naverInfo);	
			
		}
	
	 public MemberVo findId(MemberVo mv) {
			System.out.println("dao");
			return sqlSession.selectOne(MAPPER+".findId", mv);
		}

}
