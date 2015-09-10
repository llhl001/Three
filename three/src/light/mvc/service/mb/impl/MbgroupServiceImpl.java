package light.mvc.service.mb.impl;

import java.util.ArrayList;
import java.util.List;

import light.mvc.dao.BaseDaoI;
import light.mvc.model.mb.Tmbgroup;
import light.mvc.model.sys.Tuser;
import light.mvc.pageModel.base.Tree;
import light.mvc.pageModel.mb.Mbgroup;
import light.mvc.service.base.ServiceException;
import light.mvc.service.mb.MbgroupServiceI;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MbgroupServiceImpl implements MbgroupServiceI {
	
	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Autowired
	private BaseDaoI<Tmbgroup> mbgroupDao;

	@Override
	public List<Mbgroup> treeGrid() {
		List<Mbgroup> lr = new ArrayList<Mbgroup>();
		List<Tmbgroup> l = mbgroupDao
				.find("from Tmbgroup t left join fetch t.mbgroup  order by t.seq");
		if ((l != null) && (l.size() > 0)) {
			for (Tmbgroup t : l) {
				Mbgroup r = new Mbgroup();
				BeanUtils.copyProperties(t, r);
				lr.add(r);
			}
		}
		return lr;
	}

	@Override
	public void add(Mbgroup org) {
		Tmbgroup t = new Tmbgroup();
		BeanUtils.copyProperties(org, t);
		mbgroupDao.save(t);
	}

	@Override
	public void delete(Long id) {
		Tmbgroup t = mbgroupDao.get(Tmbgroup.class, id);
		del(t);
	}

	private void del(Tmbgroup t) {
		List<Tuser> list = userDao.find("from Tuser t left join t.mbgroup org where org.id="+t.getId());
		if(list!=null&&list.size()>0){
			throw new ServiceException("该部门已经被用户使用");
		}else{
			mbgroupDao.delete(t);
		}
	}

	@Override
	public void edit(Mbgroup r) {
		Tmbgroup t = mbgroupDao.get(Tmbgroup.class, r.getId());
		mbgroupDao.update(t);
	}

	@Override
	public Mbgroup get(Long id) {
		Tmbgroup t = mbgroupDao.get(Tmbgroup.class, id);
		Mbgroup r = new Mbgroup();
		BeanUtils.copyProperties(t, r);
		return r;
	}

	@Override
	public List<Tree> tree() {
		List<Tmbgroup> l = null;
		List<Tree> lt = new ArrayList<Tree>();

		l = mbgroupDao.find("select distinct t from Tmbgroup t order by t.seq");

		if ((l != null) && (l.size() > 0)) {
			for (Tmbgroup r : l) {
				Tree tree = new Tree();
				tree.setId(r.getId().toString());
				lt.add(tree);
			}
		}
		return lt;
	}

}
