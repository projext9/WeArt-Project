package we.are.travelers.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import we.are.travelers.vo.ItemVo;
import we.are.travelers.vo.MemberVo;

@Repository
public class ItemDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "we.are.travelers.item";
	
	@Autowired
	public ItemDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int addItem(ItemVo itemVo) {
		return sqlSession.insert(MAPPER+".addItem", itemVo);
	}

	public List<ItemVo> getItemList() { //상품 리스트 호출
		return sqlSession.selectList(MAPPER+".getItemList");
	}
	
	public ItemVo getItemDetail(int item_idx) { //상품 상세 호출
		return sqlSession.selectOne(MAPPER+".getItemDetail", item_idx);
	}

}
