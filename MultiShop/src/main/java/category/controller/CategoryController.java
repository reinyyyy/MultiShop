package category.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import category.bean.CategoryPaging;
import category.bean.ProductDTO;
import category.bean.Product_boardDTO;
import category.dao.CategoryDAO;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private CategoryPaging categoryPaging;
	
	/*
					Cloth, Tech, Food ALL 													select * from ?
					Outter, Top, Bottom, Shoes, Inner										select * from CLOTH where cateId = ?
					Audio/Video, Game, SmartWatch, Drone, TV, Laptop/Computer HardWare		select * from TECH where cateId = ?
					Carbohydrate, Protein, Fat, Vitamin, Spice								select * from Food where cateId = ?
	*/
	
	
	//카테고리 리스트	어떤것을 뿌려줄지 cateNum 정해줘야함
	@RequestMapping(value="categoryItemList", method=RequestMethod.GET)
	public ModelAndView categoryItemList(@RequestParam(defaultValue="1") int cateNum,
										@RequestParam(defaultValue="1") int pg) {
		ModelAndView mav = new ModelAndView();
		if(cateNum == 1) {
			mav.addObject("pageName", "Food");
		}else if(cateNum == 2) {
			mav.addObject("pageName", "Tech++");
		}else if(cateNum == 3) {
			mav.addObject("pageName", "Clothes");
		}	
		
		
		mav.addObject("pg", pg);
		mav.addObject("section", "/category/categoryItemList.jsp");
		mav.addObject("cateNum", cateNum);		//카테고리 번호
		mav.setViewName("/main/main");
		return mav;
	}
	
	//각 카테고리 전체 리스트 하나로 됨, 구분자 cateNum
	@RequestMapping(value="getList", method=RequestMethod.POST)
	public ModelAndView getList(@RequestParam int cateNum,
								@RequestParam(defaultValue="1") int pg) {
		
		
		// list_num 에 따라서 12개씩~ 현재는 5개씩보여주는 상태임
		int endNum = pg*5;
		int startNum = endNum-4;
		
		System.out.println("리스트 생성 pg : " + pg + " endNum = " + endNum + " startNum = " + startNum);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cateNum", cateNum);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<Product_boardDTO> list = categoryDAO.getProduct_Board_list(map);
		
		int totalA = categoryDAO.getProduct_BoardTotalA(cateNum);
		
		categoryPaging.setCurrentPage(pg);
		categoryPaging.setPageBlock(3);
		categoryPaging.setPageSize(5);
		categoryPaging.setTotalA(totalA);
		categoryPaging.makePagingHTML();
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryPaging", categoryPaging);	//div 속에 넣어줘야함
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//모달창 데이터 채워서 반환해주는 메소드  		실행시점 : Quick View 클릭			컬러리스트와 사이즈리스트를 만들어서 반환해줘야할듯??
	@RequestMapping(value="quickView", method=RequestMethod.POST)
	public String quickView(@RequestParam Map<String, String> map,
							Model model) {
		
		int cateNum = Integer.parseInt(map.get("cateNum"));
		
		ProductDTO productDTO = categoryDAO.getProduct(Integer.parseInt(map.get("p_code")));			//기본 정보 가지고옴
		//색정보와 사이즈정보를 한번에 같이 가져옴
		
		String[] image_arr = productDTO.getP_image().split("/");
		for(String data : image_arr) {
			System.out.println(data);
		}
		
		
		
		System.out.println(productDTO);
		int p_group = productDTO.getP_code();										//퀵뷰 클릭한 하나의 제품 p_code 기준으로 묶인 p_group 목록들 데리고옴
		List<ProductDTO> group_list = categoryDAO.getGroup(p_group);				
		
		
		
		System.out.println(productDTO);
		System.out.println("그룹리스트 시작");
		System.out.println(group_list);
		System.out.println("그룹리스트 끝");
		model.addAttribute("productDTO", productDTO);
		model.addAttribute("group_list", group_list);
		
		
		System.out.println(map.get("p_code"));
		return "/category/categoryQuickView";
		//categoryQuickView.jsp
	}
	
	
	
}
