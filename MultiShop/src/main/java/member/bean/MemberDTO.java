
package member.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberDTO {
	private String m_name;
	private String m_email;
	private String m_pwd;
	private String m_tel_phone;
	private String m_zipcode;
	private String m_roadAddress;
	private String m_jibunAddress;
	private int m_point;
	private Date m_date;
}
