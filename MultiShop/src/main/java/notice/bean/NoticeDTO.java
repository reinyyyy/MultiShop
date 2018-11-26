<<<<<<< HEAD
package notice.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class NoticeDTO {
	private int n_number; //글번호
	private String n_subject; //제목
	private String n_content; //내용
	private Date n_date;
}
=======
package notice.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class NoticeDTO {
   private int seq; //글번호
   private String subject; //제목
   private String content; //내용
   private Date logtime;
}
>>>>>>> refs/remotes/origin/minu
