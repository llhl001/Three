package light.mvc.service.mb;

import java.util.List;

import light.mvc.pageModel.base.PageFilter;
import light.mvc.pageModel.base.Tree;
import light.mvc.pageModel.mb.Member;

public interface MemberServiceI {

	public List<Member> dataGrid(Member member, PageFilter ph);

	public Long count(Member member, PageFilter ph);

	public void add(Member member);

	public void delete(Long id);

	public void edit(Member member);

	public Member get(Long id);

	public void grant(Member member);

	public List<Tree> tree();

}
