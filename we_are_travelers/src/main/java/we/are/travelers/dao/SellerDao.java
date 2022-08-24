package we.are.travelers.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import we.are.travelers.vo.BoardVo;
import we.are.travelers.vo.CompanyVo;
import we.are.travelers.vo.ItemVo;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OrderLastVo;
import we.are.travelers.vo.OrderVo;
import we.are.travelers.vo.SearchCriteria;

@Repository
public class SellerDao {

	private SqlSession sqlSession;
	
	public static final String MAPPER = "we.are.travelers.seller";
	
	@Autowired
	public SellerDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public CompanyVo getInfo(String company_idx) {
		return sqlSession.selectOne(MAPPER+".getInfo", company_idx);
	}

	public List<ItemVo> getItemlist(String company_idx) {
		return sqlSession.selectList(MAPPER+".getItemlist", company_idx);
	}
	
	public List<Map<String, Object>> getItemOrder(String company_idx) {
		return sqlSession.selectList(MAPPER+".getItemOrder", company_idx);
	}

}
