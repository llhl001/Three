package light.mvc.controller.mb;

import java.util.List;

import javax.servlet.http.HttpSession;

import light.mvc.controller.base.BaseController;
import light.mvc.pageModel.base.Json;
import light.mvc.pageModel.base.Tree;
import light.mvc.service.base.ServiceException;
import light.mvc.service.mb.MbgroupServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/mbgroup")
public class MbgroupController extends BaseController {

	@Autowired
	private MbgroupServiceI mbgroupService;


	@RequestMapping("/tree")
	@ResponseBody
	public List<Tree> tree(HttpSession session) {
		return mbgroupService.tree();
	}


	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(Long id) {
		Json j = new Json();
		try {
			mbgroupService.delete(id);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (ServiceException e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
}
