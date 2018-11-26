package category.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import category.bean.ProductDTO;
import category.bean.Product_boardDTO;

@Component
@Transactional
public class CategoryDAOMybatis implements CategoryDAO{
	
	@Autowired
	private SqlSession sqlSession;
	//각 카테고리 전체 리스트불러오기 
	public List<ProductDTO> getProductList(int code) {
		return sqlSession.selectList("categorySQL.getProductList", code); 
	}
	
	//퀵뷰에 데이터 넣을때 쓸거
	public ProductDTO getProduct(int p_code) {
		return sqlSession.selectOne("categorySQL.getProduct", p_code);
	}

	//글 리스트 목록 불러오기
	public List<Product_boardDTO> getProduct_Board_list(Map<String, Integer> map) {
		return sqlSession.selectList("categorySQL.getProduct_Board_list", map);
	}

	//패션, 같은 그룹의 컬러, 사이즈 목록 가져오기
	public List<ProductDTO> getGroup(int p_group) {
		return sqlSession.selectList("categorySQL.getGroup", p_group);
	}
	
	//카테고리 넘버로 글 카운팅하기
	public int getProduct_BoardTotalA(int cateNum) {
		return sqlSession.selectOne("categorySQL.getProduct_BoardTotalA", cateNum);
	}
}
