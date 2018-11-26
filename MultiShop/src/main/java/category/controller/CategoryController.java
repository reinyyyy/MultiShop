package category.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import category.bean.ClothesDTO;
import category.dao.CategoryDAO;

@Controller
@RequestMapping("/category")
public class CategoryController {
   @Autowired
   private CategoryDAO categoryDAO;
   
   /*
               Cloth, Tech, Food ALL                                        select * from ?
               Outter, Top, Bottom, Shoes, Inner                              select * from CLOTH where cateId = ?
               Audio/Video, Game, SmartWatch, Drone, TV, Laptop/Computer HardWare      select * from TECH where cateId = ?
               Carbohydrate, Protein, Fat, Vitamin, Spice                        select * from Food where cateId = ?
   */
   
   
   //카테고리 리스트   어떤것을 뿌려줄지 cateNum 정해줘야함
   @RequestMapping(value="categoryItemList", method=RequestMethod.GET)
   public ModelAndView categoryItemList(@RequestParam(defaultValue="1") int cateNum) {
      ModelAndView mav = new ModelAndView();
      if(cateNum == 1) {
         mav.addObject("pageName", "Food");
      }else if(cateNum == 2) {
         mav.addObject("pageName", "Tech++");
      }else if(cateNum == 3) {
         mav.addObject("pageName", "Clothes");
      }   
      
      mav.addObject("section", "/category/categoryItemList.jsp");
      mav.addObject("cateNum", cateNum);      //카테고리 번호
      mav.setViewName("/main/main");
      return mav;
   }
   
   //각 카테고리 전체 리스트
   @RequestMapping(value="getList", method=RequestMethod.POST)         //리스트를 제품 DTO가 아닌, PRODCT_BOARDDTO 로 받아와야함
   public ModelAndView getList(@RequestParam int cateNum) {
      ModelAndView mav = new ModelAndView();
      System.out.println(categoryDAO.getProductList(cateNum));
      mav.addObject("list", categoryDAO.getProductList(cateNum));            //조인으로 묶어야할듯 안하면 상품카테
   //   mav.addObject("list", categoryDAO.getProduct_Board_list(cateNum));
      
      mav.setViewName("jsonView");
      return mav;
   }
   
   //모달창 데이터 채워서 반환해주는 메소드  
   @RequestMapping(value="quickView", method=RequestMethod.POST)
   public String quickView(@RequestParam Map<String, String> map,
                     Model model) {
      ClothesDTO clothesDTO = categoryDAO.getProduct(map.get("p_code"));
      
      System.out.println(clothesDTO);
      model.addAttribute("clothesDTO", clothesDTO);
      
      
      System.out.println(map.get("p_code"));
      return "/category/categoryQuickView";
      //categoryQuickView.jsp
   }
   
   
   
}
