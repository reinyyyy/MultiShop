package manage.dao;

import java.util.List;
import java.util.Map;

import category.bean.ProductDTO;

public interface ManageDAO {

	List<ProductDTO> getProductListsJson(Map<String, String> map);
	
}
