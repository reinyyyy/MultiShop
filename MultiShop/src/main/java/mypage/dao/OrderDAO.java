package mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import manage.bean.InquiryDTO;
import mypage.bean.OrderDTO;

@Transactional
@Component
public interface OrderDAO {
	
	public List<OrderDTO> orderList(Map<String,String> map);
	
	public int totalA();
	//재우 DetailController에서 결재 때문에 추가한것
	public void insertOrder(Map<String, String> map);
	
	public List<OrderDTO> orderAllList(String email);

	public List<InquiryDTO> inquiryList(String email);

	public List<OrderDTO> recentlyOrderList(String email);
	
	public int orderCancel(Map<String,String> map);
	
}
