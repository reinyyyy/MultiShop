package cart.dao;

import java.util.List;
import java.util.Map;

import cart.bean.CartDTO;

public interface CartDAO {

	public int countCart(String p_code, String email);

	public void insert(CartDTO cartDTO);

	public void updateCart(CartDTO cartDTO); //장바구니 수량 변경

	public List<Map<String, String>> cartList(String email);

	public int sumMoney(String email);

	public void delete(int c_cartId);

	public void modifyCart(CartDTO cartDTO);

}
