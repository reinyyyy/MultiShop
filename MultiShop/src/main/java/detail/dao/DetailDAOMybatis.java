package detail.dao;

import java.util.List;

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
   
   /*
   public List<DetailDTO> getClothes(DetailDTO detailDTO) {
      return sqlSession.selectList("detailSQL.getClothes",detailDTO);
   }

   public void deleteOneClothes(DetailDTO detailDTO) {
      sqlSession.update("detailSQL.deleteOneClothes",detailDTO);
   }*/
   
   
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
