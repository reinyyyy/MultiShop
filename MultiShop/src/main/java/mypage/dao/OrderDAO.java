package mypage.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import mypage.bean.OrderDTO;

@Transactional
@Component
public interface OrderDAO {
	
	public List<OrderDTO> orderList(String email);
}
