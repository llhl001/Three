package light.mvc.service.mb.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import light.mvc.dao.BaseDaoI;
import light.mvc.model.mb.Tmember;
import light.mvc.pageModel.base.PageFilter;
import light.mvc.pageModel.base.Tree;
import light.mvc.pageModel.mb.Member;
import light.mvc.service.mb.MemberServiceI;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberServiceI {

	@Autowired
	private BaseDaoI<Tmember> memberDao;

	@Override
	public void add(Member r) {
		Tmember t = new Tmember();
		memberDao.save(t);
	}

	@Override
	public void delete(Long id) {
		Tmember t = memberDao.get(Tmember.class, id);
		memberDao.delete(t);
	}

	@Override
	public void edit(Member r) {
		Tmember t = memberDao.get(Tmember.class, r.getId());
		memberDao.update(t);
	}

	@Override
	public Member get(Long id) {
		Tmember t = memberDao.get(Tmember.class, id);
		Member r = new Member();
		r.setId(t.getId());
		return r;
	}

	@Override
	public List<Member> dataGrid(Member member, PageFilter ph) {
		List<Member> ul = new ArrayList<Member>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Tmember t ";
		List<Tmember> l = memberDao.find(hql + whereHql(member, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());
		for (Tmember t : l) {
			Member u = new Member();
			BeanUtils.copyProperties(t, u);
			ul.add(u);
		}
		return ul;
	}

	@Override
	public Long count(Member member, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Tmember t ";
		return memberDao.count(
				"select count(*) " + hql + whereHql(member, params), params);
	}

	private String whereHql(Member member, Map<String, Object> params) {
		String hql = "";
		if (member != null) {
			hql += " where 1=1 ";
		}
		return hql;
	}

	private String orderHql(PageFilter ph) {
		String orderString = "";
		if ((ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}

	@Override
	public void grant(Member member) {
		Tmember t = memberDao.get(Tmember.class, member.getId());
	}

	@Override
	public List<Tree> tree() {
		List<Tmember> l = null;
		List<Tree> lt = new ArrayList<Tree>();

		l = memberDao.find("select distinct t from Tmember t order by t.seq");

		if ((l != null) && (l.size() > 0)) {
			for (Tmember r : l) {
				Tree tree = new Tree();
				tree.setId(r.getId().toString());
				lt.add(tree);
			}
		}
		return lt;
	}
}
