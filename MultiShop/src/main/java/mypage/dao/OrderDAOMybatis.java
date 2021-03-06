package mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import manage.bean.InquiryDTO;
import mypage.bean.OrderDTO;

@Transactional
@Component
public class OrderDAOMybatis implements OrderDAO{
	@Autowired
	private SqlSession sqlSession;

	public List<OrderDTO> orderList(Map<String,String> map) {
		return sqlSession.selectList("orderSQL.orderList", map);
	}

	public int totalA() {
		return sqlSession.selectOne("orderSQL.totalA");
	}

	public void insertOrder(Map<String, String> map) {
		sqlSession.insert("orderSQL.insertOrder",map);
	}
	
	public List<OrderDTO> orderAllList(String email) {
	      return sqlSession.selectList("orderSQL.orderAllList", email);
	   }

	@Override
	public List<InquiryDTO> inquiryList(String email) {
		return sqlSession.selectList("orderSQL.inquiryList", email);
	}
	
}
