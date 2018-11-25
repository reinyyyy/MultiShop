package mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import mypage.bean.OrderDTO;

@Transactional
@Component
public class OrderDAOMybatis implements OrderDAO{
	@Autowired
	private SqlSession sqlSession;

	public List<OrderDTO> orderList(String email) {
		return sqlSession.selectList("orderSQL.orderList", email);
	}
}
