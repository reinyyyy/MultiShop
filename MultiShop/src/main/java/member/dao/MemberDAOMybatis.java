package member.dao;

import java.util.HashMap;
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
}
