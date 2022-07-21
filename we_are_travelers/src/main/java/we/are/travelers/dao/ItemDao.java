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
import we.are.travelers.vo.OrderLastVo;
import we.are.travelers.vo.OrderVo;

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

	public List<Map<String, Object>> getCartList(String member_idx) { //장바구니 호출
		return sqlSession.selectList(MAPPER+".getCartList", member_idx);
	}
	
	public List<Map<String, Object>> getItemOrder(List<String> cart_idx_list_) { //배송지 입력 호출(상품)
		return sqlSession.selectList(MAPPER+".getItemOrder", cart_idx_list_);
	}
	
	public Map<String, Object> getMemberDetail(String member_idx) { //배송지 입력 호출(회원정보)
		return sqlSession.selectOne(MAPPER+".getMemberDetail", member_idx);
	}
	
	public int deleteAllOrder(String member_idx) { //찌꺼기 제거
		return sqlSession.delete(MAPPER+".deleteAllOrder", member_idx);
	}
	public int deleteAllOrderLast(String member_idx) { //찌꺼기 제거
		return sqlSession.delete(MAPPER+".deleteAllOrderLast", member_idx);
	}

	public HashMap<String, Object> getItemSelected(String cart_idx) { //카트 선택 상품
		return sqlSession.selectOne(MAPPER+".getItemSelected", cart_idx);
	}
	
	public int addOrderDetail(HashMap<String, Object> map) { //주문서 등록(개별상품)
		return sqlSession.insert(MAPPER+".addOrderDetail", map);
	}
	
	public int addOrderLast(HashMap<String, Object> map) { //주문서 등록
		return sqlSession.insert(MAPPER+".addOrderLast", map);
	}
	
	public List<OrderVo> getOrderList(HashMap<String, Object> map) { //주문예정 상품 호출
		return sqlSession.selectList(MAPPER+".getOrderList", map);
	}
	
	public OrderLastVo getOrderLast(HashMap<String, Object> map) { //주문서 호출
		return sqlSession.selectOne(MAPPER+".getOrderLast", map);
	}
	
}

