package light.mvc.service.sys;

import java.util.List;

import light.mvc.pageModel.base.Tree;
import light.mvc.pageModel.sys.Dictionarytype;

public interface DictionarytypeServiceI {


	public void add(Dictionarytype dictionarytype);

	public void delete(Long id);

	public void edit(Dictionarytype dictionarytype);

	public Dictionarytype get(Long id);

	public List<Tree> tree();


}
