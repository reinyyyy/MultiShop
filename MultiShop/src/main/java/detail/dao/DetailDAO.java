package detail.dao;

import java.util.List;
import java.util.Map;

import detail.bean.DetailDTO;
import detail.bean.DetailQnADTO;
import detail.bean.DetailhoogiDTO;

public interface DetailDAO {
   //재우
   public int getClothes(Map<String, String> map);
   
   public void updateOneClothes(Map<String, String> map);
   
   public void detail_userReview(DetailhoogiDTO detailhoogiDTO);

   public void detail_userQnA(DetailQnADTO detailQnADTO);

   public DetailQnADTO detail_GetQnAViewList(int seq);
	
   public void detail_QnA_Answer(Map<String, String> map);

   public List<DetailQnADTO> detail_QnA_List(int seq);

   public List<DetailhoogiDTO> detail_GetReViewTableList(int p_code);

   public List<DetailQnADTO> detail_GetQnATableList(int p_code);



}