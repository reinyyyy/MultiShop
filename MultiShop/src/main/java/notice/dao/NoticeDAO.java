package notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import notice.bean.NoticeDTO;
import notice.bean.QnaDTO;

@Transactional
@Component
public interface NoticeDAO {

	/*public List<NoticeDTO> noticeList();*/

	public List<NoticeDTO> noticeList(Map<String, Integer> map);

	public int getNotice_TotalA();

	public NoticeDTO noticeView(int n_number);

	public List<QnaDTO> qnaList();

}