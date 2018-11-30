package cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cart.bean.CartDTO;
import cart.dao.CartDAO;


@Controller
@RequestMapping("/shopping_cart")
public class CartController {
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private CartDTO cartDTO;
	
}
