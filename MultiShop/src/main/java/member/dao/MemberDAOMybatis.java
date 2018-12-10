package member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;
@Transactional
@Component
public class MemberDAOMybatis implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MemberDTO memberDTO;
	
	public int member_signup(MemberDTO memberDTO) {
		return sqlSession.insert("memberSQL.member_signup", memberDTO);
	}

	public MemberDTO member_view(String m_email,String m_pwd) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("m_email",m_email);
		map.put("m_pwd",m_pwd);
		return sqlSession.selectOne("memberSQL.member_view", map);
	}
	
	public String idCheck(String email) {
		memberDTO = sqlSession.selectOne("memberSQL.member_idCheck",email);
		if(memberDTO==null) {
			return "false";
		}
		else {
			return "true";
		}
	}
	public MemberDTO findEmail(Map<String,String> map) {
	      return sqlSession.selectOne("memberSQL.member_findEmail", map);
	}

	public MemberDTO findPwd(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.member_findPwd", map);
	}

	public int findPwd2(Map<String,String> map) {
		return sqlSession.update("memberSQL.member_findPwd2", map);
	}
	
	public int membermodify(Map<String,String> map) {
		    return sqlSession.update("memberSQL.member_modify", map);
	}

	public MemberDTO getZipcode(String email) {
		return sqlSession.selectOne("memberSQL.member_getZipcode",email);
	}
	
	public void update_Mpoint(Map<String,String> map) {
		 sqlSession.update("memberSQL.update_Mpoint",map);
	}

	@Override
	public void useMpoint(Map<String, String> map) {
		sqlSession.update("memberSQL.useMpoint",map);
	}

	@Override
	public void updateCoupon(String coupon, String m_email) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("coupon", coupon);
		map.put("m_email", m_email);
		sqlSession.update("memberSQL.insertCoupon",map);
	}

	@Override
	public List<MemberDTO> selectCoupon(String m_email) {
		
		return sqlSession.selectList("memberSQL.selectCoupon",m_email);
	}
	
	@Override
	   public int memberWithdrawl(String m_email) {
	      sqlSession.delete("memberSQL.inquiryDelete", m_email);
	      sqlSession.delete("memberSQL.orderDelete", m_email);
	      return sqlSession.delete("memberSQL.memberWithdrawl", m_email);
	   }

}
