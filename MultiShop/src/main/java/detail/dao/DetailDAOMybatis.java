package detail.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import detail.bean.DetailDTO;
import detail.bean.DetailQnADTO;
import detail.bean.DetailhoogiDTO;

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
   //구매 시 옷 수량 수정
   public void updateOneClothes(Map<String, String> map) {
      sqlSession.update("detailSQL.updateOneClothes",map);
   }
   
   
   
   
   
   
   // 양현규
   public void detail_userReview(DetailhoogiDTO detailhoogiDTO) {
      sqlSession.insert("detailSQL.detail_userReview",detailhoogiDTO);
   }
  
   public List<DetailhoogiDTO> detail_GetReViewList() {
      return sqlSession.selectList("detailSQL.detail_GetReViewList");
   }
   
   public void detail_userQnA(DetailQnADTO detailQnADTO) {
      sqlSession.insert("detailSQL.detail_userQnA",detailQnADTO);
   }
   
   public List<DetailQnADTO> detail_GETQnAList() {
      return sqlSession.selectList("detailSQL.detail_GetQnAList");
   }
 
   public DetailQnADTO detail_GetQnAViewList(int seq) {
      return sqlSession.selectOne("detailSQL.detail_GetQnAViewList",seq);
   }


   

}
