package category.bean;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class ProductDTO {
    private int p_cateNum;   
    private String p_midCate;   
    private String p_smallCate; 
    private int p_code;      
    private int p_group;     
    private String p_name;      
    private String p_option1;   
    private String p_option2;   
    private int p_amount;    
    private int p_cost;      
    private String p_status;    
    private String p_maker;
    private String p_origin;
    private String p_image;
    private String p_sales;
    @JsonFormat(pattern="yyyy-MM-dd")
    private String p_date;
}
