package notice.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import notice.bean.NoticeDTO;

@Transactional
@Component
public class NoticeDAOMybatis implements NoticeDAO {
   @Autowired
   private SqlSession sqlSession;
   @Autowired
   private NoticeDTO noticeDTO;
   
}