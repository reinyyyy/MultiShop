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
   	//테이블 변경
   	@Override
   	public void detail_userQnA(DetailQnADTO detailQnADTO) {
      sqlSession.insert("detailSQL.detail_userQnA",detailQnADTO);
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
   
}
