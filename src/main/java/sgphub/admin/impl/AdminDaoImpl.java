package sgphub.admin.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;
import sgphub.admin.dao.IAdminDao;
import sgphub.commons.entity.*;


@Repository("adminDao")
public class AdminDaoImpl implements IAdminDao {
	SessionFactory sessionFactory;
	
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void Login(Admin admin) {
		// TODO Auto-generated method stub
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Post> selectScrollPost(int statusId) {
		// TODO Auto-generated method stub
		String hql="from Post p where p.postStatus.id=:statusId";
		return sessionFactory.getCurrentSession().createQuery(hql).setInteger("statusId", statusId).list();
	}

	@Override
	public void modifyScrollPost(Post post) {
		// TODO Auto-generated method stub
		post.getPostStatus().setId(1);
		sessionFactory.getCurrentSession().update(post);
	}

	@Override
	public void saveScrollPost(Post post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<FocusTopic> selectPostServicer(int statusId) {
		// TODO Auto-generated method stub
		Query query=sessionFactory.getCurrentSession().createQuery("from FocusTopic f where f.topicPermession.id=:id").setParameter("id", statusId);
		
		List<FocusTopic> lists=query.list();
		
		
		return lists;
	}

	


	@Override
	public void modifyPostServicer(FocusTopic focusTopic) {
		// TODO Auto-generated method stub
		
		sessionFactory.getCurrentSession().update(focusTopic);
		
	}

	@Override
	public void savePostServicer(FocusTopic focusTopic) {
		// TODO Auto-generated method stub	
		sessionFactory.getCurrentSession().update(focusTopic);
		
	}

	@Override
	public void saveAction(Action action) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<AdminOperateHistory> selectAdminOperateHistories(Integer pageNow) {
		@SuppressWarnings({ "unchecked" })
		List<AdminOperateHistory> adminOperateHistories = sessionFactory.getCurrentSession()
				.createCriteria(AdminOperateHistory.class)
				//1 0-9 2 10-19
				.setFirstResult(pageNow*5-5)
				.setMaxResults(5)
				.addOrder(Order.desc("operateTime"))
				.list();
		return adminOperateHistories;
	}

	@Override
	public List<ServicerOperateHistory> servicerOperateHistories() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Admin selectAdminByName(String name) {
		// TODO Auto-generated method stub
		Admin a = (Admin) sessionFactory.getCurrentSession().createQuery(" from Admin a where a.name=:name")
				.setString("name", name).uniqueResult();
		return a;
	}


	@Override
	public Post queryPostById(int id) {
		// TODO Auto-generated method stub
		Post post = (Post)sessionFactory.getCurrentSession().createQuery("from Post where id=:id").setInteger("id", id).uniqueResult();
		return post;
	}

	@Override
	public void updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(admin);
		
	}


	@Override
	public void upScrollPost(Post post) {
		// TODO Auto-generated method stub
		post.getPostStatus().setId(5);
		//post.setImgURL(imgURL);
		sessionFactory.getCurrentSession().saveOrUpdate(post);
	}
	@Override
	public List<ParentTopic> queryParentTopic() {
		// TODO Auto-generated method stub
		Query query=sessionFactory.getCurrentSession().createQuery("from ParentTopic");
		List<ParentTopic> lists=query.list();
		return lists;
	}

	@Override
	public User selectById(int id) {
		// TODO Auto-generated method stub
		Query query=sessionFactory.getCurrentSession().createQuery("from User u where u.id=:id").setParameter("id", id);
		
		return (User)query.uniqueResult();
	}


	@Override
	public ParentTopic selectByParentId(int id) {
		// TODO Auto-generated method stub
		Query query=sessionFactory.getCurrentSession().createQuery("from ParentTopic p where p.id=:id").setParameter("id", id);
		return (ParentTopic)query.uniqueResult();
	}

	@Override
	public TopicPermession selectPermissionById(int id) {
		// TODO Auto-generated method stub
		Query query=sessionFactory.getCurrentSession().createQuery("from TopicPermession t where t.id=:id").setParameter("id", id);
		return (TopicPermession)query.uniqueResult();
	}

	@Override
	public void insertAction(Action action) {
		// 添加活动
		sessionFactory.getCurrentSession().saveOrUpdate(action);
	}

	@Override
	public List<Action> selectAction() {
		// id降序查询所有活动
		List<Action> actions = sessionFactory.getCurrentSession().createQuery("from Action order by id desc ").list();
		return actions;
	}

	@Override
	public List<Action> selectActionByStatus() {
		// 查询进行中的活动
		List<Action> actions = sessionFactory.getCurrentSession().createQuery(" from Action a where a.actionStatus = 1 ").list();
		return actions;
	}
	@Override
	public List<Action> selectClosedAction() {
		// 查询进行中的活动
		List<Action> actions = sessionFactory.getCurrentSession().createQuery(" from Action a where a.actionStatus = 2 order by a.creatTime desc ").list();
		return actions;
	}
	@Override
	public Action selectActionById(Integer id) {
		//根据活动ID查询活动
		Action action = (Action) sessionFactory.getCurrentSession().createQuery(" from Action a where a.id=:id")
				.setInteger("id", id).uniqueResult();
		
		return action;
	}

	@Override
	public void deleteActionById(Integer id) {
		//根据ID删除活动
		sessionFactory.getCurrentSession().delete(this.selectActionById(id));
	}

	@Override
	public int selectAdminOperateHistoriesPage() {
		// TODO Auto-generated method stub
		@SuppressWarnings({ "unchecked" })
		List<AdminOperateHistory> adminOperateHistoriesSize = sessionFactory.getCurrentSession().createCriteria(AdminOperateHistory.class).list();
		if(adminOperateHistoriesSize.size()%5==0){
			return  adminOperateHistoriesSize.size()/5;
		}else{
			return  adminOperateHistoriesSize.size()/5+1;
		}
	}

	@Override
	public FocusTopic queryFocusTopicById(Integer id) {
		// TODO Auto-generated method stub
		return (FocusTopic) this.sessionFactory.getCurrentSession().get(FocusTopic.class, id);
	}

	@Override
	public FocusTopic selectFocusTopicByUserAndParentTopic(Integer id,
			Integer id2) {
		String hql = "from FocusTopic ft where ft.user.id=:userid and ft.parentTopic.id=:parentid";	
		return (FocusTopic) this.sessionFactory.getCurrentSession().createQuery(hql)
				.setInteger("userid", id)
				.setInteger("parentid", id2)
				.uniqueResult();
	}


	
	

}
