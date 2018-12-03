package mypage.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class OrderDTO {
	public String m_email;
	public String d_code; 
	public int o_num;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "GMT+9")
	public Date o_date;
	public String o_addr;
	public String o_status;
	public String p_code;
	public int p_cost;
	public int p_amount;
	//재우  수정
}
