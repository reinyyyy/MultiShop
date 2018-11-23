package category.dao;

import java.util.List;

import category.bean.ClothesDTO;

public interface CategoryDAO {
   public List<ClothesDTO> getProductList(int code);
   public ClothesDTO getProduct(String p_code);
}