package notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
}