package manage.dao;

import java.util.List;
import java.util.Map;

import category.bean.ProductDTO;

public interface ManageDAO {

	public List<ProductDTO> getProductListsJson(Map<String, String> map);

	public void productModifyJson(Map<String, String> map);

	public void productDeleteJson(Map<String, String> map);
	
}
