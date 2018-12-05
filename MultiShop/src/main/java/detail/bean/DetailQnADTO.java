package detail.bean;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class DetailQnADTO {
	private int p_code;
	private int seq;
	private String id;
	private String condition;
	private String detail_QnASubject;
	private String detail_QnAContent;
	private String replyContent;
	private String reply;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date logtime;
}