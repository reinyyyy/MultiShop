
package notice.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import notice.bean.NoticeDTO;
import notice.dao.NoticeDAO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private NoticeDTO noticeDTO;
	
	@RequestMapping(value="/notice/notice.do", method=RequestMethod.GET)
	public ModelAndView notice() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("section","/notice/notice.jsp");
		mav.setViewName("/main/main");
		return mav;
	}
	
	@RequestMapping(value="/notice/noticeList.do", method=RequestMethod.POST)
	public ModelAndView noticeList() {
		List<NoticeDTO> list = noticeDAO.noticeList();
		ModelAndView mav = new ModelAndView("jsonView","list",list);
		return mav;
	}
	
	@RequestMapping(value="/notice/noticeView.do", method=RequestMethod.GET)
	public ModelAndView noticeView(
			@ModelAttribute ModelAndView mav, 
			HttpServletRequest request, 
			HttpSession session){
		int n_number = Integer.parseInt(request.getParameter("n_number"));
		NoticeDTO noticeDTO = noticeDAO.noticeView(n_number);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		mav.addObject("noticeDate", sdf.format(noticeDTO.getN_date()));
		mav.addObject("noticeDTO",noticeDTO);
		mav.addObject("section", "/notice/noticeView.jsp");
		mav.setViewName("/main/main");
		return mav;
	}
}
