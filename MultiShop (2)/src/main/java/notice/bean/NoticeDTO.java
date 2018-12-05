package notice.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class NoticeDTO {
	private int n_number; //글번호
	private String n_subject; //제목
	private String n_content; //내용
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date n_date;
}
