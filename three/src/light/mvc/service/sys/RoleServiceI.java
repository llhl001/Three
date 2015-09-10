package light.mvc.service.sys;

import java.util.List;

import light.mvc.pageModel.base.PageFilter;
import light.mvc.pageModel.base.Tree;
import light.mvc.pageModel.sys.Role;

public interface RoleServiceI {

	public List<Role> dataGrid(Role role, PageFilter ph);

	public Long count(Role role, PageFilter ph);

	public void add(Role role);

	public void delete(Long id);

	public void edit(Role role);

	public Role get(Long id);

	public void grant(Role role);

	public List<Tree> tree();

}
