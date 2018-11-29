package mypage.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class OrderDTO {
	public String m_email;
	public String d_code; 
	public int o_num;
	public Date o_date;
	public String o_addr;
	public String o_status;
	public String p_code;
	public int p_cost;
	public int p_amount;
	//재우  수정
}
