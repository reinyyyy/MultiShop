package cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cart.bean.CartDTO;
import cart.dao.CartDAO;


@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private CartDTO cartDTO;
	
	@RequestMapping(value="cart.do", method=RequestMethod.GET)
	   public ModelAndView cart(HttpSession session, @ModelAttribute ModelAndView mav) {
			
			String email = (String) session.getAttribute("session_email");
			Map<String, Object> map = new HashMap<String, Object>();
			
			List<Map<String, String>> list = cartDAO.cartList(email);
			
			System.out.println("갯수========"+list.size());
			int sumMoney = cartDAO.sumMoney(email); //장바구니 total 금액
			
			int i = 0;
			for(Map<String, String> data_list : list) {
				list.get(i).put("p_image", list.get(i).get("p_image").split("/")[1]);
				i++;
			}
			
			map.put("list", list);
			map.put("count", list.size());//상품이 있는지 없는지	
			map.put("sumMoney", sumMoney);
			
			mav.addObject("map",map);
			
			mav.addObject("section","/cart/cart.jsp");
			mav.setViewName("/main/main");
			return mav;
	   }
	
	@RequestMapping(value="insert.do",method=RequestMethod.POST)
		public String insert(@ModelAttribute CartDTO cartDTO, HttpSession session ) {
		
		String email = (String) session.getAttribute("session_email");
		cartDTO.setM_email(email);
		System.out.println("cartDTO=="+cartDTO);
		int count = cartDAO.countCart(cartDTO.getP_code(),email);
		System.out.println("@@@count=="+count);
		if(count==0) {
			System.out.println("count==0먹음");
			cartDAO.insert(cartDTO);
			
		}else {
			cartDAO.updateCart(cartDTO);
		}
		return "redirect:cart.do";
	}
	
	@RequestMapping(value="delete.do", method=RequestMethod.GET)
		public String delete(@RequestParam int c_seq) {
		cartDAO.delete(c_seq);
		return "redirect: /MultiShop/cart/cart.do";
	}
	
	@RequestMapping(value="update.do",method=RequestMethod.POST)
		public String update(@RequestParam int[] p_amount, @RequestParam int[] p_code, HttpSession session) {
		String email = (String) session.getAttribute("session_email");
		for(int i= 0; i <p_code.length; i++) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setM_email(email);
			cartDTO.setP_amount(p_amount[i]);
			cartDTO.setP_code(p_code[i]);
			cartDAO.modifyCart(cartDTO);
		}
		return "redirect:cart.do";	
	}
}
