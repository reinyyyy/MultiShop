package manage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import category.bean.ProductDTO;

@Component
@Transactional
public class ManageMybatis implements ManageDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<ProductDTO> getProductListsJson(Map<String, String> map) {
		return sqlSession.selectList("manageSQL.getProductListsJson", map);
	}

	public void productModifyJson(Map<String, String> map) {
		sqlSession.update("manageSQL.productModifyJson",map);
	}

	public void productDeleteJson(Map<String, String> map) {
		sqlSession.delete("manageSQL.productDeleteJson",map);
	}
}
