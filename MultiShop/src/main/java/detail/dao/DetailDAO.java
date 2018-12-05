package detail.dao;

import java.util.List;
import java.util.Map;

import category.bean.Product_boardDTO;
import detail.bean.DetailDTO;
import detail.bean.DetailQnADTO;
import detail.bean.DetailhoogiDTO;

public interface DetailDAO {
   //-----------------재우
   public int getClothes(Map<String, String> map);
   
   public void updateOneClothes(Map<String, String> map);
   //상세페이지 옵션, 재고, 수량, 사이즈  모두 불러오기
   public List<DetailDTO> getDetailPageSource(int p_code);
   //상세페이지 글 정보, 이미지 , 가격 모두불러오기
   public Product_boardDTO getDetailPageInfo(int p_code);
   
   //현규
   public void detail_userReview(Map<String,String> map);

   public void detail_userQnA(Map<String,String> map);

   public DetailQnADTO detail_GetQnAViewList(int seq);
	
   public void detail_QnA_Answer(Map<String, String> map);

   public List<DetailQnADTO> detail_QnA_List(int seq);

   public List<DetailhoogiDTO> detail_GetReViewTableList(int p_code);

   public List<DetailQnADTO> detail_GetQnATableList(int p_code);



}