package light.mvc.service.sys;

import java.util.List;

import light.mvc.pageModel.base.PageFilter;
import light.mvc.pageModel.base.SessionInfo;
import light.mvc.pageModel.sys.User;

public interface UserServiceI {

	public List<User> dataGrid(User user, PageFilter ph);

	public Long count(User user, PageFilter ph);

	public void add(User user);

	public void delete(Long id);

	public void edit(User user);

	public User get(Long id);

	public User login(User user);

	public List<String> resourceList(Long id);

	public boolean editUserPwd(SessionInfo sessionInfo, String oldPwd, String pwd);

	public User getByLoginName(User user);

}
