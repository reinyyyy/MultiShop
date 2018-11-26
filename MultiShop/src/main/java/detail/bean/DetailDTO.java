package detail.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class DetailDTO {
   
   private int p_cateNum;
   private String p_midCate;
   private String p_smallCate;
   private int p_code;
   private int p_group;
   private String p_name;
   private String p_color;
   private String p_size;
   private int p_amount;
   private int p_cost;
   
}