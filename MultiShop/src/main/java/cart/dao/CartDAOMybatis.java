package cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cart.bean.CartDTO;

@Transactional
@Component
public class CartDAOMybatis implements CartDAO{
	 @Autowired
	 private SqlSession sqlSession;
		
	@Override
	public int countCart(String p_code, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p_code",p_code);
		map.put("email",email);
		
		return sqlSession.selectOne("cartSQL.countCart", map);
	}

	@Override
	public void insert(CartDTO cartDTO) {
		sqlSession.insert("cartSQL.insertCart",cartDTO);
	}

	@Override
	public void updateCart(CartDTO cartDTO) {
		sqlSession.update("cartSQL.sumCart",cartDTO);
	}

	@Override
	public List<Map<String, String>> cartList(String email) {
		return sqlSession.selectList("cartSQL.cartList", email); 
	}

	@Override
	public int sumMoney(String email) {
		return sqlSession.selectOne("cartSQL.sumMoney", email);
	}

	@Override
	public void delete(int c_cartId) {
		sqlSession.delete("cartSQL.deleteCart",c_cartId);
	}

	@Override
	public void modifyCart(CartDTO cartDTO) {
		sqlSession.update("cartSQL.modifyCart",cartDTO);
	}

}
