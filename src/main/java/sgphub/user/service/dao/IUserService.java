package sgphub.user.service.dao;

import java.util.List;

import sgphub.commons.entity.*;


public interface IUserService {

	/**
	 * 根据账号查找一个账户
	 * @param account
	 * @return
	 */
	Account loginAccount(String account);
	/**
	 * 根据一个账户查找一个用户
	 * @param accountObj
	 * @return
	 */
	User queryUserByAccount(Account accountObj);
	
	/**
	 * 根据一个user的id查找一个用户
	 * @param id
	 * @return
	 */
	User queryUserByUserId(int id);
	
	/**
	 * 查询子话题
	 * @return
	 */
	List<FocusTopic> queryChildTopic(String username);
	
	/**
	 * 查询其他子话题
	 * @return
	 */
	List<FocusTopic> queryChildTopicQT(int id);
	
	/**
	 * 查询子话题帖子
	 * @return
	 */
	List<Post> queryPostByChildTopic(int id);
	
	/**
	 * 通过id查询子话题
	 * @return
	 */
	FocusTopic queryChildTopicById(int id);
	
	/**
	 * 查询回复我的帖子
	 * @return
	 */
	List<Reply> queryUserHomeReplyByName(String username, int page);
	/**
	 * 查询回复总数
	 * @param page
	 * @return
	 */
	int selectReplyPage(String username);

	/**
	 * 查询回复我的帖子
	 * 根据用户名查询所有回复帖子
	 * @return
	 */
	List<Reply> queryMyReplyByName(String username, int page);
	/**
	 * 查询回复总数
	 * @param page
	 * @return
	 */
	int selectMyReplyPage(String username);

	/**
	 * 查询我关注的帖子
	 * 根据用户名查询所有回复帖子
	 * @return
	 */
	List<FocusPost> queryUserHomeFocusByName(String username, int page);
	/**
	 * 查询关注总数
	 * @param page
	 * @return
	 */
	int selectFocusPage(String username);
	/**
	 * 根据用户名查询所有收藏帖
	 * @return
	 */
	List<CollectPost> queryUHCollectPostByName(String username, int page);
	/**
	 * 查询收藏总数
	 * @param page
	 * @return
	 */
	int selectCollectPage(String username);

	/**
	 * 根据用户名查询所有发过帖
	 * @return
	 */
	List<Post> queryUHMyPostPostByName(String username, int page);
	/**
	 * 查询发过帖总数
	 * @param page
	 * @return
	 */
	int selectMyPostPage(String username);

	/**
	 * 根据用户名查询浏览过帖
	 * @return
	 */
	List<CheckPost> queryUHMyBrowsePostByName(String username, int page);
	/**
	 * 查询浏览过帖总数
	 * @param page
	 * @return
	 */
	int selectMyBrowsePostPage(String username);

	/**
	 * 查询好友我的人
	 * 根据用户名查询所有关注我的人
	 * @return
	 */
	List<FocusUser> queryUHFriendsByName(String username, int page);
	/**
	 * 查询好友总数
	 * @param page
	 * @return
	 */
	int selectFriendsPage(String username);

	/**
	 * 修改个人信息
	 * @return
	 */
	void updateUserMessage(User user);

	/**
	 * 根据账号查询一个用户
	 * @param account
	 * @return
	 */
	User queryUserByAccountName(String account);
	/**
	 * 根据注册账号添加一个用户
	 * 1.添加一个账号
	 * 2.添加一个用户
	 * @param account
	 */
	void addUser(Account account);
	/**
	 * 修改用户信息
	 * @param user
	 */
	void modifyUserInfo(User user);
	/**
	 * 热门:时间小于1天 回复大于20条,访问大于100
	 * @return
	 */
	List<Post> queryHot();
	/**
	 * 最新：时间小于1天 回复大于5条,访问大于20
	 * @return
	 */
	List<Post> queryNew(User user);
	/**
	 * 新用户，最新：时间小于1天 回复大于5条,访问大于20
	 * @return
	 */
	List<Post> queryNew();
	/**
	 * 猜你喜欢：根据用户关注的父话题和子话题查询
	 * @param user
	 * @return
	 */
	List<Post> queryLike(User user);
	/**
	 * 新用户，猜你喜欢：根据用户关注的父话题和子话题查询
	 * @param user
	 * @return
	 */
	List<Post> queryLike();

	/**
	 * 回复我的提醒
	 * @param user
	 * @return
	 */
	int replyNotes(String username);
	/**
	 * 我关注的提醒
	 * @param user
	 * @return
	 */
	int focusNotes(String username);
	/**
	 * 我关注的提醒
	 * @param user
	 * @return
	 */
	int focusUserNotes(String username);

	/**
	 * 发表帖子
	 * @param parentTopic_id
	 * @param post
	 */
	void addPost(Post post);
	/**
	 * 关注父话题
	 * @param parentTopic_id
	 */
	void addFocusParentTopic(Integer parentTopic_id);
	/**
	 * 回复帖子
	 * @param reply
	 * @param post_id
	 */
	void replyPost(Reply reply, Integer post_id);
	/**
	 * 楼中楼回复
	 * @param childReply
	 * @param reply_id
	 */
	void childReply(ChildReply childReply, Integer reply_id);


	void addRealUser(User user);

	List<FocusPost> selectPostByUserId(int id);

	List<FocusTopic> selectTopicByUserId(int id);

	List<FocusUser> selectFocusUserById(int id);

	List<FocusUser> selectFocusMeUserById(int id);

	User selectUserById(int id);


	void updateUserCheckCount(User user);

	void addFocusUser(FocusUser fu);

	int queryCount(int userId, int focusUserId);

	void cancelFocusUser(FocusUser fu);

	/**
	 * 查询所有父话题
	 * @return
	 */
	List<ParentTopic> queryParentToppics();
	/**
	 * 根据父话题ID查询某个父话题
	 * @param ptid
	 * @return
	 */
	ParentTopic queryParentTopicById(Integer ptid);
	/**
	 * 查询用户关注的话题详细信息
	 * @param id  用户id
	 * @param id2  父话题id
	 * @return
	 */
	FocusTopic pjhgoPT(Integer id, Integer id2);
	/**
	 * 根据父话题id查询普通帖子  普通帖子id为1
	 * @param id 父话题id
	 * @return
	 */
	List<Post> pjhOrdinaryPosts(Integer id);
	/**
	 *	查询所有帖子的数量
	 * @param id 父话题id
	 * @return
	 */
	Integer pjhAllPostsCount(Integer id);
	/**
	 * 查询本吧优秀回答者
	 * @param id 父话题id
	 * @return
	 */
	List<User> pjhGoodUsers(Integer id);
	/**
	 * 查询本吧置顶帖
	 * @param id
	 * @return
	 */
	List<Post> pjhUpPosts(Integer id);
	/**
	 * 首页轮播贴
	 * @return
	 */
	List<Post> pjhScrollPosts();



	/**
	 * 根据帖子id查询post
	 * @param id
	 * @return
	 */
	Post queryPostById(int id);
	/**
	 * 根据postid 查询reply
	 *
	 */
	List<Reply> queryReplyByPostId(int id);
	/**
	 * 根据replyid查询ChildReply集合
	 */
	List<ChildReply> queryChildReplyByReplyId(int id);
	/**
	 * 添加Reply
	 *
	 */
	void addReply(Reply reply);
	void updatePost(Post post);
	void updateFocusTopic(FocusTopic focusTopic);

	/**
	 *根据父话题，user查FocusTopic
	 */
	FocusTopic queryFocusTopic(int ptopicid, int userid);
  void addCheckPost(CheckPost checkPost);
  void updateParentTopic(ParentTopic parentTopic);

  int serviceQueryUserCount(ParentTopic parentTopic);
  int serviceQueryBigCount(ParentTopic parentTopic);
  int serviceQuerySmallCount(ParentTopic parentTopic);
  int serviceQueryGoodCount(ParentTopic parentTopic);
  List<ServicerOperateHistory> serviceQueryTeam(ParentTopic parentTopic);
  List<ServicerOperateHistory> serviceQueryBlackUser(ParentTopic parentTopic);
  List<ServicerOperateHistory> serviceQueryHistory(ParentTopic parentTopic);
  List<Post> searchPt(ParentTopic parentTopic, String search);
  List<Post> searchAll(String search);

  /**
   * 添加收藏贴
   *
   */
  void addCollectPost(CollectPost collectpost);
  /**
   * 查询活动
   */
  List<Action> queryAction();
  /**
   * 删除帖子
   * @param post
   */
  void removePost(int id);
  /**
   * 添加FocusPost
   * @param focuspost
   */
  void addFocusPost(FocusPost focuspost);
  /**
   * 根据 用户 帖子 删除 focuspost
   * @param id
   * @param id2
   */
  void removeFocusPost(int id, int id2);

  /**
   * 保存建议
   * @param advice
   */
  public void addAdvice(Advice advice);
  /**
   * 根据用户 帖子 查询Reply集合
   * @param id
   * @param id2
   * @return
   */

  List<Reply> queryReply(int id, int id2);
  
  /**
   * 增加子话题
   * @param childTopic
   */
   
  void addChildTopic(ChildTopic childTopic);
  /**
   * 根据ID查询活动
   * @param id
   * @return
   */
  
  Action queryActionById(int id);
  /**
   * 更新活动
   * @param action
   */
  void modifyAction(Action action);
  /**
   * 根据活动查询活动回复
   * @param id
   * @return
   */
  List<ActionReply> queryActionReplyByAction(int id);
  /**
   * 添加活动回复
   * @param actionreply
   */
  void addActionReply(ActionReply actionreply);

  /**
   * tianjia申请到ApplyServicer
   * 
   */
  void addApplyServicer(ApplyServicer apply);
  /**
   * 查询所有申请
   * @return
   */
  List<ApplyServicer> queryApplyServicer();
  /**
   * 根据id查询ApplyServicer
   * @param id
   * @return
   */
  ApplyServicer queryApplyServicer(int id);

  void addChildReply(ChildReply childReply);
  
  FocusTopic queryFocusTopicByUserId(int id);
  
  void addServicerOperateHistory(ServicerOperateHistory history);
}
