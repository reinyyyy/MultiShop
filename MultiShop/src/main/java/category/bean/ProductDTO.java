package category.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ProductDTO {
    private String p_cateNum;   
    private String p_midCate;   
    private String p_smallCate; 
    private String p_code;      
    private String p_group;     
    private String p_name;      
    private String p_option1;   
    private String p_option2;   
    private int p_amount;    
    private int p_cost;      
    private String p_status;    
    private String p_maker;     
    private String p_origin;    
}
