package manage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import category.bean.ProductDTO;

@Component
@Transactional
public class MangeMybatis implements ManageDAO {
	@Autowired
	private SqlSession sqlSession;

	//상품 등록
	public void productInsert(ProductDTO productDTO) {
		sqlSession.insert("manageSQL.productInsert", productDTO);
	}
	
	
}
