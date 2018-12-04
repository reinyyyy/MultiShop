package manage.dao;

import java.util.List;
import java.util.Map;

import category.bean.ProductDTO;
import category.bean.Product_boardDTO;
import detail.bean.DetailQnADTO;
import manage.bean.InquiryDTO;
import member.bean.MemberDTO;
import mypage.bean.OrderDTO;
import notice.bean.NoticeDTO;

public interface ManageDAO {

	List<ProductDTO> getProductListsJson(Map<String, String> map);
	
	//상품 등록
	public void productInsert(ProductDTO productDTO);

	//상품 글등록
	public void product_boardInsert(Product_boardDTO product_boardDTO);

	//상품 하나 뺴오기 (ManageController 에서 사용) 기준은 p_group 으로 잡고 꺼내옴
	public List<Integer> getProduct(String p_name);

	//현재 시퀀스값 조회
	public int getSeq();
	
	//주문리스트
	public List<OrderDTO> orderList();
	
	//주문상태변경
	public int orderStatusUpdate(int o_num,String o_status);
	
	//1:1리스트
	public List<InquiryDTO> inquiryList();

	//1:1답변변경
	public int inquiryUpdate(int i_seq,String i_inquiry);

	//1:1리스트
	public List<NoticeDTO> noticeList();
	
	//1:1답변변경
	public int noticeInsert(Map<String,String> map);
	
	//오더테이블 배송상태별 카운트값
	public int orderTableCount(String status);
	
	//총판매액
	public String totalSales();
	
	//멤버리스트
	public List<MemberDTO> memberList();
	
	//상품후기리스트
	public List<DetailQnADTO> productQnaList();
	
	//상품후기 답변달기
	public int productQnaUpdate(Map<String,String> map);
	
	//질문뿌려주기
	public List<DetailQnADTO> productQnaAnswerList(int p_code, int seq);
	
	public List<ProductDTO> productManageList();
	
	public void productModifyJson(Map<String, String> map);

	public void productDeleteJson(Map<String, String> map);
	
}
