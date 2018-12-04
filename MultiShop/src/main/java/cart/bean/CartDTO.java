package cart.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CartDTO {
	public int c_seq;
	public String m_email;
	public String p_code;
	public int p_cost;
	public int p_amount;
	public String p_option1;
	public String p_option2;
}
