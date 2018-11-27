package mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import mypage.bean.OrderDTO;

@Transactional
@Component
public interface OrderDAO {
	
	public List<OrderDTO> orderList(Map<String,String> map);
	
	public int totalA();
	
	public void insertOrder(Map<String, String> map);
}
