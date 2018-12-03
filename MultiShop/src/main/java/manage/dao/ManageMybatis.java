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
import manage.bean.InquiryDTO;
import mypage.bean.OrderDTO;
import notice.bean.NoticeDTO;

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
	public List<OrderDTO> orderList() {
		return sqlSession.selectList("manageSQL.orderList");
	}

	@Override
	public int orderStatusUpdate(int o_num,String o_status) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("o_num", o_num);
			map.put("o_status", o_status);
		 return sqlSession.update("manageSQL.orderStatusUpdate",map);
	}

	@Override
	public List<InquiryDTO> inquiryList() {
		return sqlSession.selectList("manageSQL.inquiryList");
	}

	@Override
	public int inquiryUpdate(int i_seq, String i_inquiry) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("i_seq", i_seq);
		map.put("i_inquiry", i_inquiry);
		return sqlSession.update("manageSQL.inquiryUpdate",map);
	}

	@Override
	public List<NoticeDTO> noticeList() {
		return sqlSession.selectList("manageSQL.noticeList");
	}

	@Override
	public int noticeInsert(Map<String,String> map) {
		return sqlSession.insert("manageSQL.noticeInsert",map);
	}

	@Override
	public int orderTableCount(String status) {
		return sqlSession.selectOne("manageSQL.orderTableCount", status);
	}

	@Override
	public String totalSales() {
		return sqlSession.selectOne("manageSQL.totalSales");
	}
}
