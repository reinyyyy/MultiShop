package detail.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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

import cart.dao.CartDAO;
import category.bean.ProductDTO;
import category.bean.Product_boardDTO;
import category.dao.CategoryDAO;
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
   @Autowired
   private Product_boardDTO product_boardDTO;
   @Autowired 
   private CategoryDAO categoryDAO;
   @Autowired
   private CartDAO cartDAO;
   
   //배송번호 랜덤값 생성
   public String makeD_code() {   
       String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다. 
       uuid = uuid.substring(0, 7); //uuid를 앞에서부터 10자리 잘라줌. 
       return uuid;
    }
   
   //상세페이지
   @RequestMapping(value="detailPage", method=RequestMethod.GET)
   public String detailPageView(@RequestParam Map<String, String> map, @RequestParam int p_code, Model model, HttpSession session) {
   
    String session_email = (String) session.getAttribute("session_email");
	  System.out.println("아이디값="+session_email);
	  
	  if(session_email==null || session_email=="") {
		  model.addAttribute("session_email", null);
	  }else {
		  model.addAttribute("session_email", session_email);
	  }
	  
	  //상세페이지 본문 출력
	  product_boardDTO = detailDAO.getDetailPageInfo(p_code);
	  System.out.println("product_boardDTO="+product_boardDTO);
	  System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
 
	  //민우
	  int cateNum = Integer.parseInt(map.get("cateNum"));      // 지울예정1
      System.out.println("받아온 p_code : " + map.get("p_code"));
      ProductDTO productDTO = categoryDAO.getProduct(Integer.parseInt(map.get("p_code")));         //대표가 되는 DTO 빼내어왔음
      System.out.println("대표 상품 DTO : " + productDTO);
      System.out.println();
      System.out.println(productDTO.getP_cost());
      
      //대표상품 대표 이미지 최대 5개 나누기
      String[] image_arr = productDTO.getP_image().split("/");
      for(String data : image_arr) {
         //System.out.println("대표이미지 배열 리스트 : " + data);
      }
      
      String[] detail_image_arr = product_boardDTO.getP_image().split("/");
      
      //대표이미지 나누기 끝
      int p_group = productDTO.getP_code();                              //대표 DTO p_code로 p_group 값 사용할 예정
      List<ProductDTO> group_list = categoryDAO.getGroup(p_group);            //대표 DTO p_code 에 얽힌 모든 p_group 들 불러다 리스트에 담음
      
      
      //String[] option1_arr = new String[group_list.size()];
      /*
         같은 그룹의 옵션 이름은 모두 같기때문에 대표상품의 option의 길이만큼 for 돌게만들자
         첫 for문은 구분자 '/' 를 split 해주는 역할
      */
      if(productDTO.getP_option1() != null) {
         int option_length = productDTO.getP_option1().split("/").length;         // 구분자로 나눈 옵션1 의 길이 구함
         //System.out.println("option_length 의 길이 : " + option_length);
         
         ArrayList<ArrayList<String>> option_result_list = new ArrayList<ArrayList<String>>(); 
         
         String[] option_name = group_list.get(0).getP_option1().split("/");         // 대표로 하나만 받아와서 배열에 저장 [{중량}, {형태}]
         String[] option_val = null;
         for(int i = 0; i < option_length; i++) {         //
            ArrayList<String> option_list = new ArrayList<String>();
            option_list.add(option_name[i]);
            
            for(int j = 0; j < group_list.size(); j++) {
               option_val = group_list.get(j).getP_option2().split("/");   //j == 1각 그룹마다 하나씩의 [{1kg}, {백미}]
               option_list.add(option_val[i]);
            }
            
            for(String data : option_list) {
               //System.out.println("option_list"+i+" : " + data);
            }
            //List 를 배열로
            option_result_list.add(option_list);
         }
         model.addAttribute("option_result_list", option_result_list);
      }
      
      //System.out.println("그룹들사이즈 : " + group_list.size());
      int[] amount_list = new int[group_list.size()];
      for(int i = 0; i < group_list.size(); i++) {
         amount_list[i] = group_list.get(i).getP_amount();
      }
      //System.out.println("amount_list : " + amount_list);
      System.out.println("p_code="+p_code);
      
      model.addAttribute("detail_image_arr", detail_image_arr);
      model.addAttribute("cateNum", cateNum);
      //model.addAttribute("product_boardDTO", product_boardDTO);
      model.addAttribute("amount_list", amount_list);
      model.addAttribute("productDTO", productDTO);
      model.addAttribute("group_list", group_list);
	  model.addAttribute("detailDTO", detailDTO);
	  model.addAttribute("p_code",p_code);
      model.addAttribute("section", "/detail_page/detailPage.jsp");
      return "/main/main";
   }
   
   //장바구니결재시
   @RequestMapping(value="cartOrderPage", method=RequestMethod.POST)
   public ModelAndView cartOrderPage(Model model, @RequestParam Map<String, String> map, HttpSession session) {
	   String session_email = (String) session.getAttribute("session_email");
	   String email = session_email;
	   
	   System.out.println();
	   System.out.println("cartOrderPage.do의맵==="+map);
	   
	   ModelAndView mav = new ModelAndView();
	   
	   memberDTO = memberDAO.getZipcode(email);
	   if(email!=null&&email!="") {
    	  //다시 DB가고
          memberDTO = memberDAO.getZipcode(email);
          System.out.println("@@memberDTO="+memberDTO+"@@@");
          mav.addObject("memberDTO", memberDTO);
	   }
	   //장바구니결재시
	   Map<String, Object> cartMap = new HashMap<String, Object>();
		
	   List<Map<String,String>> list = cartDAO.cartList(email);
	   
	   for(int i=0; i<list.size(); i++) {
		   System.out.println(list.get(i));
		   System.out.println(list.get(i).get("p_image"));
		   System.out.println(list.get(i).get("p_name"));
		   //p_code같은 인트형 은 내가위에 List<Map<String,String>으로 했기때문에 출력이안되서 String.valueOf를 사용했다 (안하면오류 겁나남)
		   System.out.println(String.valueOf(list.get(i).get("p_code")));
	   }
	   cartMap.put("list", list);
	   cartMap.put("count", list.size());
	   
	   MemberDTO memberDTO2 = memberDAO.getZipcode(session_email);
	   int m_point =  memberDTO2.getM_point();
	   
	   //쿠폰 유무 확인
	   memberDTO = detailDAO.getCoupon(session_email);
	   
	   mav.addObject("cartCount", map.get("cartCount"));
	   mav.addObject("coupon", memberDTO.getM_coupon());
	   mav.addObject("m_point",m_point);
	   mav.addObject("cartMap",cartMap);
	   mav.addObject("section","/detail_page/orderPage.jsp");
	   mav.setViewName("/main/main");
	   return mav;
   }
   
   
   //바로결재 결재화면
   @RequestMapping(value="orderPage", method=RequestMethod.POST)
   public String orderPage(Model model, @RequestParam Map<String, String> map, 
                               HttpSession session) {
      
	  String option1 = map.get("option_select1");
	  String option2 = map.get("option_select2");
	  
	  String session_email = (String) session.getAttribute("session_email");
	  String email = session_email;
	  
	  
	  MemberDTO memberDTO2 = memberDAO.getZipcode(session_email);
	  int m_point =  memberDTO2.getM_point();
	  
      System.out.println();
      System.out.println("orderPage.do의맵==="+map);
      
      memberDTO = memberDAO.getZipcode(email);
      if(email!=null&&email!="") {
    	  //다시 DB가고
          memberDTO = memberDAO.getZipcode(email);
          System.out.println("@@memberDTO="+memberDTO+"@@@");
          model.addAttribute("memberDTO", memberDTO);
      }
      
      Map<String,String> nomalMap = new HashMap<String,String>();
      nomalMap.put("myMileage",String.valueOf(m_point));
      nomalMap.put("p_code",map.get("p_code"));
      nomalMap.put("p_name",map.get("p_name"));
      nomalMap.put("p_cost",map.get("p_cost"));
      nomalMap.put("p_option1",option1);
      nomalMap.put("p_option2",option2);
      nomalMap.put("p_amount",map.get("amount_input"));
      //확인하는것
      int count=0;
      if(nomalMap.get("p_code")!=null) {
    	  count=1;
      }
      nomalMap.put("count",String.valueOf(count));
      System.out.println("노말맵!!@@@=="+nomalMap);
      
      //쿠폰 유무 확인
      memberDTO = detailDAO.getCoupon(session_email);
	  
      model.addAttribute("coupon", memberDTO.getM_coupon());
      
      model.addAttribute("nomalMap", nomalMap);
      model.addAttribute("session_email", session_email);
      model.addAttribute("section", "/detail_page/orderPage.jsp");
      return "/main/main";
   }
      
   //전재우 결재완료
   @RequestMapping(value="orderSuccess", method=RequestMethod.POST)
   public @ResponseBody String Success(@RequestParam Map<String,String> map, @RequestParam String[] p_code, @RequestParam String[] p_amount,@RequestParam String[] p_cost, HttpSession session) {
	   String email = (String) session.getAttribute("session_email");
	   System.out.println(email+"@@@@@@@@@@@@");
	   map.put("m_email", email);
	   System.out.println("Mapppppp"+map);
	   //System.out.println("길이피코드"+p_code.length);
	   
	   //마일리지를 사용할 시 val = 1 사용안하면 val = 0
	   int useMileage = Integer.parseInt(map.get("useMileage"));

	   //사용자의 마일리지가 없이 시작하는 경우
	   if(map.get("myMileageHid")=="") {
		   map.put("myMileageHid", "0");
	   }
	   //내 마일리지
	   String Mymileage = map.get("myMileageHid");
	   System.out.println("마아아아이릴ㄹ"+Mymileage);
	   if(p_code.length>1 && p_code!=null) {
		   System.out.println("다중결재");
		   HashMap<String, String> multiMap = new HashMap();
		   multiMap.put("m_email", email);
		   multiMap.put("m_zipcode", map.get("m_zipcode"));
		   multiMap.put("m_roadAddress", map.get("m_roadAddress"));
		   multiMap.put("m_jibunAddress", map.get("m_jibunAddress"));
		   multiMap.put("m_point", map.get("m_point"));
		   multiMap.put("myMileageHid", Mymileage);
		   System.out.println();
		   //임의 추가
		   multiMap.put("d_code", makeD_code());//배송번호 랜덤값으로 추가
		   multiMap.put("o_status", "배송대기");// 나중에 판매자가 변경하는 것이기에 처음엔 무조건 베송대기
		   
		   for(int i=0; i<p_code.length; i++) {
			   multiMap.put("p_code",p_code[i]);
			   multiMap.put("p_amount",p_amount[i]);
			   multiMap.put("p_cost",p_cost[i]);
			   System.out.println(multiMap+"====asd");
			   if(detailDAO.getClothes(multiMap)==1) {
				   //재고 update
				   detailDAO.updateOneClothes(multiMap);
				   //orderDAO 에 추가
				   orderDAO.insertOrder(multiMap);
				   //useMileage  = orderPage에서 히든값으로 벨류를 0잡아놔서 마일리지를 사용하면 벨류값을 1으로 변경하게 한것
				   System.out.println("성공!!!!!");
			   }else {
				   return "non_exist";
			   }
		   }//for
		   
		   if(useMileage==1) {
			   //마일리지 사용
			   memberDAO.useMpoint(multiMap);
		   }
		   //마일리 적립 업데이트
		   memberDAO.update_Mpoint(multiMap);
		   //장바구니비우기
		   cartDAO.delete(email);
		   
		   return "exist";
		   
	   } else{
		   System.out.println("--단일결재--");
		   //임의 추가
		   map.put("d_code", makeD_code());//배송번호 랜덤값으로 추가
		   map.put("o_status", "배송대기");// 나중에 판매자가 변경하는 것이기에 처음엔 무조건 베송대기
		   
		   System.out.println();
		   System.out.println("맵="+map);
		   System.out.println("-------------");
		   // 다시한번 재고확인
		   if(detailDAO.getClothes(map)==1) {
			   //재고 update
			   detailDAO.updateOneClothes(map);
			   //orderDAO 에 추가
			   orderDAO.insertOrder(map);
			   //useMileage  = orderPage에서 히든값으로 벨류를 0잡아놔서 마일리지를 사용하면 벨류값을 1으로 변경하게 한것
			   if(useMileage==1) {
				   //마일리지 사용
				   memberDAO.useMpoint(map);
			   }
			   //마일리 적립 업데이트
			   memberDAO.update_Mpoint(map);
			   if(map.get("cartCount")!=null) {
				   //장바구니비우기
				   cartDAO.delete(email);
			   }
			   System.out.println("성공!!!!!");
			   
			   
			   
			   return "exist";
		   }else {
			   System.out.println("실패애애@");
			   return "non_exist";
		   }
		   
	   }//단일 주문시 
	   
	   
	   
   }
   
   //현규형 쿠폰 
   @RequestMapping(value="couponDelete", method=RequestMethod.POST)
   public @ResponseBody void couponDelete (HttpSession session) {
      String email = (String) session.getAttribute("session_email");
      detailDAO.couponDelete(email);
   }
   
   //양현규--------------------
   
 //후기 테이블 보여지게 하는 코드
   @RequestMapping(value="detail_hoogiPage", method=RequestMethod.GET)
   public ModelAndView detail_hoogiPage(/*@RequestParam int p_code*/) {
	   int p_code = 1;
	   List<DetailhoogiDTO> detail_hoogiTableList = detailDAO.detail_GetReViewTableList(p_code);
	   ModelAndView modelAndView = new ModelAndView("jsonView","data",detail_hoogiTableList);
	   
	   return modelAndView;
   }
   //Q&A 테이블 보여지게 하는 코드
   @RequestMapping(value="detail_QnAPage", method=RequestMethod.GET)
   public ModelAndView detail_QnAPage(/*@RequestParam int p_code*/) {
	   int p_code = 1;
	   List<DetailQnADTO> detail_QnATableList = detailDAO.detail_GetQnATableList(p_code);
	   ModelAndView modelAndView = new ModelAndView("jsonView","data",detail_QnATableList);
	   
	   return modelAndView;
   }
   //후기 작성시 저장
   @RequestMapping(value="detail_hoogi", method=RequestMethod.POST)
   public ModelAndView detail_hoogiModal(@RequestParam Map<String,String> map) {
      ModelAndView modelAndView = new ModelAndView();
      detailDAO.detail_userReview(map);
      
      modelAndView.setViewName("/detail_page/detailPage");
      
      return modelAndView;
   }
   //Q&A 작성시 저장
   @RequestMapping(value="detail_QnA", method=RequestMethod.POST)
   public ModelAndView detail_QnA(@RequestParam Map<String,String> map) {
      ModelAndView modelAndView = new ModelAndView();
      detailDAO.detail_userQnA(map);
      
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