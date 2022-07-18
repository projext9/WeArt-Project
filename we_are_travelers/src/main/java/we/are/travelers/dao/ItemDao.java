package we.are.travelers.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import we.are.travelers.vo.ItemVo;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OptionVo;

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
	
	public List<OptionVo> getItemOption(int item_idx) { //상품 상세 호출(옵션)
		return sqlSession.selectList(MAPPER+".getItemOption", item_idx);
	}
	
	public int addItemCart(HashMap<String, Object> map) { //장바구니 담기
		return sqlSession.insert(MAPPER+".addItemCart", map);
	}

	public List<Map<String, Object>> getCartList(String member_idx) { //카트 호출
		return sqlSession.selectList(MAPPER+".getCartList", member_idx);
	}
	
	public List<Map<String, Object>> getItemOrder(List<String> cart_idx_list_) { //카트 주문 호출
		System.out.println("아이템 DAO - 선택된 cart_idx 값" + cart_idx_list_);
		return sqlSession.selectList(MAPPER+".getItemOrder", cart_idx_list_);
	}
	
}

