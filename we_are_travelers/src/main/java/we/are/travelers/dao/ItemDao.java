package we.are.travelers.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import we.are.travelers.vo.ItemVo;

@Repository
public class ItemDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.item";
	
	@Autowired
	public ItemDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int addItem(ItemVo itemVo) {
		return sqlSession.insert(MAPPER+".addItem", itemVo);
	}

	public List<ItemVo> getItemList() {
		return sqlSession.selectList(MAPPER+".getItemList");
	}

}
