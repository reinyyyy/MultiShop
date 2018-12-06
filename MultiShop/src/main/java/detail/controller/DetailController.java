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
	  
	  if(session_email==null && session_email=="") {
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
      
      model.addAttribute("product_boardDTO", product_boardDTO);
      model.addAttribute("amount_list", amount_list);
      model.addAttribute("productDTO", productDTO);
      model.addAttribute("group_list", group_list);
	  model.addAttribute("detailDTO", detailDTO);
	  model.addAttribute("p_code",p_code);
      model.addAttribute("section", "/detail_page/detailPage.jsp");
      return "/main/main";
   }
   
   //재우 임시 ㅁㄴㅇ
   /*@RequestMapping(value="getDetailPage", method=RequestMethod.POST)
   public ModelAndView getDetailPage(@RequestParam int p_code, HttpSession session) {
	   
	   List<DetailDTO> detail_list = detailDAO.getDetailPageSource(p_code);
	   System.out.println(detail_list);
	   System.out.println();
	   System.out.println(detail_list.size());
	   System.out.println("-----------------");
  
	   for(int i=0; i<=detail_list.size()-1; i++) {
		   System.out.println(detail_list.get(i).getP_option1()+"\t"+" "+detail_list.get(i).getP_option2()+"\t"+detail_list.get(i).getP_amount());
	   }
	   
	   ModelAndView mav = new ModelAndView();
	   //mav.addObject("detail_list", detail_list);
	   mav.addObject("product_boardDTO", product_boardDTO);
	   mav.addObject("p_code", p_code);
	   mav.setViewName("jsonView");
	   return mav;
   }*/
   
   //재우 DB에서 재고 확인 후 살 수 있는 사이즈만 동적으로 추가 해 주는 것
   /*
   @RequestMapping(value="getSelectBox", method=RequestMethod.POST)
   public ModelAndView getSelectBox(@RequestParam String selectColor) {
	   //System.out.println("선택된 값 : "+selectColor);
	   
	   //임시
	   int p_code = 3;
	   List<DetailDTO> dtoList = detailDAO.getDetailPageSource(p_code);
	   System.out.println("dtoList = " + dtoList);
	   
	   String option1="";
	   String option2 ="";
	   String[] option2_arr = new String[dtoList.size()];
	   for(int i=0; i<dtoList.size(); i++) {
		   System.out.println(dtoList.get(i).getP_amount());
		   //System.out.println(dtoList.get(i).getP_option1()+"\t"+" "+dtoList.get(i).getP_option2());
		   option1 = (String) dtoList.get(i).getP_option1();
		   option2_arr[i] = dtoList.get(i).getP_option2()+"/"+dtoList.get(i).getP_amount();
		   System.out.println("option1===="+option1);
		   System.out.println("option2===="+option2);
		   System.out.println("**************************");
		   System.out.println("option1="+option1.split("/"));
		   String[] color_size1 = option1.split("/");
		   System.out.println(color_size1[0]);
		   System.out.println(color_size1[1]);
		   System.out.println("@@@@@@@@@");
		   
		   System.out.println("option2="+option2.split("/"));
		   String[] color_size2 = option2.split("/");
		   System.out.println(color_size2[0]);
		   System.out.println(color_size2[1]);
	   }
	   //System.out.println("for문밖 option1="+option1);
	   
	   
	   for(String data : option2_arr) {
		   System.out.println(data);
		   System.out.println("--------");
		   String option2_arrSplit[] = data.split("/");
		   
		   for(String data2 : option2_arrSplit) {
			   System.out.println("split=="+data2);
			   System.out.println("====end====");
		   }
		   
	   }
	   
	   String arr2[] = arr[0].split("/");
	   
	   for(String data2 : arr2) {
		   System.out.println(data2);
	   }
	   
	   List<String> sizeList = new ArrayList();
	   
	   if(selectColor.equals("black")) {
		   sizeList.add("S");
		   sizeList.add("M");
		   sizeList.add("L");
		   sizeList.add("XL");
	   }else if(selectColor.equals("green")) {
		   sizeList.add("XS");
		   sizeList.add("S");
		   sizeList.add("M");
	   }else if(selectColor.equals("white")) {
		   sizeList.add("L");
		   sizeList.add("XL");
	   }else if(selectColor.equals("begie")) {
		   sizeList.add("XXL");
	   }
	   //System.out.println(sizeList+"갯수=="+sizeList.size());
	   
	   ModelAndView mav = new ModelAndView();
	   mav.addObject("sizeList", sizeList);
	   mav.setViewName("jsonView");
	   return mav;
   }*/
   
   
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
          //model.addAttribute("memberDTO", memberDTO);
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
	   //cartMap.put("m_point",m_point);
	   //System.out.println(cartMap.get("count"));
	   
	   //model.addAttribute("session_email", session_email);
	   //model.addAttribute("section", "/detail_page/orderPage.jsp");
	   
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
      
      
      model.addAttribute("nomalMap", nomalMap);
     /* model.addAttribute("myMileage", m_point);
      model.addAttribute("option1", option1);
      model.addAttribute("option2", option2);
      model.addAttribute("amount", map.get("amount_input"));
      model.addAttribute("p_code", map.get("p_code"));
      model.addAttribute("p_name", map.get("p_name"));*/
      model.addAttribute("session_email", session_email);
      model.addAttribute("section", "/detail_page/orderPage.jsp");
      return "/main/main";
   }
   
   //결재화면 ajax로 불러오기
   @RequestMapping(value="getOrderPage", method=RequestMethod.POST)
   public ModelAndView getOrderPage(@RequestParam String option1,
                              @RequestParam String option2,
                              @RequestParam String amount,
                              @RequestParam String p_code, 
                              @RequestParam String productName,
                              @RequestParam int m_point,
                              HttpSession session) {
      
	  String email = (String) session.getAttribute("session_email");
	      
	  System.out.println("@@@@@@@@@@@@@@@getOrderController==시작==="+email+"@@@@@@@@@@@@"); 
	  
      //System.out.println("option1="+option1+"option2="+option2+"amount="+amount+"p_code="+p_code+"productName="+productName+"m_point="+m_point);
      
      detailDTO = detailDAO.getSelectProduct(Integer.parseInt(p_code));
      detailDTO.setP_amount(Integer.parseInt(amount));
      memberDTO = memberDAO.getZipcode(email);
      
      //System.out.println(detailDTO);
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("detailDTO", detailDTO);
      mav.setViewName("jsonView");
      
      if(email!=null&&email!="") {
    	  //다시 DB가고
          memberDTO = memberDAO.getZipcode(email);
          //System.out.println("@@memberDTO="+memberDTO+"@@@");
          mav.addObject("memberDTO", memberDTO);
      }
      
      return mav;
   }
   
   
   //전재우 결재완료
   @RequestMapping(value="orderSuccess", method=RequestMethod.POST)
   public @ResponseBody String Success(@RequestParam Map<String,String> map, HttpSession session) {
	   String email = (String) session.getAttribute("session_email");
	   System.out.println(email+"@@@@@@@@@@@@");
	   map.put("m_email", email);
	   //내 마일리지
	   int Mymileage = Integer.parseInt(map.get("myMileageHid"));
	   //마일리지를 사용할 시 val = 1 사용안하면 val = 0
	   int useMileage = Integer.parseInt(map.get("useMileage"));
	   
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
		   
		   System.out.println("성공!!!!!");
		   return "exist";
	   }else {
		   System.out.println("실패애애@");
		   return "non_exist";
	   }
	   
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