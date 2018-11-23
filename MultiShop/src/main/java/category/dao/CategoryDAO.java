package category.dao;

import java.util.List;

import category.bean.ProductDTO;

public interface CategoryDAO {
	public List<ProductDTO> getProductList(int code);
	public ProductDTO getProduct(String p_code);
	public List<ProductDTO> getProduct_Board_list(int cateNum);
	public List<ProductDTO> getGroup(String p_group);
}
