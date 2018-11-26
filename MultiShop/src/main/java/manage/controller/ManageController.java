package manage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/manage")
public class ManageController {
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
	
}
