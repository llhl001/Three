package light.mvc.service.mb;

import java.util.List;

import light.mvc.pageModel.base.Tree;
import light.mvc.pageModel.mb.Mbgroup;

public interface MbgroupServiceI {

	public List<Mbgroup> treeGrid();

	public void add(Mbgroup mbgroup);

	public void delete(Long id);

	public void edit(Mbgroup mbgroup);

	public Mbgroup get(Long id);

	public List<Tree> tree();

}
