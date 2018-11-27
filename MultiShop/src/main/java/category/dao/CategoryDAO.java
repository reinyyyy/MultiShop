package category.dao;

import java.util.List;
import java.util.Map;

import category.bean.ProductDTO;
import category.bean.Product_boardDTO;

public interface CategoryDAO {
	public List<ProductDTO> getProductList(int code);
	public ProductDTO getProduct(int p_code);
	public List<ProductDTO> getGroup(int p_group);
	public int getProduct_BoardTotalA(int cateNum);
	public List<Map<String, String>> getProduct_Board_map(Map<String, Integer> map);
}
