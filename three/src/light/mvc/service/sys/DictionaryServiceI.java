package light.mvc.service.sys;

import java.util.List;

import light.mvc.pageModel.base.PageFilter;
import light.mvc.pageModel.sys.Dictionary;

public interface DictionaryServiceI {

	public List<Dictionary> dataGrid(Dictionary dictionary, PageFilter ph);

	public Long count(Dictionary dictionary, PageFilter ph);

	public void add(Dictionary dictionary);

	public void delete(Long id);

	public void edit(Dictionary dictionary);

	public Dictionary get(Long id);

	public List<Dictionary> combox(String code);

	public Dictionary checkUnique(Dictionary dictionary);

}
