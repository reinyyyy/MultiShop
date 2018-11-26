package detail.dao;

import java.util.List;
import java.util.Map;

import detail.bean.DetailDTO;
import detail.bean.DetailQnADTO;
import detail.bean.DetailhoogiDTO;

public interface DetailDAO {
   
   //public List<DetailDTO> getClothes(DetailDTO detailDTO);
   
   //public void deleteOneClothes(DetailDTO detailDTO);
   
   public List<DetailhoogiDTO> detail_GetReViewList(int detail_hoogi_startNum,int detail_hoogi_endNum);

   public List<DetailQnADTO> detail_GETQnAList(int detail_QnA_startNum,int detail_QnA_endNum);

   public void detail_userReview(DetailhoogiDTO detailhoogiDTO);

   public void detail_userQnA(DetailQnADTO detailQnADTO);

   public DetailQnADTO detail_GetQnAViewList(int seq);
	
	
   public int detail_GetTotalReView();
	
   public int detail_GetTotalQnA();

   public void detail_QnA_Answer(Map<String, String> map);

   public List<DetailQnADTO> detail_QnA_List(int seq);
	   	
}