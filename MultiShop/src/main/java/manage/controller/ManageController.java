package manage.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import category.bean.ProductDTO;
import category.bean.Product_boardDTO;
import detail.bean.DetailQnADTO;
import manage.bean.InquiryDTO;
import manage.dao.ManageDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;
import mypage.bean.OrderDTO;
import notice.bean.NoticeDTO;

@Controller
@RequestMapping("/manage")
public class ManageController {
	
	private static final String UPLOAD_PATH = "C:\\Users\\Jonghun\\git\\MultiShop\\MultiShop\\src\\main\\webapp\\upload";
	
	@Autowired
	private ManageDAO manageDAO;
	@Autowired
	private MemberDTO memberDTO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private InquiryDTO inquiryDTO;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		int delivery_wait = manageDAO.orderTableCount("배송대기");
		int delivery_ing = manageDAO.orderTableCount("배송중");
		int delivery_complete = manageDAO.orderTableCount("배송완료");
		mav.addObject("delivery_wait", delivery_wait);
		mav.addObject("delivery_ing", delivery_ing);
		mav.addObject("delivery_complete",delivery_complete);
		mav.addObject("totalSales", manageDAO.totalSales());
		mav.addObject("display", "/manage/main2.jsp");
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
	@RequestMapping(value="orderManageTotal2", method=RequestMethod.GET)
	public ModelAndView orderManageTotal2() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/manage/orderManageTotal2.jsp");
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
		
		mav.addObject("display", "/manage/memberTotal2.jsp");
		mav.setViewName("/main/adminIndex");
		return mav;
	}
	//회원 목록 데이터테이블
	@RequestMapping(value="/getMembersList",method=RequestMethod.GET)
	public ModelAndView getMembersList() {
		List<MemberDTO> getMembersList = manageDAO.getMembersList();
		ModelAndView mav = new ModelAndView("jsonView","data",getMembersList);
		
		return mav;
	}
	//Q&A 목록 데이터테이블
	@RequestMapping(value="/getQnAReadyList", method=RequestMethod.GET)
	public ModelAndView getQnAReadyList() {
		List<DetailQnADTO> getQnAReadyList = manageDAO.getQnAReadyList();
		ModelAndView mav = new ModelAndView("jsonView","data",getQnAReadyList);
		
		return mav;
	}
	
	@RequestMapping(value="productListsJson", method=RequestMethod.POST)
	public ModelAndView productListsJson(@RequestParam Map<String, String> map) {
		
		List<ProductDTO> list = manageDAO.getProductListsJson(map);
		System.out.println(list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	 @RequestMapping(value = "add", method=RequestMethod.POST)
	   public ModelAndView add(@RequestParam("img[]") List<MultipartFile> list,
	                     @RequestParam("img_detail[]") List<MultipartFile> detail_list,
	                     //@ModelAttribute ProductDTO productDTO,
	                     @RequestParam Map<String, String> map,
	                     @RequestParam(value="p_option1[]") String[] p_option1_list,
	                     @RequestParam(value="p_option2[]", required=false) String[] p_option2_list,
	                     @RequestParam(value="p_amount[]", required=false) String p_amount,      //재고  옵션선택 x
	                     @RequestParam(value="p_amount[]_list", required=false) String[] p_amount_list,    //재고 옵션선택 o 
	                     @RequestParam(value="p_contents") String p_contents){                  //jsp의 name 속성이름과 Product_DTO , Product_boardDTO 의 이름이 동일해야함..
	      System.out.println("옵션 x " + p_amount);
	      System.out.println("옵션 o " + p_amount_list);
	      
	      System.out.println(p_option1_list.length);
	      int seq = 0;
	      
	      seq = manageDAO.getSeq() + 1;
	      
	      for(int i = 0; i < p_option1_list.length; i++) {
	         System.out.println(p_option1_list[i]);
	         //System.out.println(p_option2_list[i]);
	         //System.out.println(p_amount_list[i]);
	      }
	      
	      
	      
	      System.out.println(list.size());
	      //11.30 이미지 저장 있떤자리
	      String p_image = "";
	      int index = 1;
	      for(MultipartFile img : list) {
	         System.out.println("img : " + img.isEmpty());
	         System.out.println(img.getName());
	         if(!img.isEmpty()) {
	            String fullName = img.getOriginalFilename();   //확장자를 포함한 파일의 진짜이름
	            String temp_name = "/"+seq+"_"+index;             //1_1 , 1_2 식으로 만듦
	            String save_name = temp_name + fullName.substring(fullName.length()-4, fullName.length());      //1_1에  확장자를 더함
	            
	            System.out.println(temp_name);
	            
	            p_image += "/"+seq+"_"+index+fullName.substring(fullName.length()-4, fullName.length());      //DB에 들어갈 이름 구함
	             
	            index++;
	            
	            System.out.println("대표 이미지 파일 이름 : " + p_image);
	            File file = new File(UPLOAD_PATH, save_name);
	            try {
	               FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
	            } catch (IOException e) {
	               e.printStackTrace();
	            }
	         }
	      }
	      
	      int cnt = 0;
	      int i = 0 ;
	      do {
	         ProductDTO productDTO = new ProductDTO();
	         productDTO.setP_cateNum(Integer.parseInt(map.get("p_cateNum")));
	         productDTO.setP_midCate(map.get("p_midCate"));
	         productDTO.setP_smallCate(map.get("p_smallCate"));
	         productDTO.setP_name(map.get("p_name"));
	         
	         if(p_option1_list.length == 0 || p_option2_list.length == 0) {         //option 선택안한경우   
	        	 productDTO.setP_option1("");
	        	 productDTO.setP_option2("");
	        	 productDTO.setP_amount(Integer.parseInt(p_amount));
	         }else {                              //option 선택한경우
	        	 productDTO.setP_option1(p_option1_list[i]);
	        	 productDTO.setP_option2(p_option2_list[i]);
	        	 productDTO.setP_amount(Integer.parseInt(p_amount_list[i]));
	         }
	         
	         productDTO.setP_cost(Integer.parseInt(map.get("p_cost")));
	         productDTO.setP_status(map.get("p_status"));
	         productDTO.setP_maker(map.get("p_maker"));
	         productDTO.setP_origin(map.get("p_origin"));
	         
	         System.out.println(p_image);
	         productDTO.setP_image(p_image);
	         if(cnt == 0) {
	            productDTO.setP_group(0);
	         }else {
	            productDTO.setP_group(seq);
	         }
	         
	         manageDAO.productInsert(productDTO); //dao묶음 풀기
	         
	         if(cnt == 0) {   //첫행때 p_code 가지고옴
	            seq = manageDAO.getSeq(); 
	            cnt++;
	         }
	         
	         System.out.println("들렸다감");
	         System.out.println("ProductDTO : " + productDTO);
	         i++;
	      }while(p_option1_list.length > i);
	         
	      //PRODUCT 에 저장완료
	      
	      //방금넣은거 꺼내오기
	      //List<Integer> p_group_list = manageDAO.getProduct(map.get("p_name"));      //p_name을 기준으로 셀렉트는 여러개가잇을것임 가져오는것은 p_gruop
	      //int p_code = p_group_list.get(0); //dao묶음 풀기
	      
	      //PRODUCT_BOARD 저장시작
	      p_image = "";
	      index = 10;
	      for(MultipartFile img : detail_list) {
	         System.out.println(img.getName());
	         if(!img.isEmpty()) {
	            String fullName = img.getOriginalFilename();   //확장자를 포함한 파일의 진짜이름
	            String temp_name = "/"+seq+"_"+index;             //1_1 , 1_2 식으로 만듦
	            String save_name = temp_name + fullName.substring(fullName.length()-4, fullName.length());      //1_1에  확장자를 더함
	            
	            System.out.println(temp_name);
	            
	            p_image += "/"+seq+"_"+index+fullName.substring(fullName.length()-4, fullName.length());      //DB에 들어갈 이름 구함
	             
	            index++;
	            
	            System.out.println("상세 이미지 파일 이름 : " + p_image);
	            File file = new File(UPLOAD_PATH, save_name);
	            try {
	               FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
	            } catch (IOException e) {
	               e.printStackTrace();
	            }
	         }
	      }
	      
	      Product_boardDTO product_boardDTO = new Product_boardDTO();
	      product_boardDTO.setP_cateNum(Integer.parseInt(map.get("p_cateNum")));
	      product_boardDTO.setP_code(seq); //dao묶음 풀기
	      product_boardDTO.setP_contents(p_contents);
	      product_boardDTO.setP_name(map.get("p_name"));
	      product_boardDTO.setP_COST(Integer.parseInt(map.get("p_cost")));
	      product_boardDTO.setP_image(p_image);
	      //sysdate
	      
	      int p_code = product_boardDTO.getP_code();
	      
	      System.out.println();
	      System.out.println("Product_boardDTO : " + product_boardDTO);
	      
	      System.out.println("--------");
	      System.out.println("p_contents : " + p_contents);
	      System.out.println("--------");
	      
	      //DB 접근
	      manageDAO.product_boardInsert(product_boardDTO);
	      System.out.println(product_boardDTO);
	      //PRODUCT_BOARD 저장완료
	      String[] detail_image = p_image.split("/");
	      
	      //MAV 시작
	      ModelAndView mav = new ModelAndView();
	     // mav.addObject("detail_image", detail_image);
	      //mav.addObject("display", "/manage/test.jsp");
	      mav.setViewName("redirect:/manage/productAdd.do");
	      return mav;
	   }
	
	//주문관리페이지
	@RequestMapping(value="orderManagePage", method=RequestMethod.GET)
	public ModelAndView orderManagePage(@ModelAttribute ModelAndView mav) {
		mav.addObject("display", "/manage/orderManagePage.jsp");
		mav.setViewName("/main/adminIndex");
		return mav;
	}
	//오더리스트 json 받기
	@RequestMapping(value="orderList", method=RequestMethod.POST)
	public ModelAndView orderList() {
		List<OrderDTO> list = manageDAO.orderList();
		ModelAndView mav = new ModelAndView("jsonView","data",list);
		return mav;
	}
	//오더리스트 상품상태 변경
	@RequestMapping(value="orderStatusUpdate", method=RequestMethod.POST)
	public @ResponseBody int orderStatusUpdate(int o_num,String o_status) {
		return manageDAO.orderStatusUpdate(o_num, o_status);
	}
	//1:1문의페이지
		@RequestMapping(value="inquiryPage", method=RequestMethod.GET)
		public ModelAndView inquiryPage(@ModelAttribute ModelAndView mav) {
			mav.addObject("display", "/manage/inquiryPage.jsp");
			mav.setViewName("/main/adminIndex");
			return mav;
		}
	//1:1문의 json 받기
	@RequestMapping(value="inquiryList", method=RequestMethod.POST)
	public ModelAndView inquiryList() {
		List<InquiryDTO> list = manageDAO.inquiryList();
		ModelAndView mav = new ModelAndView("jsonView","data",list);
		return mav;
	}
	//1:1문의 답변상태 변경
	@RequestMapping(value="inquiryUpdate", method=RequestMethod.POST)
	public @ResponseBody int inquiryUpdate(int i_seq,String i_inquiry) {
		return manageDAO.inquiryUpdate(i_seq, i_inquiry);
	}
	//공지사항페이지
	@RequestMapping(value="noticePage", method=RequestMethod.GET)
	public ModelAndView noticePage(@ModelAttribute ModelAndView mav) {
		mav.addObject("display", "/manage/noticeManage.jsp");
		mav.setViewName("/main/adminIndex");
		return mav;
	}
	
	//공지사항 json 받기
	@RequestMapping(value="noticeList", method=RequestMethod.POST)
	public ModelAndView noticeList() {
		List<NoticeDTO> list = manageDAO.noticeList();
		ModelAndView mav = new ModelAndView("jsonView","data",list);
		return mav;
	}
	//공지사항 쓰기
	@RequestMapping(value="noticeInsert", method=RequestMethod.POST)
	public @ResponseBody int noticeInsert(@RequestParam Map<String,String> map) {
		return manageDAO.noticeInsert(map);
	}
	
	//고객관리페이지
	@RequestMapping(value="memberManagePage", method=RequestMethod.GET)
	public ModelAndView memberManagePage(@ModelAttribute ModelAndView mav) {
		mav.addObject("display", "/manage/memberManagePage.jsp");
		mav.setViewName("/main/adminIndex");
		return mav;
	}
	//고객관리 json 받기
	@RequestMapping(value="memberList", method=RequestMethod.POST)
	public ModelAndView memberList() {
		List<MemberDTO> list = manageDAO.memberList();
		ModelAndView mav = new ModelAndView("jsonView","data",list);
		return mav;
	}
	//상품문의페이지
	@RequestMapping(value="productQnaPage", method=RequestMethod.GET)
	public ModelAndView productQnaPage(@ModelAttribute ModelAndView mav) {
		mav.addObject("display", "/manage/productQnaPage.jsp");
		mav.setViewName("/main/adminIndex");
		return mav;
	}
	//상품문의 json 받기
		@RequestMapping(value="productQnaList", method=RequestMethod.POST)
		public ModelAndView productQnaList() {
			List<DetailQnADTO> list = manageDAO.productQnaList();
			ModelAndView mav = new ModelAndView("jsonView","data",list);
			return mav;
		}
	//상품문의 답변달기
	@RequestMapping(value="productQnaUpdate", method=RequestMethod.POST)
	public @ResponseBody int productQnaUpdate(@RequestParam Map<String,String> map) {
		return manageDAO.productQnaUpdate(map);
	}
	//답변하기 위해 정보 빼내옴
   @RequestMapping(value="productQnaAnswerList",method=RequestMethod.POST)
   public ModelAndView productQnaAnswerList(@RequestParam int p_code,@RequestParam int seq) {
      ModelAndView mav = new ModelAndView();
      List<DetailQnADTO> getDetail_AnswerList = manageDAO.productQnaAnswerList(p_code,seq);
      mav.addObject("getDetail_AnswerList", getDetail_AnswerList);
      mav.addObject("display", "/manage/memberTotal2.jsp");
      mav.setViewName("jsonView");
      return mav;
   }
   
   //제품관리페이지
 	@RequestMapping(value="productManagePage", method=RequestMethod.GET)
 	public ModelAndView productManagePage(@ModelAttribute ModelAndView mav) {
 		mav.addObject("display", "/manage/productManagePage.jsp");
 		mav.setViewName("/main/adminIndex");
 		return mav;
 	}
   //제품관리 리스트
   @RequestMapping(value="productManageList", method=RequestMethod.POST)
   public ModelAndView productManageList() {
      List<ProductDTO> list = manageDAO.productManageList();
      ModelAndView mav = new ModelAndView("jsonView","data",list);
      return mav;
   }
   @RequestMapping(value="productModifyJson", method=RequestMethod.POST)
   public @ResponseBody void productModifyJson(@RequestParam Map<String, String> map) {
      manageDAO.productModifyJson(map);
   }
   
   @RequestMapping(value="productDeleteJson", method=RequestMethod.POST)
   public @ResponseBody void productDeleteJson(@RequestParam Map<String, String> map) {
      manageDAO.productDeleteJson(map);
   }
  
   
}
