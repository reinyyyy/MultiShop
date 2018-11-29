package notice.dao;

import java.util.List;

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
	
	public List<NoticeDTO> noticeList() {
		return sqlSession.selectList("noticeSQL.noticeList");
	}

	public NoticeDTO noticeView(int n_number) {
		return sqlSession.selectOne("noticeSQL.noticeView", n_number);
	}
	
}
