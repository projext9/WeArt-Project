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
import we.are.travelers.vo.ItemVo;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OptionVo;
import we.are.travelers.vo.OrderLastVo;
import we.are.travelers.vo.OrderVo;

@Service
public class ItemService {
	
	private ItemDao itemDao;
	
	@Autowired
	public ItemService(ItemDao itemDao) {
		this.itemDao = itemDao;
	}
	
	public int addItem(ItemVo itemVo) {
		return itemDao.addItem(itemVo);
	}

	public List<ItemVo> getItemList() { //상품 리스트 호출
		return itemDao.getItemList();
	}

	public ItemVo getItemDetail(int item_idx) { //상품 상세 호출
		return itemDao.getItemDetail(item_idx);
	}
	
	public List<OptionVo> getItemOption(int item_idx) { //상품 상세 호출(옵션)
		return itemDao.getItemOption(item_idx);
	}
	
	public int addItemCart(HashMap<String, Object> map) { //장바구니 담기
		int result = 0;
		result = itemDao.addItemCart(map);
		return result;
	}
	
	public List<Map<String, Object>> getCartList(String member_idx) { //장바구니 호출
		return itemDao.getCartList(member_idx);
	}
	
	public List<Map<String, Object>> getItemOrder(List<String> cart_idx_list_) { //배송지 입력 호출(상품)
		return itemDao.getItemOrder(cart_idx_list_);
	}
	
	public Map<String, Object> getMemberDetail(String member_idx) { //배송지 입력 호출(회원정보)
		return itemDao.getMemberDetail(member_idx);
	}
	
	public int deleteAllOrder(String member_idx) { //찌꺼기 제거
		return itemDao.deleteAllOrder(member_idx);
	}
	
	public int deleteAllOrderLast(String member_idx) { //찌꺼기 제거
		return itemDao.deleteAllOrderLast(member_idx);
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
		}catch(Exception e){
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
		}catch(Exception e){
			e.printStackTrace();
			amount = 0;
		}
		return amount;
	}
	
	public int updateOrderList(HashMap<String, Object> map) { //주문서(개별상품) 상태변경(결제완료)
		return itemDao.updateOrderList(map);
	}
	
	public int updateOrderLast(HashMap<String, Object> map) { //주문서 상태변경(결제완료)
		return itemDao.updateOrderLast(map);
	}
	
}
