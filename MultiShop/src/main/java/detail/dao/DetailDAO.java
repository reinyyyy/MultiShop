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
   
   
   
   
   
   
   
   public List<DetailhoogiDTO> detail_GetReViewList();

   public List<DetailQnADTO> detail_GETQnAList();

   public void detail_userReview(DetailhoogiDTO detailhoogiDTO);

   public void detail_userQnA(DetailQnADTO detailQnADTO);

   public DetailQnADTO detail_GetQnAViewList(int seq);
   
}