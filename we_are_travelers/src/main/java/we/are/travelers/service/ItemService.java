package we.are.travelers.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.travelers.dao.ItemDao;
import we.are.travelers.vo.CompanyVo;
import we.are.travelers.vo.ItemVo;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OptionVo;
import we.are.travelers.vo.OrderLastVo;
import we.are.travelers.vo.OrderVo;
import we.are.travelers.vo.SearchCriteria;

@Service
public class ItemService {
	
	private ItemDao itemDao;
	
	@Autowired
	public ItemService(ItemDao itemDao) {
		this.itemDao = itemDao;
	}
	
	public int deleteAllItem(String company_idx) { //찌꺼기 제거
		return itemDao.deleteAllItem(company_idx);
	}
	
	public int addItem(ItemVo itemVo) { //판매상품 입력 실행(상품작성)
		return itemDao.addItem(itemVo);
	}
	
	public ItemVo getAddedItem(String company_idx) { //최근 작성 상품 호출
		return itemDao.getAddedItem(company_idx);
	}
	
	public int addItemImg(ItemVo itemVo) { //상품 이미지 업로드
		return itemDao.addItemImg(itemVo);
	}
	
	public int addItemContent(ItemVo itemVo) { //판매상품 입력 실행(상세정보 등록)
		return itemDao.addItemContent(itemVo);
	}
	
	public int addItemOption(Map<String, Object> map) { //판매상품 입력 실행(옵션 등록)
		return itemDao.addItemOption(map);
	}
	
	public int updateItemOption(String item_idx) { //아이템 상태 변경 "T" to "N"
		return itemDao.updateItemOption(item_idx);
	}
	
	public int item_total_culture(SearchCriteria scri) { //상품 리스트 갯수(문화)
		return itemDao.item_total_culture(scri);
	}
	
	public int item_total_activity(SearchCriteria scri) { //상품 리스트 갯수(액티비티)
		return itemDao.item_total_activity(scri);
	}
	
	public int item_total_fishing(SearchCriteria scri) { //상품 리스트 갯수(낚시)
		return itemDao.item_total_fishing(scri);
	}	
	
	public int item_total_camping(SearchCriteria scri) { //상품 리스트 갯수(캠핑)
		return itemDao.item_total_camping(scri);
	}
	
	public int item_total_stay(SearchCriteria scri) { //상품 리스트 갯수(숙박)
		return itemDao.item_total_stay(scri);
	}
	
	public List<ItemVo> getList_culture(SearchCriteria scri) { //상품 리스트 호출(문화)
		return itemDao.getList_culture(scri);
	}

	public List<ItemVo> getList_activity(SearchCriteria scri) { //상품 리스트 호출(액티비티)
		return itemDao.getList_activity(scri);
	}
	
	public List<ItemVo> getList_fishing(SearchCriteria scri) { //상품 리스트 호출(낚시)
		return itemDao.getList_fishing(scri);
	}
	
	public List<ItemVo> getList_camping(SearchCriteria scri) { //상품 리스트 호출(캠핑)
		return itemDao.getList_camping(scri);
	}
	
	public List<ItemVo> getList_stay(SearchCriteria scri) { //상품 리스트 호출(숙박)
		return itemDao.getList_stay(scri);
	}

	public ItemVo getItemDetail(int item_idx) { //상품 상세 호출
		return itemDao.getItemDetail(item_idx);
	}
	
	public List<OptionVo> getItemOption(int item_idx) { //상품 상세 호출(옵션)
		return itemDao.getItemOption(item_idx);
	}
	
	public CompanyVo getItemCompany(String company_idx) { //상품 상세 호출(판매자명)
		return itemDao.getItemCompany(company_idx);
	}
	
	public int addItemCart(HashMap<String, Object> map) { //장바구니 담기
		int result = 0;
		result = itemDao.addItemCart(map);
		return result;
	}
	
	public int updateItemCartN(String member_idx) { //카트 상태 복구 "S"
		return itemDao.updateItemCartN(member_idx);
	}
	
	public List<Map<String, Object>> getCartList(String member_idx) { //장바구니 호출
		return itemDao.getCartList(member_idx);
	}
	
	public int delItemCart(HashMap<String, Object> map) { //장바구니 삭제
		return itemDao.delItemCart(map);
	}
	
	public List<Map<String, Object>> getItemOrder(List<String> cart_idx_list_) { //배송지 입력 호출(상품)
		return itemDao.getItemOrder(cart_idx_list_);
	}
	
	public MemberVo getMemberDetail(String member_idx) { //배송지 입력 호출(회원정보)
		return itemDao.getMemberDetail(member_idx);
	}
	
	public int deleteAllOrder(String member_idx) { //찌꺼기 제거
		return itemDao.deleteAllOrder(member_idx);
	}
	
	public int deleteAllOrderLast(String member_idx) { //찌꺼기 제거
		return itemDao.deleteAllOrderLast(member_idx);
	}
	
	public int updateItemCartS(HashMap<String, Object> map) { //카트 상태 변경 "N" to "S"
		return itemDao.updateItemCartS(map);
	}
	
	public HashMap<String, Object> getItemSelected(String cart_idx) { //카트 선택 상품
		return itemDao.getItemSelected(cart_idx);
	}
	
	public int addOrderDetail(HashMap<String, Object> map) { //주문서 등록(개별상품)
		return itemDao.addOrderDetail(map);
	}
	
	public int addOrderLast(HashMap<String, Object> map) { //주문서 등록
		return itemDao.addOrderLast(map);
	}
	
	public List<OrderVo> getOrderList(HashMap<String, Object> map) { //주문예정 상품 호출
		return itemDao.getOrderList(map);
	}
	
	public OrderLastVo getOrderLast(HashMap<String, Object> map) { //주문서 호출
		return itemDao.getOrderLast(map);
	}
	
	public MemberVo getMemberDetail2(String member_idx) { //회원정보 호출
		return itemDao.getMemberDetail2(member_idx);
	}
	
	public int updateCashReceipt(HashMap<String, Object> map) { //주문서 업데이트(현금영수증)
		return itemDao.updateCashReceipt(map);
	}
	
	public String getToken(HttpServletRequest request, HttpServletResponse response, JSONObject json, String requestURL) throws Exception{
		String token = "";
		try{
			String requestString = "";
			URL url = new URL(requestURL);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true); 				
			connection.setInstanceFollowRedirects(false);  
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json");
			OutputStream os= connection.getOutputStream();
			os.write(json.toString().getBytes());
			connection.connect();
			StringBuilder sb = new StringBuilder(); 
			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
				String line = null;  
				while ((line = br.readLine()) != null) {  
					sb.append(line + "\n");  
				}
				br.close();
				requestString = sb.toString();
			}
			os.flush();
			connection.disconnect();
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);
			if((Long)jsonObj.get("code")  == 0){
				JSONObject getToken = (JSONObject) jsonObj.get("response");
				token = (String)getToken.get("access_token");
			}
		} catch(Exception e) {
			e.printStackTrace();
			token = "";
		}
		return token;
	}
	
	public int getAmount(HttpServletRequest request, HttpServletResponse response, JSONObject json, String requestURL, String Authorization) throws Exception{
		int amount = 0;
		try{
			String requestString = "";
			URL url = new URL(requestURL);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true); 				
			connection.setInstanceFollowRedirects(false);  
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", Authorization);
			OutputStream os= connection.getOutputStream();
			os.write(json.toString().getBytes());
			connection.connect();
			StringBuilder sb = new StringBuilder(); 
			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
				String line = null;  
				while ((line = br.readLine()) != null) {  
					sb.append(line + "\n");  
				}
				br.close();
				requestString = sb.toString();
			}
			os.flush();
			connection.disconnect();
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);
			if((Long)jsonObj.get("code")  == 0){
				JSONObject getAmount = (JSONObject) jsonObj.get("response");
				amount = (int)(long)getAmount.get("amount");
			}
		} catch(Exception e) {
			e.printStackTrace();
			amount = 0;
		}
		return amount;
	}
	
	public int updateOrderState1B(HashMap<String, Object> map) { //주문서(개별상품) 상태변경(결제완료)
		return itemDao.updateOrderState1B(map);
	}
	
	public int updateOrderLastState1B(HashMap<String, Object> map) { //주문서 상태변경(결제완료)
		return itemDao.updateOrderLastState1B(map);
	}
	
	public int updateItemCartY(String member_idx) { //카트 상태 변경 "S" to "Y"
		return itemDao.updateItemCartY(member_idx);
	}
	
	public int updateOrderState1C(HashMap<String, Object> map) { //주문서(개별상품) 상태변경(검증완료)
		return itemDao.updateOrderState1C(map);
	}
	
	public int updateOrderLastState1C(HashMap<String, Object> map) { //주문서 상태변경(검증완료)
		return itemDao.updateOrderLastState1C(map);
	}

	public List<ItemVo> getItemHomeList() { //homecontroller
		return itemDao.getItemHomeList();
	}
}
