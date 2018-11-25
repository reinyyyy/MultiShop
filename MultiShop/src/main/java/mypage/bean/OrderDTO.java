package mypage.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;
import member.bean.MemberDTO;
@Component
@Data
public class OrderDTO {
	public String d_code;
	public String d_license;
	public String d_price;
	public String d_qty;
	public Date d_date;    
	public String d_status; 
}
