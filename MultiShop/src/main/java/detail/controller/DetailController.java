package detail.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import detail.bean.DetailDTO;
import detail.bean.DetailQnADTO;
import detail.bean.Detail_QnAPaging;
import detail.bean.Detail_hoogiPaging;
import detail.bean.DetailhoogiDTO;
import detail.dao.DetailDAO;

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
   private Detail_hoogiPaging detail_hoogiPaging;
   @Autowired
   private Detail_QnAPaging detail_QnAPaging;
   
   //상세페이지
   @RequestMapping(value="detailPage", method=RequestMethod.GET)
   public String detailPageView(@RequestParam(required=false, defaultValue="1") int detail_QnA_Pg
		   					   ,@RequestParam(required=false, defaultValue="1") int detail_hoogi_Pg
		   					   ,Model model) {
      
      //페이징처리
      int detail_QnA_endNum = detail_QnA_Pg*3;
      int detail_hoogi_endNum = detail_hoogi_Pg*3;
      int detail_QnA_startNum = detail_QnA_endNum-2;
      int detail_hoogi_startNum = detail_hoogi_endNum-2;
		
		//양현규
      List<DetailhoogiDTO> detail_hoogiList = detailDAO.detail_GetReViewList(detail_hoogi_startNum,detail_hoogi_endNum);
      List<DetailQnADTO> detail_QnAList = detailDAO.detail_GETQnAList(detail_QnA_startNum,detail_QnA_endNum);

      int totalReView = detailDAO.detail_GetTotalReView();
      detail_hoogiPaging.setCurrentPage(detail_hoogi_Pg);
      detail_hoogiPaging.setPageBlock(3);
      detail_hoogiPaging.setPageSize(3);
      detail_hoogiPaging.setTotalA(totalReView);
      detail_hoogiPaging.detail_hoogi_makePagingHTML();
		
      int tatalQnA = detailDAO.detail_GetTotalQnA();
      detail_QnAPaging.setCurrentPage(detail_QnA_Pg);
      detail_QnAPaging.setPageBlock(3);
      detail_QnAPaging.setPageSize(3);
      detail_QnAPaging.setTotalA(tatalQnA);
      detail_QnAPaging.detail_QnA_makePagingHTML();
      
      model.addAttribute("detail_QnA_Pg", detail_QnA_Pg);
      model.addAttribute("detail_hoogi_Pg", detail_hoogi_Pg);
	  model.addAttribute("detail_hoogiPaging", detail_hoogiPaging);
	  model.addAttribute("detail_QnAPaging", detail_QnAPaging);
      model.addAttribute("detail_hoogiList", detail_hoogiList);
      model.addAttribute("detail_QnAList", detail_QnAList);
      model.addAttribute("section", "/detail_page/detailPage.jsp");
      return "/main/main";
   }
   
   //결재화면
   @RequestMapping(value="orderPage", method=RequestMethod.POST)
   public String orderPage(Model model, @RequestParam(value="detail_colorSelect") String color, 
                               @RequestParam(value="detail_sizeSelect") String size, 
                               @RequestParam(value="detail_amountSelect") String amount, 
                               @RequestParam String productCode, 
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
                              @RequestParam String productName) {
      
      System.out.println("@@"+color+size+amount+productCode+productName+"@@");
      
      //DB갔다오고
      
      detailDTO.setP_color(color);
      detailDTO.setP_size(size);
      detailDTO.setP_amount(Integer.parseInt(amount));
      detailDTO.setP_code(Integer.parseInt(productCode));
      detailDTO.setP_name(productName);
      detailDTO.setP_cost(99000);
      //detailDTO.getP_cost();
      System.out.println(detailDTO);
      
      //다시 DB가고
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("detailDTO", detailDTO);
      mav.setViewName("jsonView");
      
      return mav;
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
   
}