package light.mvc.controller.sys;


import javax.servlet.http.HttpServletRequest;

import light.mvc.controller.base.BaseController;
import light.mvc.framework.constant.GlobalConstant;
import light.mvc.pageModel.base.Grid;
import light.mvc.pageModel.base.Json;
import light.mvc.pageModel.base.PageFilter;
import light.mvc.pageModel.base.SessionInfo;
import light.mvc.pageModel.sys.User;
import light.mvc.service.base.ServiceException;
import light.mvc.service.sys.DictionaryServiceI;
import light.mvc.service.sys.UserServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping("/test")
public class TestController extends BaseController {

	
	@RequestMapping("/unfinished ")
	public String unfinished(HttpServletRequest request) {
		return "/test/unfinished";
	}
	
}
