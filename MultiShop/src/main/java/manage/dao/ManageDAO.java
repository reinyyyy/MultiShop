package manage.dao;

import java.util.List;

import category.bean.ProductDTO;
import category.bean.Product_boardDTO;

public interface ManageDAO {

	//상품 등록
	public void productInsert(ProductDTO productDTO);

	//상품 글등록
	public void product_boardInsert(Product_boardDTO product_boardDTO);

	//상품 하나 뺴오기 (ManageController 에서 사용) 기준은 p_group 으로 잡고 꺼내옴
	public List<Integer> getProduct(String p_name);

	//현재 시퀀스값 조회
	public int getSeq();
	
}
