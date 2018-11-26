<<<<<<< HEAD
package notice.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import notice.bean.NoticeDTO;

@Transactional
@Component
public interface NoticeDAO {

	public List<NoticeDTO> noticeList();

	public NoticeDTO noticeView(int n_number);

}
=======
package notice.dao;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Component
public interface NoticeDAO {

}
>>>>>>> refs/remotes/origin/minu
