package manage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import category.bean.ProductDTO;
import category.bean.Product_boardDTO;
import detail.bean.DetailQnADTO;
import member.bean.MemberDTO;

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
	public List<MemberDTO> getMembersList() {
		return sqlSession.selectList("manageSQL.getMembersList");
	}

	@Override
	public List<DetailQnADTO> getQnAReadyList() {
		return sqlSession.selectList("manageSQL.getQnAReadyList");
	}
	
	@Override
	public List<DetailQnADTO> getDetail_AnswerList(int p_code,int seq) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("p_code", p_code+"");
		map.put("seq",seq+"");
		return sqlSession.selectList("manageSQL.getDetail_AnswerList",map);
	}
	//Q&A답변하기
	@Override
	public void detail_AnswerUpdate(Map<String, String> map) {
		sqlSession.update("manageSQL.detail_AnswerUpdate",map);
	}

}
