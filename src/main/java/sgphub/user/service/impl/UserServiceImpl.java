package sgphub.user.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.Transient;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import sgphub.commons.entity.*;
import sgphub.user.data.dao.IUserDao;
import sgphub.user.service.dao.IUserService;


@Transactional
@Service("userService")
public class UserServiceImpl implements IUserService {
	IUserDao userDao;

	@Transient
	@Resource(name = "userDao")
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public Account loginAccount(String account) {
		return this.userDao.selectAccountByAccountname(account);
	}

	@Override
	public User queryUserByAccount(Account accountObj) {
		return this.userDao.selectUserByAccount(accountObj);
	}

	@Override
	public List<Reply> queryUserHomeReplyByName(String username, int page) {
		// TODO Auto-generated method stub
		return userDao.queryUserHomeReplyByName(username, page);
	}

	@Override
	public User queryUserByAccountName(String account) {

		return this.userDao.selectUserByAccount(this.userDao
				.selectAccountByAccountname(account));
	}

	@Override
	public void addUser(Account account) {
		this.userDao.addAccount(account);
		this.userDao.addUser(account);

	}

	@Override
	public void modifyUserInfo(User user) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Post> queryHot() {
		// TODO Auto-generated method stub
		return userDao.queryHotPost();
	}

	@Override
	public List<Post> queryNew(User user) {
		// TODO Auto-generated method stub
		return userDao.queryNewPost(user);
	}

	@Override
	public List<Post> queryNew() {
		// TODO Auto-generated method stub
		return userDao.queryNewPost();
	}

	@Override
	public List<Post> queryLike(User user) {
		// TODO Auto-generated method stub
		return userDao.queryLike(user);
	}

	@Override
	public List<Post> queryLike() {
		// TODO Auto-generated method stub
		return userDao.queryLike();
	}

	@Override
	public void addPost(Post post) {

		this.userDao.insertPost(post);
	}

	@Override
	public void addFocusParentTopic(Integer parentTopic_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void replyPost(Reply reply, Integer post_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void childReply(ChildReply childReply, Integer reply_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void addRealUser(User user) {
		// TODO Auto-generated method stub
		this.userDao.addRealUser(user);
	}

	@Override
	public List<FocusPost> selectPostByUserId(int id) {
		// TODO Auto-generated method stub
		return this.userDao.selectPostByUserId(id);
	}

	@Override
	public List<CollectPost> queryUHCollectPostByName(String username, int page) {
		// TODO Auto-generated method stub
		return userDao.queryUHCollectPostByName(username, page);
	}

	@Override
	public List<FocusTopic> selectTopicByUserId(int id) {
		// TODO Auto-generated method stub
		return this.userDao.selectTopicByUserId(id);
	}

	@Override
	public List<FocusUser> queryUHFriendsByName(String username, int page) {
		// TODO Auto-generated method stub
		return userDao.queryUHFriendsByName(username, page);
	}

	@Override
	public List<FocusUser> selectFocusUserById(int id) {
		// TODO Auto-generated method stub

		return this.userDao.selectFocusUserById(id);
	}

	@Override
	public List<FocusUser> selectFocusMeUserById(int id) {
		// TODO Auto-generated method stub
		return this.userDao.selectFocusMeUserById(id);
	}

	@Override
	public User selectUserById(int id) {
		// TODO Auto-generated method stub
		return this.userDao.selectUserById(id);
	}

	@Override
	public void updateUserCheckCount(User user) {
		// TODO Auto-generated method stub
		this.userDao.updateUserCheckCount(user);
	}

	@Override
	public void addFocusUser(FocusUser fu) {
		// TODO Auto-generated method stub
		this.userDao.addFocusUser(fu);
	}

	@Override
	public List<ParentTopic> queryParentToppics() {
		// TODO Auto-generated method stub
		return this.userDao.selectParentTopics();
	}

	@Override
	public int queryCount(int userId, int focusUserId) {
		// TODO Auto-generated method stub
		return this.userDao.queryCount(userId, focusUserId);
	}

	@Override
	public Post queryPostById(int id) {

		return this.userDao.selectPostById(id);
	}

	@Override
	public void cancelFocusUser(FocusUser fu) {
		// TODO Auto-generated method stub
		this.userDao.cancelFocusUser(fu);

	}

	@Override
	public ParentTopic queryParentTopicById(Integer ptid) {
		return this.userDao.selectParentTopicById(ptid);
	}

	@Override
	public List<Reply> queryReplyByPostId(int id) {

		return this.userDao.selectReplyByPostId(id);
	}

	@Override
	public FocusTopic pjhgoPT(Integer id, Integer id2) {
		// TODO Auto-generated method stub
		return this.userDao.pjhGoPt(id, id2);
	}

	@Override
	public List<ChildReply> queryChildReplyByReplyId(int id) {
		// TODO Auto-generated method stub
		return this.userDao.selectChildReplyByReplyId(id);
	}

	@Override
	public List<Post> pjhOrdinaryPosts(Integer id) {
		// TODO Auto-generated method stub
		return this.userDao.pjhOrdinaryPosts(id);
	}

	@Override
	public Integer pjhAllPostsCount(Integer id) {
		// TODO Auto-generated method stub
		return this.userDao.pjhAllPostsCount(id);
	}

	@Override
	public List<User> pjhGoodUsers(Integer id) {
		// TODO Auto-generated method stub
		return this.userDao.pjhGoodUsers(id);
	}

	@Override
	public List<Post> pjhUpPosts(Integer id) {
		// TODO Auto-generated method stub
		return this.userDao.pjhUpPosts(id);
	}

	@Override
	public void addReply(Reply reply) {
		// TODO Auto-generated method stub
		userDao.insertReply(reply);
	}

	@Override
	public void updateUserMessage(User user) {
		// TODO Auto-generated method stub
		userDao.updateUserMessage(user);
	}

	@Override
	public void updatePost(Post post) {
		this.userDao.updatePost(post);

	}

	@Override
	public void updateFocusTopic(FocusTopic focusTopic) {
		this.userDao.updateFocusTopic(focusTopic);

	}

	@Override
	public User queryUserByUserId(int id) {
		// TODO Auto-generated method stub
		return userDao.queryUserByUserId(id);
	}

	@Override
	public List<Post> pjhScrollPosts() {

		return this.userDao.pjhScrollPosts();
	}

	@Override
	public FocusTopic queryFocusTopic(int ptopicid, int userid) {
		// TODO Auto-generated method stub
		return this.userDao.selectFocusTopic(ptopicid, userid);
	}

	@Override
	public List<FocusPost> queryUserHomeFocusByName(String username, int page) {
		// TODO Auto-generated method stub
		return userDao.queryUserHomeFocusByName(username, page);
	}

	@Override
	public void addCheckPost(CheckPost checkPost) {
		this.userDao.insertCheckPost(checkPost);

	}

	@Override
	public void updateParentTopic(ParentTopic parentTopic) {
		this.userDao.updateParentTopic(parentTopic);

	}

	@Override
	public int serviceQueryUserCount(ParentTopic parentTopic) {
		// TODO Auto-generated method stub
		return this.userDao.serviceQueryUserCount(parentTopic);
	}

	@Override
	public void addCollectPost(CollectPost collectpost) {
		// TODO Auto-generated method stub
		this.userDao.insertCollectPost(collectpost);
	}

	@Override
	public int selectReplyPage(String username) {
		// TODO Auto-generated method stub
		return userDao.selectReplyPage(username);
	}

	@Override
	public int serviceQueryBigCount(ParentTopic parentTopic) {
		// TODO Auto-generated method stub
		return this.userDao.serviceQueryBigCount(parentTopic);
	}

	@Override
	public List<Action> queryAction() {
		// TODO Auto-generated method stub
		return this.userDao.selectAction();
	}

	@Override
	public int serviceQuerySmallCount(ParentTopic parentTopic) {
		// TODO Auto-generated method stub
		return this.userDao.serviceQuerySmallCount(parentTopic);
	}

	@Override
	public int serviceQueryGoodCount(ParentTopic parentTopic) {
		// TODO Auto-generated method stub
		return this.userDao.serviceQueryGoodCount(parentTopic);
	}

	@Override
	public void removePost(int id) {
		// TODO Auto-generated method stub
		this.userDao.deletePost(id);
	}

	@Override
	public void addFocusPost(FocusPost focuspost) {
		// TODO Auto-generated method stub
		this.userDao.insertFocusPost(focuspost);
	}

	@Override
	public int selectFocusPage(String username) {
		// TODO Auto-generated method stub
		return userDao.selectFocusPage(username);
	}

	@Override
	public List<ServicerOperateHistory> serviceQueryTeam(ParentTopic parentTopic) {
		// TODO Auto-generated method stub
		return this.userDao.serviceQueryTeam(parentTopic);
	}

	@Override
	public List<ServicerOperateHistory> serviceQueryBlackUser(
			ParentTopic parentTopic) {
		// TODO Auto-generated method stub
		return this.userDao.serviceQueryBlackUser(parentTopic);
	}

	@Override
	public List<ServicerOperateHistory> serviceQueryHistory(
			ParentTopic parentTopic) {
		// TODO Auto-generated method stub
		return this.userDao.serviceQueryHistory(parentTopic);
	}

	@Override
	public List<Post> searchPt(ParentTopic parentTopic, String search) {
		// TODO Auto-generated method stub
		return this.userDao.searchPt(parentTopic, search);
	}

	@Override
	public List<Post> searchAll(String search) {
		// TODO Auto-generated method stub
		return this.userDao.searchAll(search);
	}

	@Override
	public void removeFocusPost(int id, int id2) {
		// TODO Auto-generated method stub
		this.userDao.deleteFocusPost(id, id2);

	}

	@Override
	public int selectFriendsPage(String username) {
		// TODO Auto-generated method stub
		return userDao.selectFriendsPage(username);
	}

	@Override
	public List<Reply> queryMyReplyByName(String username, int page) {
		// TODO Auto-generated method stub
		return userDao.queryMyReplyByName(username, page);
	}

	@Override
	public int selectMyReplyPage(String username) {
		// TODO Auto-generated method stub
		return userDao.selectMyReplyPage(username);
	}

	@Override
	public List<Post> queryUHMyPostPostByName(String username, int page) {
		// TODO Auto-generated method stub
		return userDao.queryUHMyPostPostByName(username, page);
	}

	@Override
	public int selectMyPostPage(String username) {
		// TODO Auto-generated method stub
		return userDao.selectMyPostPage(username);
	}

	@Override
	public List<CheckPost> queryUHMyBrowsePostByName(String username, int page) {
		// TODO Auto-generated method stub
		return userDao.queryUHMyBrowsePostByName(username, page);
	}

	@Override
	public int selectMyBrowsePostPage(String username) {
		// TODO Auto-generated method stub
		return userDao.selectMyBrowsePostPage(username);
	}

	@Override
	public int replyNotes(String username) {
		// TODO Auto-generated method stub
		return userDao.replyNotes(username);
	}

	@Override
	public int focusNotes(String username) {
		// TODO Auto-generated method stub
		return userDao.focusNotes(username);
	}

	@Override
	public int focusUserNotes(String username) {
		// TODO Auto-generated method stub
		return userDao.focusUserNotes(username);
	}

	@Override
	public int selectCollectPage(String username) {
		// TODO Auto-generated method stub
		return userDao.selectCollectPage(username);
	}

	@Override
	public List<Reply> queryReply(int id, int id2) {
		// TODO Auto-generated method stub
		return this.userDao.selectReply(id, id2);
	}

	@Override
	public List<FocusTopic> queryChildTopic(String username) {
		// TODO Auto-generated method stub
		return userDao.queryChildTopic(username);
	}

	@Override
	public List<FocusTopic> queryChildTopicQT(int id) {
		// TODO Auto-generated method stub
		return userDao.queryChildTopicQT(id);
	}

	@Override
	public void addAdvice(Advice advice) {
		// TODO Auto-generated method stub
		this.userDao.addAdvice(advice);
	}

	@Override
	public List<Post> queryPostByChildTopic(int id) {
		// TODO Auto-generated method stub
		return userDao.queryPostByChildTopic(id);
	}

	@Override
	public void addChildTopic(ChildTopic childTopic) {
		// TODO Auto-generated method stub
		this.userDao.addChildTopic(childTopic);
	}

	@Override
	public FocusTopic queryChildTopicById(int id) {
		// TODO Auto-generated method stub
		return userDao.queryChildTopicById(id);
	}


	@Override
	public Action queryActionById(int id) {
		// TODO Auto-generated method stub
		return this.userDao.selectActionById(id);
	}

	@Override
	public void modifyAction(Action action) {
		// TODO Auto-generated method stub
		this.userDao.updateAction(action);
	}


@Override
public void addApplyServicer(ApplyServicer apply) {
	// TODO Auto-generated method stub
	this.userDao.insertApply(apply);
}

	@Override
	public List<ActionReply> queryActionReplyByAction(int id) {
		// TODO Auto-generated method stub
		return this.userDao.selcetActionReplyByAction(id);
	}

@Override
public List<ApplyServicer> queryApplyServicer() {
	// TODO Auto-generated method stub
	return this.userDao.selectApplyServicer();
}

	@Override
	public void addActionReply(ActionReply actionreply) {
		// TODO Auto-generated method stub
		this.userDao.insertActionReply(actionreply);
	}

@Override
public ApplyServicer queryApplyServicer(int id) {
	// TODO Auto-generated method stub
	return this.userDao.selectApplyServicer(id);
}

  @Override
  public void addChildReply(ChildReply childReply) {
     this.userDao.insertChildReply(childReply);
    
  }

@Override
public FocusTopic queryFocusTopicByUserId(int id) {
	// TODO Auto-generated method stub
	return this.userDao.selectFocusTopicByUser(id);
}

@Override
public void addServicerOperateHistory(ServicerOperateHistory history) {
	// TODO Auto-generated method stub
	this.userDao.insertServicerOperateHistory(history);
}


}





