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
	  
    //회원가입 아이디 , 닉네임 중복 체크
	public int checkId(String id) {
		return sqlSession.selectOne(MAPPER+".checkId", id);
	}

	public int checkNick(String nick) {
		return sqlSession.selectOne(MAPPER+".checkNick", nick);
	}

}
