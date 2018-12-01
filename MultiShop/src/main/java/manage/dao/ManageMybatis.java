package manage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import category.bean.ProductDTO;
import category.bean.Product_boardDTO;
import manage.bean.InquiryDTO;

@Component
@Transactional
public class ManageMybatis implements ManageDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ProductDTO> getProductListsJson(Map<String, String> map) {
		return sqlSession.selectList("manageSQL.getProductListsJson", map);
	}
	
	//상품 등록
	public void productInsert(ProductDTO productDTO) {
		sqlSession.insert("manageSQL.productInsert", productDTO);
	}

	//상품 글 등록
	public void product_boardInsert(Product_boardDTO product_boardDTO) {
		sqlSession.insert("manageSQL.product_boardInsert", product_boardDTO);
	}

	//상품 p_group 빼오기 where : p_name
	public List<Integer> getProduct(String p_name) {
		return sqlSession.selectList("manageSQL.getProduct", p_name);
	}

	//데이터 넣기전 seq 값 구하기
	public int getSeq() {
		return sqlSession.selectOne("manageSQL.getSeq");
	}

	@Override
	public int inquiryInsert(InquiryDTO inquiryDTO) {
		return sqlSession.insert("manageSQL.inquiryInsert", inquiryDTO);
	}
}
