package notice.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import notice.bean.NoticePaging;
import notice.bean.QnaDTO;
import notice.dao.NoticeDAO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private NoticeDTO noticeDTO;
	@Autowired
	private QnaDTO qnaDTO;
	@Autowired
	private NoticePaging noticePaging;
	
	@RequestMapping(value="/notice/notice.do", method=RequestMethod.GET)
	public ModelAndView notice(@RequestParam(name="pg",defaultValue="1") String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("section","/notice/notice.jsp");
		mav.setViewName("/main/main");
		return mav;
	}
	//각 카테고리 전체 리스트 하나로 됨, 구분자 cateNum
	@RequestMapping(value="/notice/noticeList.do", method=RequestMethod.POST)
	public ModelAndView noticeList(@RequestParam(name="pg") String pg) {
		// list_num 에 따라서 12개씩~ 현재는 5개씩보여주는 상태임
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		System.out.println("리스트 생성 pg : " + pg + " endNum = " + endNum + " startNum = " + startNum);
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<NoticeDTO> list = noticeDAO.noticeList(map);
		int totalA = noticeDAO.getNotice_TotalA();
		noticePaging.setCurrentPage(Integer.parseInt(pg));
		noticePaging.setPageBlock(3);
		noticePaging.setPageSize(5);
		noticePaging.setTotalA(totalA);
		noticePaging.makePagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("noticePaging", noticePaging.getPagingHTML());	//div 속에 넣어줘야함
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/notice/noticeView.do", method=RequestMethod.GET)
	public ModelAndView noticeView(
			@ModelAttribute ModelAndView mav, 
			HttpServletRequest request, 
			HttpSession session,
			@RequestParam(name="pg") String pg){
		System.out.println(pg);
		int n_number = Integer.parseInt(request.getParameter("n_number"));
		NoticeDTO noticeDTO = noticeDAO.noticeView(n_number);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		mav.addObject("pg",pg);
		mav.addObject("noticeDate", sdf.format(noticeDTO.getN_date()));
		mav.addObject("noticeDTO",noticeDTO);
		mav.addObject("section", "/notice/noticeView.jsp");
		mav.setViewName("/main/main");
		return mav;
	}
	
	//qna
	@RequestMapping(value="/qna/qna.do", method=RequestMethod.GET)
	public ModelAndView qna() {
		ModelAndView mav = new ModelAndView();
		List<QnaDTO> list = noticeDAO.qnaList();
		mav.addObject("qnalist",list);
		System.out.println(list);
		mav.addObject("section","/qna/qna.jsp");
		mav.setViewName("/main/main");
		return mav;
	}
}