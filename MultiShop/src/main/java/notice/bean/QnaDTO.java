package notice.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class QnaDTO {
	private int q_number;
	private String q_subject;
	private String q_content;
	private Date q_date;
}
