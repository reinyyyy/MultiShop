package manage.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class InquiryDTO {
	private int i_seq;
	private String m_email;
	private String i_title;
	private String i_content;
	private String i_inquiry;
}


