package detail.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import category.bean.Product_boardDTO;
import detail.bean.DetailDTO;
import detail.bean.DetailQnADTO;
import detail.bean.DetailhoogiDTO;
import member.bean.MemberDTO;

@Transactional   //commit , close
@Component
public class DetailDAOMybatis implements DetailDAO {
   @Autowired
   private SqlSession sqlSession;
   //재우
   //옷 수량확인
   public int getClothes(Map<String, String> map) {
		return sqlSession.selectOne("detailSQL.getClothes",map);
	}
   	//선택한 물건확인
	public DetailDTO getSelectProduct(int p_code) {
   		return sqlSession.selectOne("detailSQL.getSelectProduct", p_code);
	}
   
   //구매 시 옷 수량 수정
   public void updateOneClothes(Map<String, String> map) {
	   sqlSession.update("detailSQL.updateOneClothes",map);
   }
   	//상세페이지 옵션 불러오기
	@Override
	public List<DetailDTO> getDetailPageSource(int p_code) {
		return sqlSession.selectList("detailSQL.getDetailPageSource",p_code);
	}
	
	@Override
	public Product_boardDTO getDetailPageInfo(int p_code) {
		return sqlSession.selectOne("detailSQL.getDetailPageInfo",p_code);
	}
	
   // 양현규
   	@Override
   	public void detail_userReview(Map<String,String> map) {
      sqlSession.insert("detailSQL.detail_userReview",map);
   	}
   	//테이블 변경
   	@Override
   	public void detail_userQnA(Map<String,String> map) {
      sqlSession.insert("detailSQL.detail_userQnA",map);
   	}
   	@Override
   	public DetailQnADTO detail_GetQnAViewList(int seq) {
      return sqlSession.selectOne("detailSQL.detail_GetQnAViewList",seq);
   	}

   	@Override
	public void detail_QnA_Answer(Map<String, String> map) {
		sqlSession.update("detailSQL.detail_QnA_Answer",map);
	}
   	@Override
	public List<DetailQnADTO> detail_QnA_List(int seq) {
		return sqlSession.selectList("detailSQL.detail_QnA_List",seq);
	}
   	//후기 테이블 데이터 불러오기
	@Override
	public List<DetailhoogiDTO> detail_GetReViewTableList(int p_code) {
		return sqlSession.selectList("detailSQL.detail_GetReViewTableList",p_code);
	}
	//Q&A 테이블 데이터 불러오기
	@Override
	public List<DetailQnADTO> detail_GetQnATableList(int p_code) {
		return sqlSession.selectList("detailSQL.detail_GetQnATableList",p_code);
	}
	@Override
	public MemberDTO getCoupon(String session_email) {
		return sqlSession.selectOne("detailSQL.getCoupon",session_email);
	}
	@Override
	public void couponDelete(String email) {
		sqlSession.update("detailSQL.couponDelete",email);
	}
   
}
