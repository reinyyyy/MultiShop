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

import category.bean.ProductDTO;
import category.dao.CategoryDAO;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	private CategoryDAO categoryDAO;
	
	/*
					Cloth, Tech, Food ALL 													select * from ?
					Outter, Top, Bottom, Shoes, Inner										select * from CLOTH where cateId = ?
					Audio/Video, Game, SmartWatch, Drone, TV, Laptop/Computer HardWare		select * from TECH where cateId = ?
					Carbohydrate, Protein, Fat, Vitamin, Spice								select * from Food where cateId = ?
	*/
	
	
	//카테고리 리스트	어떤것을 뿌려줄지 cateNum 정해줘야함
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
		mav.addObject("cateNum", cateNum);		//카테고리 번호
		mav.setViewName("/main/main");
		return mav;
	}
	
	//각 카테고리 전체 리스트 하나로 됨, 구분자 cateNum
	@RequestMapping(value="getList", method=RequestMethod.POST)
	public ModelAndView getList(@RequestParam int cateNum) {
		ModelAndView mav = new ModelAndView();
		System.out.println(categoryDAO.getProduct_Board_list(cateNum));
		mav.addObject("list", categoryDAO.getProduct_Board_list(cateNum));
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	//모달창 데이터 채워서 반환해주는 메소드  		실행시점 : Quick View 클릭			컬러리스트와 사이즈리스트를 만들어서 반환해줘야할듯??
	@RequestMapping(value="quickView", method=RequestMethod.POST)
	public String quickView(@RequestParam Map<String, String> map,
							Model model) {
		
		int cateNum = Integer.parseInt(map.get("cateNum"));
		
		if(cateNum == 1) {	//푸드
			
		}else if(cateNum ==2) { //전자
			
		}else if(cateNum ==3) { //옷
			ProductDTO productDTO = categoryDAO.getProduct(map.get("p_code"));			//기본 정보 가지고옴
			//색정보와 사이즈정보를 한번에 같이 가져옴
			
			System.out.println(productDTO);
			String p_group = productDTO.getP_code();
			List<ProductDTO> group_list = categoryDAO.getGroup(p_group);
			
			System.out.println(productDTO);
			System.out.println(group_list);
			model.addAttribute("productDTO", productDTO);
			model.addAttribute("group_list", group_list);
		}
		
		
		System.out.println(map.get("p_code"));
		return "/category/categoryQuickView";
		//categoryQuickView.jsp
	}
	
	
	
}
