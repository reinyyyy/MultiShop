package mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.dao.MemberDAO;
import mypage.bean.OrderDTO;
import mypage.dao.OrderDAO;

@Controller
public class MypageController {
	
	@Autowired
	private MemberDTO memberDTO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private OrderDTO orderDTO;
	@Autowired
	private OrderDAO orderDAO;
	
	 @RequestMapping(value="/mypage/mypage.do", method=RequestMethod.GET)
	   public ModelAndView mypage(@ModelAttribute ModelAndView mav) {
	      mav.addObject("section","/mypage/mypage.jsp");
	      mav.setViewName("/main/main");
	      return mav;
	   }
	   @RequestMapping(value="/mypage/membermodifyconfirmForm.do", method=RequestMethod.GET)
	   public ModelAndView membermodifyconfirmForm(@ModelAttribute ModelAndView mav) {
		   mav.addObject("section","/mypage/memberModify.jsp");
		   mav.setViewName("/main/main");
		   return mav;
	   }
	   @RequestMapping(value = "/mypage/membermodifyconfirm.do",method=RequestMethod.POST)
	   public @ResponseBody String membermodifyconfirm(@RequestParam Map<String,String> map,HttpSession session) {
	      memberDTO = memberDAO.member_view(map.get("m_email"), map.get("m_pwd"));
	      if(memberDTO!=null) {
	         session.setAttribute("memberDTO", memberDTO);
	         return "true";
	      }else {
	         return "false";
	      }
	   }
	   @RequestMapping(value="/mypage/memberModifyForm.do",method=RequestMethod.GET)
	   public ModelAndView memberModifyForm(@ModelAttribute ModelAndView mav) {
	      mav.addObject("section","/mypage/memberModifyPage.jsp");
	      mav.setViewName("/main/main");
	      return mav;
	   }
	   @RequestMapping(value="/mypage/memberModify.do",method=RequestMethod.POST)
	   public @ResponseBody String memberModify(@RequestParam Map<String,String> map) {
	      int su = memberDAO.membermodify(map);
	      if(su==1) {
	         return "true";
	      }else {
	         return "false";
	      }
	   }
	   @RequestMapping(value="/mypage/delivery.do",method=RequestMethod.GET)
	   public ModelAndView delivery(@ModelAttribute ModelAndView mav,HttpSession session) {
		  String email = (String) session.getAttribute("session_email");
		  System.out.println(email);
		  List<OrderDTO> list = orderDAO.orderList(email);
		  mav.addObject("orderList",list);
	      mav.addObject("section","/mypage/deliveryPage.jsp");
	      mav.setViewName("/main/main");
	      return mav;
	   }

}
