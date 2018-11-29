package category.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Product_boardDTO {
	private int p_cateNum;
	private int p_code;
	private String p_name;
	private String p_contents;
	private int p_COST;
	private String p_image;
	private Date p_date;
}
