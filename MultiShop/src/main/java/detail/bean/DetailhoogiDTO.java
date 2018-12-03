
package detail.bean;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class DetailhoogiDTO {
	private int p_code;
	private int seq;
	private String id;
	private String detail_hoogiStar;
	private String detail_hoogiModalContent;
	private Date logtime;
}