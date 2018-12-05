package notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import notice.bean.NoticeDTO;
import notice.bean.QnaDTO;

@Transactional
@Component
public class NoticeDAOMybatis implements NoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private NoticeDTO noticeDTO;
	@Autowired
	private QnaDTO qnaDTO;
	/*
	public List<NoticeDTO> noticeList() {
		return sqlSession.selectList("noticeSQL.noticeList");
	}
	 */
	public List<NoticeDTO> noticeList(Map<String, Integer> map) {
		return sqlSession.selectList("noticeSQL.noticeList", map);
	}
	
	public int getNotice_TotalA() {
		return sqlSession.selectOne("noticeSQL.getNotice_TotalA");
	}
	
	public NoticeDTO noticeView(int n_number) {
		return sqlSession.selectOne("noticeSQL.noticeView", n_number);
	}

	@Override
	public List<QnaDTO> qnaList() {
		return sqlSession.selectList("noticeSQL.qnaList");
	}

}
