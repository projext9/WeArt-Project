package we.are.travelers.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import we.are.travelers.vo.CompanyVo;
import we.are.travelers.vo.ItemVo;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OptionVo;
import we.are.travelers.vo.OrderLastVo;
import we.are.travelers.vo.OrderVo;
import we.are.travelers.vo.SearchCriteria;

@Repository
public class ItemDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "we.are.travelers.item";
	
	@Autowired
	public ItemDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int deleteAllItem(String company_idx) { //찌꺼기 제거
		return sqlSession.delete(MAPPER+".deleteAllItem", company_idx);
	}
	
	public int addItem(ItemVo itemVo) { //판매상품 입력 실행(상품작성)
		return sqlSession.insert(MAPPER+".addItem", itemVo);
	}

	public ItemVo getAddedItem(String company_idx) { //최근 작성 상품 호출
		return sqlSession.selectOne(MAPPER+".getAddedItem", company_idx);
	}
	
	public int addItemImg(ItemVo itemVo) { //상품 이미지 업로드
		return sqlSession.update(MAPPER+".addItemImg", itemVo);
	}
	
	public int addItemContent(ItemVo itemVo) { //판매상품 입력 실행(상세정보 등록)
		return sqlSession.update(MAPPER+".addItemContent", itemVo);
	}

	public int addItemOption(Map<String, Object> map) { //판매상품 입력 실행(옵션 등록)
		return sqlSession.insert(MAPPER+".addItemOption", map);
	}
	
	public int updateItemOption(String item_idx) { //아이템 상태 변경 "T" to "N"
		return sqlSession.insert(MAPPER+".updateItemOption", item_idx);
	}
	
	public int item_total_culture(SearchCriteria scri) { //상품 리스트 갯수(문화)
		return sqlSession.selectOne(MAPPER+".item_total_culture", scri);
	}
	
	public int item_total_activity(SearchCriteria scri) { //상품 리스트 갯수(액티비티)
		return sqlSession.selectOne(MAPPER+".item_total_activity", scri);
	}
	
	public int item_total_fishing(SearchCriteria scri) { //상품 리스트 갯수(낚시)
		return sqlSession.selectOne(MAPPER+".item_total_fishing", scri);
	}
	
	public int item_total_camping(SearchCriteria scri) { //상품 리스트 갯수(캠핑)
		return sqlSession.selectOne(MAPPER+".item_total_camping", scri);
	}
	
	public int item_total_stay(SearchCriteria scri) { //상품 리스트 갯수(숙박)
		return sqlSession.selectOne(MAPPER+".item_total_stay", scri);
	}
	
	public List<ItemVo> getList_culture(SearchCriteria scri) { //상품 리스트 호출(낚시)
		return sqlSession.selectList(MAPPER+".getList_culture", scri);
	}
	
	public List<ItemVo> getList_activity(SearchCriteria scri) { //상품 리스트 호출(액티비티)
		return sqlSession.selectList(MAPPER+".getList_activity", scri);
	}
	
	public List<ItemVo> getList_fishing(SearchCriteria scri) { //상품 리스트 호출(낚시)
		return sqlSession.selectList(MAPPER+".getList_fishing", scri);
	}
	
	public List<ItemVo> getList_camping(SearchCriteria scri) { //상품 리스트 호출(캠핑)
		return sqlSession.selectList(MAPPER+".getList_camping", scri);
	}
	
	public List<ItemVo> getList_stay(SearchCriteria scri) { //상품 리스트 호출(숙박)
		return sqlSession.selectList(MAPPER+".getList_stay", scri);
	}
	
	public ItemVo getItemDetail(int item_idx) { //상품 상세 호출
		return sqlSession.selectOne(MAPPER+".getItemDetail", item_idx);
	}
	
	public List<OptionVo> getItemOption(int item_idx) { //상품 상세 호출(옵션)
		return sqlSession.selectList(MAPPER+".getItemOption", item_idx);
	}
	
	public CompanyVo getItemCompany(String company_idx) { //상품 상세 호출(판매자명)
		return sqlSession.selectOne(MAPPER+".getItemCompany", company_idx);
	}
	
	public int addItemCart(HashMap<String, Object> map) { //장바구니 담기
		return sqlSession.insert(MAPPER+".addItemCart", map);
	}
	
	public int updateItemCartN(String member_idx) { //카트 상태 복구 "S"
		return sqlSession.update(MAPPER+".updateItemCartN", member_idx);
	}
	
	public List<Map<String, Object>> getCartList(String member_idx) { //장바구니 호출
		return sqlSession.selectList(MAPPER+".getCartList", member_idx);
	}
	
	public int delItemCart(HashMap<String, Object> map) { //장바구니 삭제
		return sqlSession.delete(MAPPER+".delItemCart", map);
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
	
	public int updateItemCartS(HashMap<String, Object> map) { //카트 상태 변경 "N" to "S"
		return sqlSession.update(MAPPER+".updateItemCartS", map);
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
	
	public MemberVo getMemberDetail2(String member_idx) { //회원정보 호출
		return sqlSession.selectOne(MAPPER+".getMemberDetail2", member_idx);
	}
	
	public int updateCashReceipt(HashMap<String, Object> map) { //주문서 업데이트(현금영수증)
		return sqlSession.update(MAPPER+".updateCashReceipt", map);
	}
	
	public int updateOrderState1B(HashMap<String, Object> map) { //주문서(개별상품) 상태변경(결제완료)
		return sqlSession.update(MAPPER+".updateOrderState1B", map);
	}
	
	public int updateOrderLastState1B(HashMap<String, Object> map) { //주문서 상태변경(결제완료)
		return sqlSession.update(MAPPER+".updateOrderLastState1B", map);
	}
	
	public int updateItemCartY(String member_idx) { //카트 상태 변경 "S" to "Y"
		return sqlSession.update(MAPPER+".updateItemCartY", member_idx);
	}
	
	public int updateOrderState1C(HashMap<String, Object> map) { //주문서(개별상품) 상태변경(검증완료)
		return sqlSession.update(MAPPER+".updateOrderState1C", map);
	}
	
	public int updateOrderLastState1C(HashMap<String, Object> map) { //주문서 상태변경(검증완료)
		return sqlSession.update(MAPPER+".updateOrderLastState1C", map);
	}
	
	public List<ItemVo> getItemHomeList() { //homecontroller
		return sqlSession.selectList(MAPPER+".getItemHomeList");
	}
}

