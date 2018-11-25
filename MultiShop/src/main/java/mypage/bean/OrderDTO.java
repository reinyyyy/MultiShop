package mypage.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class OrderDTO {
	public String m_email;
	public String d_code; 
	public String o_num;
	public Date o_date;
	public String o_addr;
	public String o_tel;
	public String o_divCode;
	public String o_pay;
	public String o_etc;
	public String p_code;
}
