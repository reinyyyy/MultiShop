package cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cart.bean.CartDTO;
import cart.dao.CartDAO;


@Controller
@RequestMapping("/cart")
public class CartController {
	/*@Autowired
	private CartDAO cartDAO;*/
	@Autowired
	private CartDTO cartDTO;
	
	@RequestMapping(value="cart.do", method=RequestMethod.GET)
	   public ModelAndView mypage(@ModelAttribute ModelAndView mav) {
	      mav.addObject("section","/cart/cart.jsp");
	      mav.setViewName("/main/main");
	      return mav;
	   }
}
