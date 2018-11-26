package detail.bean;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class DetailQnADTO {
   private int seq;
   private String id;
   private String condition;
   private String detail_QnASubject;
   private String detail_QnAContent;
   private String replyContent;
   private String reply;
   private Date logtime;
}