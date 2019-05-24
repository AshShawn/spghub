package sgphub.user.data.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import sgphub.commons.entity.*;
import sgphub.user.data.dao.IUserDao;


@Repository("userDao")
public class UserDaoImpl implements IUserDao {

	SessionFactory sessionFactory;

	@Resource(name = "sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;

	}

	@Override
	public Account selectAccountByAccountname(String account) {
		Account account2 = (Account) this.sessionFactory.getCurrentSession()
				.createQuery("from Account a where a.account=:account")
				.setString("account", account).uniqueResult();
		return account2;
	}

	@Override
	public User selectUserByAccount(Account accountObj) {

		return (User) this.sessionFactory.getCurrentSession().get(User.class,
				accountObj.getId());
	}

	@Override
	public List<Reply> queryUserHomeReplyByName(String username, int page) {
		String hql = "from Reply r where r.post.user.username=:username";
		@SuppressWarnings({ "unchecked" })
		List<Reply> list = sessionFactory.getCurrentSession().createQuery(hql)
				.setString("username", username)
				// 1 0-9 2 10-19
				.setFirstResult(page * 3 - 3).setMaxResults(3).list();
		return list;
	}

	@Override
	public void addAccount(Account account) {
		this.sessionFactory.getCurrentSession().save(account);

	}

	@Override
	public void addUser(Account account) {
		User user = new User();
		user.setAccount(account);
		user.setCreateDate(new Date());
		user.setReplyCount(0);
		user.setPostCount(0);
		user.setFocusUserCount(0);
		user.setFocusPostCount(0);
		user.setFansCount(0);
		user.setCheckCount(0);
		this.sessionFactory.getCurrentSession().save(user);

	}

	@Override
	public void addRealUser(User user) {

		this.sessionFactory.getCurrentSession().update(user);
	}

	@Override
	public List<FocusPost> selectPostByUserId(int id) {
		// TODO Auto-generated method stub
		Query query = this.sessionFactory
				.getCurrentSession()
				.createQuery(
						"from FocusPost where user.id=:id order by id desc")
				.setParameter("id", id);
		query.setMaxResults(3);
		List<FocusPost> lists = query.list();
		return lists;
	}

	@Override
	public List<FocusTopic> selectTopicByUserId(int id) {
		// TODO Auto-generated method stub
		Query query = this.sessionFactory
				.getCurrentSession()
				.createQuery(
						"from FocusTopic where user.id=:id order by id desc")
				.setParameter("id", id);
		query.setMaxResults(3);
		List<FocusTopic> lists = query.list();
		return lists;
	}

	@Override
	public List<FocusUser> selectFocusUserById(int id) {
		// TODO Auto-generated method stub
		Query query = this.sessionFactory
				.getCurrentSession()
				.createQuery(
						"from FocusUser where user.id=:id order by id desc")
				.setParameter("id", id);
		query.setMaxResults(3);
		List<FocusUser> lists = query.list();
		return lists;
	}

	@Override
	public List<FocusUser> selectFocusMeUserById(int id) {
		// TODO Auto-generated method stub
		Query query = this.sessionFactory
				.getCurrentSession()
				.createQuery(
						"from FocusUser where focusUser.id=:id order by id desc")
				.setParameter("id", id);
		query.setMaxResults(3);
		List<FocusUser> lists = query.list();
		return lists;
	}

	@Override
	public User selectUserById(int id) {

		Query query = this.sessionFactory.getCurrentSession()
				.createQuery("from User where id=:id").setParameter("id", id);
		User user = (User) query.uniqueResult();
		return user;
	}

	@Override
	public List<CollectPost> queryUHCollectPostByName(String username, int page) {
		String hql = "from CollectPost cp where cp.user.username=:username";
		@SuppressWarnings({ "unchecked" })
		List<CollectPost> list = sessionFactory.getCurrentSession()
				.createQuery(hql).setString("username", username)
				.setFirstResult(page * 8 - 8).setMaxResults(8).list();
		return list;
	}

	@Override
	public List<FocusUser> queryUHFriendsByName(String username, int page) {
		String hql = "from FocusUser f where f.user.username=:username order by id desc";
		@SuppressWarnings({ "unchecked" })
		List<FocusUser> list = sessionFactory.getCurrentSession()
				.createQuery(hql).setString("username", username)
				.setFirstResult(page * 4 - 4).setMaxResults(4).list();
		return list;
	}

	@Override
	public List<Post> queryHotPost() {
		Date now = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String hql = "from Post p where 1=1 " + " and '" + format1.format(now)
				+ "'-p.lastReplyTime<1" + " and p.replyCount>=20 "
				+ " and p.checkCount>=100 order by rand()";
		return sessionFactory.getCurrentSession().createQuery(hql)
				.setMaxResults(2).list();
	}

	@Override
	public List<Post> queryNewPost(User user) {
		Date now = new Date();
		String sql = "select* from Post where parentTopicID in "
				+ "(select parentTopicID from FocusTopic ft where ft.parentTopicID in "
				+ "(select parentTopicID from FocusTopic where ft.userID='"
				+ user.getId() + "')) " + " and '" + now + "'-lastReplyTime<1"
				+ " and replyCount>=5 " + " and checkCount>=20 "
				+ "ORDER BY RAND()";
		return sessionFactory.getCurrentSession().createSQLQuery(sql)
				.addEntity(Post.class).setMaxResults(2).list();
	}

	@Override
	public List<Post> queryNewPost() {
		Date now = new Date();
		String sql = "select* from Post where " + "'" + now
				+ "'-lastReplyTime<1" + " and replyCount>=5 "
				+ " and checkCount>=20 " + "ORDER BY RAND()";
		return sessionFactory.getCurrentSession().createSQLQuery(sql)
				.addEntity(Post.class).setMaxResults(2).list();
	}

	@Override
	public List<Post> queryLike(User user) {
		Date now = new Date();
		String sql = "select* from Post where parentTopicID in "
				+ "(select parentTopicID from FocusTopic ft where ft.parentTopicID in "
				+ "(select parentTopicID from FocusTopic where ft.userID='"
				+ user.getId() + "')) " + " and '" + now + "'-lastReplyTime<5"
				+ " and replyCount>=40 " + " and checkCount>=200 "
				+ "ORDER BY RAND()";
		return sessionFactory.getCurrentSession().createSQLQuery(sql)
				.addEntity(Post.class).setMaxResults(2).list();
	}

	@Override
	public List<Post> queryLike() {
		Date now = new Date();
		String sql = "select* from Post where " + "'" + now
				+ "'-lastReplyTime<5" + " and replyCount>40 "
				+ " and checkCount>=200 " + "ORDER BY RAND()";
		return sessionFactory.getCurrentSession().createSQLQuery(sql)
				.addEntity(Post.class).setMaxResults(2).list();
	}

	@Override
	public void updateUserCheckCount(User user) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().update(user);

	}

	/**
	 * @Arirelia
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<ParentTopic> selectParentTopics() {
		return sessionFactory.getCurrentSession()
				.createCriteria(ParentTopic.class).list();
	}

	@Override
	public Post selectPostById(int id) {
		Query query = this.sessionFactory.getCurrentSession()
				.createQuery("from Post where id=:id").setParameter("id", id);
		Post post = (Post) query.uniqueResult();
		return post;
	}

	@Override
	public void addFocusUser(FocusUser fu) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().save(fu);
	}

	@Override
	public int queryCount(int userId, int focusUserId) {
		// TODO Auto-generated method stub
		String sql = "SELECT count(*) FROM focususer WHERE userID=:userId AND focusUserID=:focusUserId";
		Query query = this.sessionFactory.getCurrentSession()
				.createSQLQuery(sql).setParameter("userId", userId)
				.setParameter("focusUserId", focusUserId);
		List<Object> list = query.list();
		int count = 0;
		if (null != list && list.size() > 0) {
			count = Integer.parseInt(list.get(0).toString());
		}
		return count;
	}

	@Override
	public void cancelFocusUser(FocusUser fu) {
		// TODO Auto-generated method stub

		Query query = this.sessionFactory
				.getCurrentSession()
				.createQuery(
						"from FocusUser where focusUser.id=:a and user.id=:b")
				.setParameter("a", fu.getFocusUser().getId())
				.setParameter("b", fu.getUser().getId());
		fu = (FocusUser) query.uniqueResult();
		this.sessionFactory.getCurrentSession().delete(fu);

	}

	@Override
	public ParentTopic selectParentTopicById(Integer ptid) {

		return (ParentTopic) this.sessionFactory.getCurrentSession().get(
				ParentTopic.class, ptid);
	}

	@Override
	public List<Reply> selectReplyByPostId(int id) {
		String hql = "from Reply r where r.post.id=:id";

		return sessionFactory.getCurrentSession().createQuery(hql)
				.setInteger("id", id).list();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> pjhGoodUsers(Integer id) {

		return this.sessionFactory
				.getCurrentSession()
				.createQuery(
						"from FocusTopic ft where ft.parentTopic.id=:id and ft.topicPermession.id=2")
				.setInteger("id", id).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Post> pjhUpPosts(Integer id) {
		// TODO Auto-generated method stub
		return this.sessionFactory.getCurrentSession()
				.createCriteria(Post.class)
				.add(Restrictions.eq("postStatus.id", 3))
				.add(Restrictions.eq("parentTopic.id", id)).list();
	}

	@Override
	public Integer pjhAllPostsCount(Integer id) {
		// TODO Auto-generated method stub
		return this.sessionFactory.getCurrentSession()
				.createCriteria(Post.class)
				.add(Restrictions.eq("parentTopic.id", id)).list().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Post> pjhOrdinaryPosts(Integer id) {
		// TODO Auto-generated method stub
		return this.sessionFactory.getCurrentSession()
				.createCriteria(Post.class)
				.add(Restrictions.eq("postStatus.id", 1))
				.add(Restrictions.eq("parentTopic.id", id))
				.addOrder(Order.desc("lastReplyTime")).list();
	}

	@Override
	public FocusTopic pjhGoPt(Integer id, Integer id2) {

		// TODO Auto-generated method stub
		return (FocusTopic) this.sessionFactory.getCurrentSession()
				.createCriteria(FocusTopic.class)
				.add(Restrictions.eq("user.id", id))
				.add(Restrictions.eq("parentTopic.id", id2)).uniqueResult();
	}

	@Override
	public List<ChildReply> selectChildReplyByReplyId(int id) {
		String hql = "from ChildReply c where c.reply.id=:id";
		return sessionFactory.getCurrentSession().createQuery(hql)
				.setInteger("id", id).list();
	}

	@Override
	public void insertPost(Post post) {

		this.sessionFactory.getCurrentSession().save(post);

	}

	@Override
	public void insertReply(Reply reply) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(reply);
	}

	@Override
	public void updatePost(Post post) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(post);

	}

	@Override
	public void updateFocusTopic(FocusTopic focusTopic) {
		this.sessionFactory.getCurrentSession().update(focusTopic);

	}

	@Override
	public void updateUserMessage(User user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(user);
		sessionFactory.getCurrentSession().update(user.getAccount());
	}

	@Override
	public User queryUserByUserId(int id) {
		String hql = "from User u where u.id=:id";
		return (User) sessionFactory.getCurrentSession().createQuery(hql)
				.setInteger("id", id).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Post> pjhScrollPosts() {

		return this.sessionFactory.getCurrentSession()
				.createCriteria(Post.class)
				.add(Restrictions.eq("postStatus.id", 5)).list();
	}

	@Override
	public FocusTopic selectFocusTopic(int ptopicid, int userid) {
		// String hql =" from FocusTopic  f where f.user.id";
		return (FocusTopic) this.sessionFactory.getCurrentSession()
				.createCriteria(FocusTopic.class)
				.add(Restrictions.eq("user.id", userid))
				.add(Restrictions.eq("parentTopic.id", ptopicid))
				.uniqueResult();
	}

	@Override
	public List<FocusPost> queryUserHomeFocusByName(String username, int page) {
		String hql = "from FocusPost fp where fp.user.username=:username order by fp.id desc";
		@SuppressWarnings({ "unchecked" })
		List<FocusPost> list = sessionFactory.getCurrentSession()
				.createQuery(hql).setString("username", username)
				.setFirstResult(page * 8 - 8).setMaxResults(8).list();
		return list;
	}

	@Override
	public void insertCheckPost(CheckPost checkPost) {
		@SuppressWarnings({ "unchecked" })
		List<CheckPost> checkPosts = this.sessionFactory.getCurrentSession()
				.createCriteria(CheckPost.class)
				.add(Restrictions.eq("user.id", checkPost.getUser().getId()))
				.addOrder(Order.desc("checkTime")).list();
		if (checkPosts.size() == 20) {
			checkPost.setId(checkPosts.get(19).getId());
			this.sessionFactory.getCurrentSession().update(checkPost);
		} else {
			this.sessionFactory.getCurrentSession().save(checkPost);
		}

	}

	@Override
	public void updateParentTopic(ParentTopic parentTopic) {
		this.sessionFactory.getCurrentSession().update(parentTopic);

	 }

  @Override
  public int serviceQueryUserCount(ParentTopic parentTopic) {
    return this.sessionFactory.getCurrentSession()
          .createCriteria(FocusTopic.class)
          .add(Restrictions.eq("parentTopic", parentTopic))
          .add(Restrictions.eq("topicPermession.id", 1))
          .list().size();
  }




	@Override
	public void insertCollectPost(CollectPost collectpost) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(collectpost);
	}

  @Override
  public int serviceQueryBigCount(ParentTopic parentTopic) {
    // TODO Auto-generated method stub
    return this.sessionFactory.getCurrentSession()
        .createCriteria(FocusTopic.class)
        .add(Restrictions.eq("parentTopic", parentTopic))
        .add(Restrictions.eq("topicPermession.id", 4))
        .list().size();
  }

  @Override
  public int serviceQuerySmallCount(ParentTopic parentTopic) {
    // TODO Auto-generated method stub
    return this.sessionFactory.getCurrentSession()
        .createCriteria(FocusTopic.class)
        .add(Restrictions.eq("parentTopic", parentTopic))
        .add(Restrictions.eq("topicPermession.id", 3))
        .list().size();
  }

  @Override
  public int serviceQueryGoodCount(ParentTopic parentTopic) {
    
    return this.sessionFactory.getCurrentSession()
        .createCriteria(FocusTopic.class)
        .add(Restrictions.eq("parentTopic", parentTopic))
        .add(Restrictions.eq("topicPermession.id", 2))
        .list().size();
  }

  @Override
  public List<ServicerOperateHistory> serviceQueryBlackUser(ParentTopic parentTopic) {
    String hql = "from ServicerOperateHistory s where s.focusTopic.parentTopic=:pt and s.focusTopic.topicPermession.id=5";
    return this.sessionFactory.getCurrentSession()
        .createQuery(hql)
        /*.setInteger("id", parentTopic.getId())*/
        .setEntity("pt", parentTopic)
        .list();
  }

  @Override
  public List<ServicerOperateHistory> serviceQueryTeam(ParentTopic parentTopic) {
    String hql= "from ServicerOperateHistory s where (s.focusTopic.topicPermession.id=3 or s.focusTopic.topicPermession.id=4)" +
    		" and s.focusTopic.parentTopic=:pt order by s.operateTime desc";
    return this.sessionFactory.getCurrentSession()
          .createQuery(hql)
          .setEntity("pt", parentTopic)
          .list();
  }

  @Override
  public List<ServicerOperateHistory> serviceQueryHistory(
      ParentTopic parentTopic) {
    String hql = "from ServicerOperateHistory s where s.focusTopic.parentTopic=:pt order by s.operateTime desc";
    return this.sessionFactory.getCurrentSession()
        .createQuery(hql)
        .setEntity("pt", parentTopic)
        .list();
  }

  @Override
  public List<Post> searchPt(ParentTopic parentTopic, String search) {
    Disjunction disjunction = Restrictions.disjunction();
    disjunction.add(Restrictions.like("postName", search, MatchMode.ANYWHERE));
    disjunction.add(Restrictions.like("postText", search, MatchMode.ANYWHERE));
    return this.sessionFactory.getCurrentSession().createCriteria(Post.class)
        .add(Restrictions.eq("parentTopic",parentTopic))
        .add(disjunction)
        .addOrder(Order.desc("replyCount"))
        .list();
  }

  @Override
  public List<Post> searchAll(String search) {
    Disjunction disjunction = Restrictions.disjunction();
    disjunction.add(Restrictions.like("postName", search, MatchMode.ANYWHERE));
    disjunction.add(Restrictions.like("postText", search, MatchMode.ANYWHERE));
    return this.sessionFactory.getCurrentSession().createCriteria(Post.class)
            .add(disjunction)        
            .addOrder(Order.desc("replyCount"))
            .list();
  }



@Override
public List<Action> selectAction() {
	// TODO Auto-generated method stub
	List<Action> actions = this.sessionFactory.getCurrentSession()
			.createCriteria(Action.class)
			.list();
	return actions;
}

	@Override
	public int selectReplyPage(String username) {
		String hql = "from Reply r where r.post.user.username=:username";
		List<Reply> list = sessionFactory.getCurrentSession().createQuery(hql)
				.setString("username", username).list();
		if (list.size() % 4 == 0) {
			return list.size() / 4;
		} else {
			return list.size() / 4 + 1;
		}
	}


	@Override
	public void deletePost(int id) {
		// TODO Auto-generated method stub
		Post post = this.selectPostById(id);
		sessionFactory.getCurrentSession().delete(post);
	}

	@Override
	public void insertFocusPost(FocusPost focuspost) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().saveOrUpdate(focuspost);
	}

	@Override
	public int selectFocusPage(String username) {
		String hql = "from FocusPost fp where fp.user.username=:username order by fp.id desc";
		List<FocusPost> list = sessionFactory.getCurrentSession()
				.createQuery(hql).setString("username", username).list();
		if (list.size() % 8 == 0) {
			return list.size() / 8;
		} else {
			return list.size() / 8 + 1;
		}
	}

	@Override
	public int selectCollectPage(String username) {
		String hql = "from CollectPost cp where cp.user.username=:username";
		@SuppressWarnings({ "unchecked" })
		List<CollectPost> list = sessionFactory.getCurrentSession()
				.createQuery(hql).setString("username", username).list();
		if (list.size() % 8 == 0) {
			return list.size() / 8;
		} else {
			return list.size() / 8 + 1;
		}
	}

	@Override
	public int selectFriendsPage(String username) {
		String hql = "from FocusUser f where f.user.username=:username order by id desc";
		@SuppressWarnings({ "unchecked" })
		List<FocusUser> list = sessionFactory.getCurrentSession()
				.createQuery(hql).setString("username", username).list();
		if (list.size() % 4 == 0) {
			return list.size() / 4;
		} else {
			return list.size() / 4 + 1;
		}
	}

	@Override
	public List<Reply> queryMyReplyByName(String username, int page) {
		String hql = "from Reply r where r.user.username=:username";
		@SuppressWarnings({ "unchecked" })
		List<Reply> list = sessionFactory.getCurrentSession().createQuery(hql)
				.setString("username", username)
				// 1 0-9 2 10-19
				.setFirstResult(page * 3 - 3).setMaxResults(3).list();
		return list;
	}

	@Override
	public int selectMyReplyPage(String username) {
		String hql = "from Reply r where r.user.username=:username";
		List<Reply> list = sessionFactory.getCurrentSession().createQuery(hql)
				.setString("username", username).list();
		if (list.size() % 4 == 0) {
			return list.size() / 4;
		} else {
			return list.size() / 4 + 1;
		}
	}

	@Override
	public List<Post> queryUHMyPostPostByName(String username, int page) {
		String hql = "from Post p where p.user.username=:username";
		@SuppressWarnings({ "unchecked" })
		List<Post> list = sessionFactory.getCurrentSession().createQuery(hql)
				.setString("username", username)
				// 1 0-9 2 10-19
				.setFirstResult(page * 8 - 8).setMaxResults(8).list();
		return list;
	}

	@Override
	public int selectMyPostPage(String username) {
		String hql = "from Post p where p.user.username=:username";
		List<Reply> list = sessionFactory.getCurrentSession().createQuery(hql)
				.setString("username", username).list();
		if (list.size() % 8 == 0) {
			return list.size() / 8;
		} else {
			return list.size() / 8 + 1;
		}
	}

	@Override
	public List<CheckPost> queryUHMyBrowsePostByName(String username, int page) {
		Date now = new Date();
		String hql = "from CheckPost cp where cp.user.username=:username "
				+ "and '" + now + "'-cp.checkTime<14";
		@SuppressWarnings({ "unchecked" })
		List<CheckPost> list = sessionFactory.getCurrentSession()
				.createQuery(hql).setString("username", username)
				// 1 0-9 2 10-19
				.setFirstResult(page * 8 - 8).setMaxResults(8).list();
		return list;
	}

	@Override
	public int selectMyBrowsePostPage(String username) {
		Date now = new Date();
		String hql = "from CheckPost cp where cp.user.username=:username "
				+ "and '" + now + "'-cp.checkTime<14";
		@SuppressWarnings({ "unchecked" })
		List<CheckPost> list = sessionFactory.getCurrentSession()
				.createQuery(hql).setString("username", username).list();
		if (list.size() % 8 == 0) {
			return list.size() / 8;
		} else {
			return list.size() / 8 + 1;
		}

	}

	@Override
	public void deleteFocusPost(int id, int id2) {
		// TODO Auto-generated method stub
		FocusPost fp = (FocusPost) this.sessionFactory.getCurrentSession()
				.createCriteria(FocusPost.class)
				.add(Restrictions.eq("user.id", id))
				.add(Restrictions.eq("post.id", id2)).uniqueResult();
		this.sessionFactory.getCurrentSession().delete(fp);

	}

	@Override
	public int replyNotes(String username) {
		String hql = "from CheckPost cp where cp.user.username=:username "
				+ "and cp.post.lastReplyTime>cp.checkTime group by cp.post.id";
		@SuppressWarnings({ "unchecked" })
		List<CheckPost> list = sessionFactory.getCurrentSession()
				.createQuery(hql).setString("username", username).list();
		return list.size();
	}

	@Override
	public int focusNotes(String username) {
		String hql = "from FocusPost f where f.user.username=:username";
		@SuppressWarnings({ "unchecked" })
		List<FocusPost> list = sessionFactory.getCurrentSession()
				.createQuery(hql).setString("username", username).list();
		int count = 0;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getCount() == null) {
				list.get(i).setCount(0);
			}
			count += list.get(i).getCount();
		}
		return count;
	}


@Override
public List<Reply> selectReply(int id,int id2) {
	// TODO Auto-generated method stub
	return this.sessionFactory.getCurrentSession()
            .createCriteria(Reply.class)
            .add(Restrictions.eq("post.id", id))
            .add(Restrictions.eq("user.id", id2))
            .list();
}

@Override
public void addAdvice(Advice advice) {
	// TODO Auto-generated method stub
	this.sessionFactory.getCurrentSession().save(advice);
}
	@Override
	public int focusUserNotes(String username) {
		String hql = "from FocusUser f where f.focusUser.username=:username";
		@SuppressWarnings({ "unchecked" })
		List<FocusUser> list = sessionFactory.getCurrentSession()
				.createQuery(hql).setString("username", username).list();
		int count = 0;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getCount() == null) {
				list.get(i).setCount(0);
			}
			count += list.get(i).getCount();
		}
		return count;
	}

	@Override
	public void addChildTopic(ChildTopic childTopic) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().save(childTopic);
		
	}

	@Override
	public List<FocusTopic> queryChildTopic(String username) {
		String hql = "from FocusTopic ft where ft.user.username=:username and ft.childTopic.id<> null group by ft.childTopic.id";
		return sessionFactory.getCurrentSession().createQuery(hql).setString("username", username).list();
	}
	
	@Override
	public List<FocusTopic> queryChildTopicQT(int id) {
		String sql="select * from focustopic where childTopicID not in " +
				"(select childTopicID from focustopic where userID='"+id+"' and childTopicID is not null)" +
						"order by rand()";
		return sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(FocusTopic.class).setMaxResults(8).list();
	}

	@Override
	public Action selectActionById(int id) {
		// TODO Auto-generated method stub
		
		return (Action) this.sessionFactory.getCurrentSession().get(Action.class, id);
		
	}

	@Override
	public List<Post> queryPostByChildTopic(int id) {
		String hql = "from Post p where p.childTopic.id=:id order by p.lastReplyTime desc";
		return sessionFactory.getCurrentSession().createQuery(hql).setInteger("id", id).list();
	}

	@Override
	public void updateAction(Action action) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().saveOrUpdate(action);
	}

	@Override
	public FocusTopic queryChildTopicById(int id) {
		String hql = "from FocusTopic ft where ft.childTopic.id=:id";
		return (FocusTopic) sessionFactory.getCurrentSession().createQuery(hql).setInteger("id", id).uniqueResult();
	}

	@Override
	public List<ActionReply> selcetActionReplyByAction(int id) {
		// TODO Auto-generated method stub
		return this.sessionFactory.getCurrentSession()
	            .createCriteria(ActionReply.class)
	            .add(Restrictions.eq("action.id", id))
	            .list();
	}

	@Override
	public void insertActionReply(ActionReply actionreply) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().saveOrUpdate(actionreply);
		
	}


	@Override
	public void insertApply(ApplyServicer apply) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().saveOrUpdate(apply);
	}

  @Override
  public void insertChildReply(ChildReply childReply) {
   
       this.sessionFactory.getCurrentSession().save(childReply);
  }


	@Override
	public List<ApplyServicer> selectApplyServicer() {
		
		return this.sessionFactory.getCurrentSession()
				.createCriteria(ApplyServicer.class)
				.list();
				
	}


	@Override
	public ApplyServicer selectApplyServicer(int id) {
		// TODO Auto-generated method stub
		return (ApplyServicer) this.sessionFactory.getCurrentSession().get(ApplyServicer.class, id);
	}

	@Override
	public FocusTopic selectFocusTopicByUser(int id) {
		// TODO Auto-generated method stub
		return (FocusTopic) this.sessionFactory.getCurrentSession()
				.createCriteria(FocusTopic.class)
				.add(Restrictions.eq("user.id", id))
				.uniqueResult();
	}

	@Override
	public void insertServicerOperateHistory(ServicerOperateHistory history) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().saveOrUpdate(history);
	}







	




}
