package manage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import category.bean.ProductDTO;
import manage.dao.ManageDAO;

@Controller
@RequestMapping("/manage")
public class ManageController {
	@Autowired
	private ManageDAO manageDAO;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/manage/main.jsp");
		mav.setViewName("/main/adminIndex");
		return mav;
	}
	
	@RequestMapping(value="productAdd", method=RequestMethod.GET)
	public ModelAndView productAdd() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/manage/productAdd.jsp");
		mav.setViewName("/main/adminIndex");
		return mav;
	}
	
	@RequestMapping(value="productLists", method=RequestMethod.GET)
	public ModelAndView productLists() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/manage/productLists.jsp");
		mav.setViewName("/main/adminIndex");
		return mav;
	}
	
	@RequestMapping(value="orderManageTotal", method=RequestMethod.GET)
	public ModelAndView orderManageTotal() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/manage/orderManageTotal.jsp");
		mav.setViewName("/main/adminIndex");
		return mav;
	}
	
	@RequestMapping(value="orderSimpleTotal", method=RequestMethod.GET)
	public ModelAndView orderSimpleTotal() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/manage/orderSimpleTotal.jsp");
		mav.setViewName("/main/adminIndex");
		return mav;
	}
	
	@RequestMapping(value="memberTotal", method=RequestMethod.GET)
	public ModelAndView memberTotal() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/manage/memberTotal.jsp");
		mav.setViewName("/main/adminIndex");
		return mav;
	}
	
	@RequestMapping(value="productListsJson", method=RequestMethod.POST)
	public ModelAndView productListsJson(@RequestParam Map<String, String> map) {
		
		List<ProductDTO> list = manageDAO.getProductListsJson(map);
		System.out.println(list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="productModifyJson", method=RequestMethod.POST)
	public ModelAndView productModifyJson(@RequestParam Map<String, String> map) {
		
		manageDAO.productModifyJson(map);
		System.out.println(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="productDeleteJson", method=RequestMethod.POST)
	public ModelAndView productDeleteJson(@RequestParam Map<String, String> map) {
		
		manageDAO.productDeleteJson(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
}
