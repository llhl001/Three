package light.mvc.service.sys;

import java.util.List;

import light.mvc.pageModel.base.Tree;
import light.mvc.pageModel.sys.Organization;

public interface OrganizationServiceI {

	public List<Organization> treeGrid();

	public void add(Organization organization);

	public void delete(Long id);

	public void edit(Organization organization);

	public Organization get(Long id);

	public List<Tree> tree();

}
