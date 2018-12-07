package member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;

@Transactional
@Component
public interface MemberDAO {
	public int member_signup(MemberDTO memberDTO);
	
	public MemberDTO member_view(String m_email,String m_pwd);

	public String idCheck(String email);
	
	public int membermodify(Map<String,String> map);
	   
	public MemberDTO findEmail(Map<String,String> map);
	   
	public MemberDTO findPwd(Map<String,String> map);
	   
	public int findPwd2(Map<String,String> map);
	//재우 추가  cause - orderPage에서 주소불러오기 위해  , 마일리지도 이걸로 불러오자
	public MemberDTO getZipcode(String email);
	//마일리지 적립 업데이트문
	public void update_Mpoint(Map<String,String> map);
	
	public void useMpoint(Map<String,String> map);

	public void updateCoupon(String coupon, String m_email);

	public List<MemberDTO> selectCoupon(String m_email);

	
}
