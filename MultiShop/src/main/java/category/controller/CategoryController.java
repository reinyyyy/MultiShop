package category.controller;



import java.util.ArrayList;
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
										@RequestParam(defaultValue="1") int pg,
										@RequestParam(defaultValue="1") String sortType) {
		ModelAndView mav = new ModelAndView();
		if(cateNum == 1) {
			mav.addObject("pageName", "Food");
		}else if(cateNum == 2) {
			mav.addObject("pageName", "Tech++");
		}else if(cateNum == 3) {
			mav.addObject("pageName", "Clothes");
		}	
		
		
		mav.addObject("pg", pg);
		mav.addObject("sortType", sortType);
		mav.addObject("section", "/category/categoryItemList.jsp");
		mav.addObject("cateNum", cateNum);		//카테고리 번호
		mav.setViewName("/main/main");
		return mav;
	}
	
	//각 카테고리 전체 리스트 하나로 됨, 구분자 cateNum
	@RequestMapping(value="getList", method=RequestMethod.POST)
	public ModelAndView getList(@RequestParam String cateNum,
								@RequestParam(defaultValue="1") String pg,
								@RequestParam(defaultValue="1") String sortType,
								@RequestParam(required=false) String p_midCate) {
		
		int sortType_int = Integer.parseInt(sortType);
		//sortType 1 : 신상품순
		//sortType 2 : 인기순
		//sortType 3 : 낮은가격순
		//sortType 4 : 높은가격순
		System.out.println("p_midCate = " + p_midCate + " p_cateNum = " + cateNum);
		
		// list_num 에 따라서 12개씩~ 현재는 5개씩보여주는 상태임
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		System.out.println("리스트 생성 pg : " + pg + " endNum = " + endNum + " startNum = " + startNum + " sortType = " + sortType);
		Map<String, String> map = new HashMap<String, String>();
		map.put("cateNum", cateNum);
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		map.put("p_midCate", p_midCate);
		//List<Product_boardDTO> list = categoryDAO.getProduct_Board_list(map);
		
		List<Map<String, String>> list_map = null;
		if(sortType_int == 2) {
			System.out.println("인기순 들어옴");
			list_map = categoryDAO.getProduct_Board_map_best(map);
		}else if(sortType_int == 3){
			System.out.println("낮은가격순 들어옴");
			map.put("order_type", "1");
			list_map = categoryDAO.getProduct_Board_map(map);
		}else if(sortType_int == 4){
			System.out.println("높은가격순 들어옴");
			map.put("order_type", "2");
			list_map = categoryDAO.getProduct_Board_map(map);
		}else {
			System.out.println("신상품순 들어옴");
			map.put("order_type", "3");
			list_map = categoryDAO.getProduct_Board_map(map);
		}
		
		System.out.println(list_map);
		
		int totalA = categoryDAO.getProduct_BoardTotalA(Integer.parseInt(cateNum));
		
		categoryPaging.setCurrentPage(Integer.parseInt(pg));
		categoryPaging.setPageBlock(3);
		categoryPaging.setPageSize(5);
		categoryPaging.setTotalA(totalA);
		categoryPaging.makePagingHTML();
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryPaging", categoryPaging);	//div 속에 넣어줘야함
		mav.addObject("list", list_map);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//모달창 데이터 채워서 반환해주는 메소드  		실행시점 : Quick View 클릭			컬러리스트와 사이즈리스트를 만들어서 반환해줘야할듯??
	@RequestMapping(value="quickView", method=RequestMethod.POST)
	public String quickView(@RequestParam Map<String, String> map,
							Model model) {
/*

		대표이미지 최대 5개 가지고있음
		
		5개의 대표이미지를 구분자 / 기준으로 나눠줘야함
		
		
		p_option1 에 구분자 / 기준으로 나눠야함			ex) 색상/사이즈 		
		p_option2 에 구준자 / 기준으로 나눠야함			ex) red/m
		
		1번 상품
		중량 : 1kg
		형태 : 현미
		
		2번 상품
		중량 : 2kg
		형태 : 현미
		
		
		
		
*/		
		int cateNum = Integer.parseInt(map.get("cateNum"));		// 지울예정1
		System.out.println("받아온 p_code : " + map.get("p_code"));
		
		ProductDTO productDTO = categoryDAO.getProduct(Integer.parseInt(map.get("p_code")));			//대표가 되는 DTO 빼내어왔음
		
		System.out.println("대표 상품 DTO : " + productDTO);
		
		
		//대표상품 대표 이미지 최대 5개 나누기
		String[] image_arr = productDTO.getP_image().split("/");
		for(String data : image_arr) {
			System.out.println("대표이미지 배열 리스트 : " + data);
		}
		//대표이미지 나누기 끝
		
		
		int p_group = productDTO.getP_code();										//대표 DTO p_code로 p_group 값 사용할 예정
		
		List<ProductDTO> group_list = categoryDAO.getGroup(p_group);				//대표 DTO p_code 에 얽힌 모든 p_group 들 불러다 리스트에 담음
		
		//String[] option1_arr = new String[group_list.size()];
		
		
		/*
			같은 그룹의 옵션 이름은 모두 같기때문에 대표상품의 option의 길이만큼 for 돌게만들자
			
			첫 for문은 구분자 '/' 를 split 해주는 역할
		*/
		if(productDTO.getP_option1() != null) {
			int option_length = productDTO.getP_option1().split("/").length;			// 구분자로 나눈 옵션1 의 길이 구함
			System.out.println("option_length 의 길이 : " + option_length);
			
			ArrayList<ArrayList<String>> option_result_list = new ArrayList<ArrayList<String>>(); 
			
			String[] option_name = group_list.get(0).getP_option1().split("/");			// 대표로 하나만 받아와서 배열에 저장 [{중량}, {형태}]
			String[] option_val = null;
			for(int i = 0; i < option_length; i++) {			//
				ArrayList<String> option_list = new ArrayList<String>();
				option_list.add(option_name[i]);
				
				for(int j = 0; j < group_list.size(); j++) {
					option_val = group_list.get(j).getP_option2().split("/");	//j == 1각 그룹마다 하나씩의 [{1kg}, {백미}]
					option_list.add(option_val[i]);
				}
				
				for(String data : option_list) {
					System.out.println("option_list"+i+" : " + data);
				}
				//List 를 배열로
				option_result_list.add(option_list);
			}
			model.addAttribute("option_result_list", option_result_list);
		}
		
		System.out.println("그룹들사이즈 : " + group_list.size());
		int[] amount_list = new int[group_list.size()];
		for(int i = 0; i < group_list.size(); i++) {
			amount_list[i] = group_list.get(i).getP_amount();
		}
		System.out.println("amount_list : " + amount_list);
		model.addAttribute("amount_list", amount_list);
		model.addAttribute("productDTO", productDTO);
		model.addAttribute("group_list", group_list);
		
		
		System.out.println(map.get("p_code"));
		return "/category/categoryQuickView";
		//categoryQuickView.jsp
	}
	
	
	
}
