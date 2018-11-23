package category.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import category.bean.ClothesDTO;

@Component
@Transactional
public class CategoryDAOMybatis implements CategoryDAO{
   
   @Autowired
   private SqlSession sqlSession;
   //각 카테고리 전체 리스트불러오기 
   public List<ClothesDTO> getProductList(int code) {
      return sqlSession.selectList("categorySQL.getProductList", code); 
   }
   
   //퀵뷰에 데이터 넣을때 쓸거
   public ClothesDTO getProduct(String p_code) {
      return sqlSession.selectOne("categorySQL.getProduct", p_code);
   }
}