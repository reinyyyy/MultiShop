package cart.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CartDTO {
	public int c_seq;
	public String m_email;
	public int p_code;
	public int p_amount;
}
