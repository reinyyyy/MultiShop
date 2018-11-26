<<<<<<< HEAD
package detail.dao;

import java.util.HashMap;
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
  
   public List<DetailhoogiDTO> detail_GetReViewList(int detail_hoogi_startNum,int detail_hoogi_endNum) {
	   Map<String,Integer> map = new HashMap<String,Integer>();
	   map.put("detail_hoogi_startNum", detail_hoogi_startNum);
	   map.put("detail_hoogi_endNum", detail_hoogi_endNum);
      return sqlSession.selectList("detailSQL.detail_GetReViewList",map);
   }
   
   public void detail_userQnA(DetailQnADTO detailQnADTO) {
      sqlSession.insert("detailSQL.detail_userQnA",detailQnADTO);
   }
   
   public List<DetailQnADTO> detail_GETQnAList(int detail_QnA_startNum,int detail_QnA_endNum) {
	  Map<String,Integer> map = new HashMap<String,Integer>();
	  map.put("detail_QnA_startNum", detail_QnA_startNum);
	  map.put("detail_QnA_endNum", detail_QnA_endNum);
      return sqlSession.selectList("detailSQL.detail_GetQnAList",map);
   }
 
   public DetailQnADTO detail_GetQnAViewList(int seq) {
      return sqlSession.selectOne("detailSQL.detail_GetQnAViewList",seq);
   }

   //후기 페이징처리
   public List<DetailhoogiDTO> detail_hoogi_paging(int detail_hoogi_startNum, int detail_hoogi_endNum) {
	   return null;
   }
	//Q&A 페이징처리
	public List<DetailQnADTO> detail_QnA_paging(int detail_QnA_startNum, int detail_QnA_endNum) {
		return null;
	}

	public int detail_GetTotalReView() {
		return 0;
	}

	public int detail_GetTotalQnA() {
		return 0;
	}
   

}
=======
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
>>>>>>> refs/remotes/origin/minu
