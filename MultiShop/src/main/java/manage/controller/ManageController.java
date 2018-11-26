package manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/manage")
public class ManageController {
	@RequestMapping(value="addForm", method=RequestMethod.GET)
	public String addForm(Model model) {
		model.addAttribute("section", "/manage/addForm.jsp");
		return "/main/main";
	}
}
	