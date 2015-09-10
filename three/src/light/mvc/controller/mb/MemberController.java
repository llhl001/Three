package light.mvc.controller.mb;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import light.mvc.controller.base.BaseController;
import light.mvc.framework.constant.GlobalConstant;
import light.mvc.pageModel.base.Grid;
import light.mvc.pageModel.base.Json;
import light.mvc.pageModel.base.PageFilter;
import light.mvc.pageModel.base.Tree;
import light.mvc.pageModel.mb.Member;
import light.mvc.service.mb.MemberServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping("/member")
public class MemberController extends BaseController {

	@Autowired
	private MemberServiceI memberService;

	
	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/mb/member";
	}
	
	
	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(Member member, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(memberService.dataGrid(member, ph));
		grid.setTotal(memberService.count(member, ph));
		return grid;
	}
	
	@RequestMapping("/tree")
	@ResponseBody
	public List<Tree> tree() {
		return memberService.tree();
	}
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		//request.setAttribute("sexList", GlobalConstant.sexlist);
		return "/mb/memberAdd";
	}
	@RequestMapping("/add")
	@ResponseBody
	public Json add(Member member) {
		Json j = new Json();
		memberService.add(member);
		j.setSuccess(true);
		j.setMsg("添加成功！");
		return j;
	}
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(Long id) {
		Json j = new Json();
		memberService.delete(id);
		j.setMsg("删除成功！");
		j.setSuccess(true);
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public Member get(Long id)  {
		return memberService.get(id);
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(Member member) {
		Json j = new Json();
		memberService.edit(member);
		j.setSuccess(true);
		j.setMsg("编辑成功！");
		return j;
	}

	@RequestMapping("/grant")
	@ResponseBody
	public Json grant(Member member) {
		Json j = new Json();
		memberService.grant(member);
		j.setMsg("授权成功！");
		j.setSuccess(true);
		return j;
	}

}
