package detail.bean;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class DetailhoogiDTO {
	private int p_code;
	private int seq;
	private String id;
	private String detail_hoogiStar;
	private String detail_hoogiModalContent;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date logtime;
}