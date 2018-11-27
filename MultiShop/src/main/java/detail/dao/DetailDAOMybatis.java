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
   	@Override
   	public void detail_userReview(DetailhoogiDTO detailhoogiDTO) {
      sqlSession.insert("detailSQL.detail_userReview",detailhoogiDTO);
   	}
   	@Override
   	public List<DetailhoogiDTO> detail_GetReViewList(int detail_hoogi_startNum,int detail_hoogi_endNum) {
	   Map<String,Integer> map = new HashMap<String,Integer>();
	   map.put("detail_hoogi_startNum", detail_hoogi_startNum);
	   map.put("detail_hoogi_endNum", detail_hoogi_endNum);
      return sqlSession.selectList("detailSQL.detail_GetReViewList",map);
   	}
   	@Override
   	public void detail_userQnA(DetailQnADTO detailQnADTO) {
      sqlSession.insert("detailSQL.detail_userQnA",detailQnADTO);
   	}
   	@Override
   	public List<DetailQnADTO> detail_GETQnAList(int detail_QnA_startNum,int detail_QnA_endNum) {
	  Map<String,Integer> map = new HashMap<String,Integer>();
	  map.put("detail_QnA_startNum", detail_QnA_startNum);
	  map.put("detail_QnA_endNum", detail_QnA_endNum);
      return sqlSession.selectList("detailSQL.detail_GetQnAList",map);
   	}
   	@Override
   	public DetailQnADTO detail_GetQnAViewList(int seq) {
      return sqlSession.selectOne("detailSQL.detail_GetQnAViewList",seq);
   	}
   	@Override
   	public int detail_GetTotalReView() {
   		int totalReView = 0;
   		totalReView = sqlSession.selectOne("detailSQL.detail_GetTotalReView");
		return totalReView;
	}
   	@Override
	public int detail_GetTotalQnA() {
   		int tatalQnA = 0;
   		tatalQnA = sqlSession.selectOne("detailSQL.detail_detail_GetTotalQnA");
		return tatalQnA;
	}
   	@Override
	public void detail_QnA_Answer(Map<String, String> map) {
		sqlSession.update("detailSQL.detail_QnA_Answer",map);
	}
   	@Override
	public List<DetailQnADTO> detail_QnA_List(int seq) {
		return sqlSession.selectList("detailSQL.detail_QnA_List",seq);
	}
   
}
