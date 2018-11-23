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