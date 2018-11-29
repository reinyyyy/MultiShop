package detail.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import detail.bean.DetailDTO;
import detail.bean.DetailQnADTO;
import detail.bean.DetailhoogiDTO;
import detail.dao.DetailDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;
import mypage.dao.OrderDAO;

@RequestMapping(value="/detail_page")
@Controller
@Component
public class DetailController {
   @Autowired
   private DetailDTO detailDTO;
   @Autowired
   private DetailhoogiDTO detailhoogiDTO;
   @Autowired
   private DetailQnADTO detailQnADTO;
   @Autowired
   private DetailDAO detailDAO;
   @Autowired
   private MemberDTO memberDTO;
   @Autowired
   private MemberDAO memberDAO;
   @Autowired
   private OrderDAO orderDAO;
   
   //상세페이지
   @RequestMapping(value="detailPage", method=RequestMethod.GET)
   public String detailPageView(/*@RequestParam int p_code,*/Model model) {
 
	  /*model.addAllAttributes("p_code",p_code);*/
      model.addAttribute("section", "/detail_page/detailPage.jsp");
      return "/main/main";
   }
   
   //결재화면
   @RequestMapping(value="orderPage", method=RequestMethod.POST)
   public String orderPage(Model model, @RequestParam(value="detail_colorSelect") String color, 
                               @RequestParam(value="detail_sizeSelect") String size, 
                               @RequestParam(value="detail_amountSelect") String amount, 
                               @RequestParam int productCode, 
                               @RequestParam String productName) {
      
      model.addAttribute("color", color);
      model.addAttribute("size", size);
      model.addAttribute("amount", amount);
      model.addAttribute("productCode", productCode);
      model.addAttribute("productName", productName);
      model.addAttribute("section", "/detail_page/orderPage.jsp");
      return "/main/main";
   }
   
   //결재화면 ajax로 불러오기
   @RequestMapping(value="getOrderPage", method=RequestMethod.POST)
   public ModelAndView getOrderPage(@RequestParam String color,
                              @RequestParam String size,
                              @RequestParam String amount,
                              @RequestParam String productCode, 
                              @RequestParam String productName, HttpSession session) {
      
	  String email = (String) session.getAttribute("session_email");
	      
	  System.out.println(email+"@@@@@@@@@@@@"); 
	  
      System.out.println("@@"+color+size+amount+productCode+productName+"@@");
      
      
      detailDTO.setP_option1(color);
      detailDTO.setP_option2(size);
      detailDTO.setP_amount(Integer.parseInt(amount));
      detailDTO.setP_code(Integer.parseInt(productCode));
      detailDTO.setP_name(productName);
      detailDTO.setP_cost(99000);
      //detailDTO.getP_cost();
      
      System.out.println(detailDTO);
      
      //다시 DB가고
      memberDTO = memberDAO.getZipcode(email);
      System.out.println("@@"+memberDTO+"@@@");
      ModelAndView mav = new ModelAndView();
      mav.addObject("detailDTO", detailDTO);
      mav.addObject("memberDTO", memberDTO);
      mav.setViewName("jsonView");
      
      return mav;
   }
   
   //전재우 결재완료
   @RequestMapping(value="orderOk", method=RequestMethod.POST)
   public @ResponseBody String orderOk(@RequestParam Map<String,String> map, HttpSession session) {
	   
	   String email = (String) session.getAttribute("session_email");
	      
	   System.out.println(email+"@@@@@@@@@@@@");
	   map.put("m_email", email);
	   
	   //임의로 추가 한 것
	   map.put("d_code", "임의배송번호");//나중에 seq로 바꿔서 하자!!
	   map.put("o_status", "배송준비중");// 나중에 판매자가 변경하는 것이기에 처음엔 무조건 배송준비중으로 한 것
	   System.out.println(map);
	   //재고확인 dao
	   if(detailDAO.getClothes(map)==1) {
		   System.out.println("성공크!");
		   //재고 update
		   detailDAO.updateOneClothes(map);
		   //orderDAO 에 추가
		   orderDAO.insertOrder(map);
		   
		   return "exist";
	   }else {
		   System.out.println("실패애애@");
		   return "non_exist";
	   }
	   
   }
   
   //양현규--------------------
   
   @RequestMapping(value="detail_hoogi", method=RequestMethod.POST)
   public ModelAndView detail_hoogiModal(DetailhoogiDTO detailhoogiDTO) {
      ModelAndView modelAndView = new ModelAndView();
      detailDAO.detail_userReview(detailhoogiDTO);
      
      modelAndView.setViewName("/detail_page/detailPage");
      
      return modelAndView;
   }
   
   @RequestMapping(value="detail_QnA", method=RequestMethod.POST)
   public ModelAndView detail_QnA(DetailQnADTO detailQnADTO) {
      ModelAndView modelAndView = new ModelAndView();
      detailDAO.detail_userQnA(detailQnADTO);
      
      modelAndView.setViewName("/detail_page/detailPage");
      return modelAndView;
   }
   
   @RequestMapping(value="detail_QnAView", method=RequestMethod.POST)
   public ModelAndView detail_QnAView (@RequestParam int seq) {
      ModelAndView modelAndView = new ModelAndView();
      DetailQnADTO detailQnADTO = detailDAO.detail_GetQnAViewList(seq);
      
      modelAndView.addObject("detailQnADTO",detailQnADTO);
      modelAndView.setViewName("jsonView");
      
      return modelAndView;
   }
   @RequestMapping(value="detail_QnA_Answer", method=RequestMethod.POST)
   public ModelAndView detail_QnA_Answer (@RequestParam String seq,
		   								  @RequestParam String replyContent,
		   								  @RequestParam String reply) {
	   ModelAndView modelAndView = new ModelAndView();
	   Map<String,String> map = new HashMap<String,String>();
	   map.put("seq", seq);
	   map.put("replyContent", replyContent);
	   map.put("reply", reply);
	   detailDAO.detail_QnA_Answer(map);
	   
	   modelAndView.addObject("section", "/detail_page/detailPage.jsp");
	   modelAndView.setViewName("/main/main");
	   return modelAndView;
   }
   @RequestMapping(value="detail_QnA_List", method=RequestMethod.POST)
   public ModelAndView detail_QnA_List (@RequestParam int seq) {
	   ModelAndView modelAndView = new ModelAndView();
	   List<DetailQnADTO> detail_QnA_List = detailDAO.detail_QnA_List(seq);
	   
	   modelAndView.addObject("detail_QnA_List", detail_QnA_List);
	   modelAndView.addObject("section", "/detail_page/detailPage.jsp");
	   modelAndView.setViewName("jsonView");
	   return modelAndView;
   }
   
   //후기 테이블 보여지게 하는 코드
   @RequestMapping(value="detail_hoogiPage", method=RequestMethod.GET)
   public ModelAndView detail_hoogiPage(/*@RequestParam int p_code*/) {
	   int p_code = 1;
	   List<DetailhoogiDTO> detail_hoogiTableList = detailDAO.detail_GetReViewTableList(p_code);
	   ModelAndView modelAndView = new ModelAndView("jsonView","data",detail_hoogiTableList);
	   
	   return modelAndView;
   }
   
   @RequestMapping(value="detail_QnAPage", method=RequestMethod.GET)
   public ModelAndView detail_QnAPage(/*@RequestParam int p_code*/) {
	   int p_code = 1;
	   List<DetailQnADTO> detail_QnATableList = detailDAO.detail_GetQnATableList(p_code);
	   ModelAndView modelAndView = new ModelAndView("jsonView","data",detail_QnATableList);
	   
	   return modelAndView;
   }
   
   
}