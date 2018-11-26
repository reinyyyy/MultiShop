<<<<<<< HEAD
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
=======
package manage.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import category.bean.ProductDTO;
import manage.dao.ManageDAO;

@Controller
@RequestMapping("/manage")
public class ManageController {
	
	private static final String UPLOAD_PATH = "C:\\Users\\minggul\\Desktop\\1111MultiShop\\MultiShop\\src\\upload";
	
	@Autowired
	private ManageDAO manageDAO;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/manage/main.jsp");
		mav.setViewName("/section/adminIndex");
		return mav;
	}
	
	@RequestMapping(value="productAdd", method=RequestMethod.GET)
	public ModelAndView productAdd() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/manage/productAdd.jsp");
		mav.setViewName("/section/adminIndex");
		return mav;
	}
	
	@RequestMapping(value="productLists", method=RequestMethod.GET)
	public ModelAndView productLists() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/manage/productLists.jsp");
		mav.setViewName("/section/adminIndex");
		return mav;
	}
	
	@RequestMapping(value="orderManageTotal", method=RequestMethod.GET)
	public ModelAndView orderManageTotal() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/manage/orderManageTotal.jsp");
		mav.setViewName("/section/adminIndex");
		return mav;
	}
	
	@RequestMapping(value="orderSimpleTotal", method=RequestMethod.GET)
	public ModelAndView orderSimpleTotal() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/manage/orderSimpleTotal.jsp");
		mav.setViewName("/section/adminIndex");
		return mav;
	}
	
	@RequestMapping(value="memberTotal", method=RequestMethod.GET)
	public ModelAndView memberTotal() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/manage/memberTotal.jsp");
		mav.setViewName("/section/adminIndex");
		return mav;
	}
	
	//제품 등록 및 판매 등록 요청
	/*
	 * 
	 * 															제품 등록 
			카테고리 코드 	: prd_cate1
			중분류			: prd_cate2
			소뷴류			: prd_cate3
			
			상품코드		: product_seq.nextval
			상품그룹		: product_seq.currval						상품그룹을 판매글 쓸 때 한번에 받자
			상품명			: prd_name
			옵션1			: 
			옵션2			: 
				
			수량			: prd_stock				
			가격			: prd_price
			
			판매상태		: prd_display
			제조사			: prd_maker
		 	원산지			: prd_origin
			대표이미지		: prd_image
			
			제품등록일		: sysdate
	
	*/
	
	
	/*
																판매 등록
															
			카테고리코드	: prd_cate1
			상품이름		: prd_name
			상품코드		: product_seq.currval
			상세내용		: p_contents
			
			
	*/
	/*
	private String p_cateNum;   
    private String p_midCate;   
    private String p_smallCate; 
    private int p_code;      
    private int p_group;     
    private String p_name;      
    private String p_option1;   
    private String p_option2;   
    private int p_amount;    
    private int p_cost;      
    private String p_status;    
    private String p_maker;     
    private String p_origin;
    private String p_image;
    */
	@RequestMapping(value = "add", method=RequestMethod.POST)
	public ModelAndView add(@RequestParam("img[]") List<MultipartFile> list,
							@ModelAttribute ProductDTO productDTO) {						//jsp의 name 속성이름과 Product_DTO , Product_boardDTO 의 이름이 동일해야함..
		
		String p_image = "";
		for(MultipartFile img : list) {
			System.out.println(img.getName());
			String fileName = img.getOriginalFilename();
			p_image += "/"+fileName;
			
			System.out.println("파일 이름 : " + fileName);
			File file = new File(UPLOAD_PATH, fileName);
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			//imageboardDTO.setImage1(fileName);
			//DB
			//imageboardDAO.imageboardWrite(imageboardDTO);
		}
		System.out.println(p_image);
		productDTO.setP_image(p_image);
		productDTO.setP_group(productDTO.getP_code());
		manageDAO.productInsert(productDTO);
		System.out.println("들렸다감");
		System.out.println("ProductDTO : " + productDTO);
		ModelAndView mav = new ModelAndView();
		
		
		
		
		/*@RequestMapping(value="imageboardWrite", method=RequestMethod.POST)
		public String imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
									  @RequestParam("img[]") List<MultipartFile> list,
									  Model model) {
			
			String filePath = "D:\\Spring\\workspace\\SpringProject\\src\\main\\webapp\\storage";  
			
			for(MultipartFile img : list) {
				String fileName = img.getOriginalFilename();
				File file = new File(filePath, fileName);
				
				try {
					FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				imageboardDTO.setImage1(fileName);
				
				//DB
				imageboardDAO.imageboardWrite(imageboardDTO);
			
			}//for
			
			model.addAttribute("display","/imageboard/imageboardList.jsp");
			return "/main/index";
		}*/
		
		
		
		
		return mav;
	}
	
}
>>>>>>> refs/remotes/origin/minu
