package sgphub.user.data.dao;

import java.util.List;

import sgphub.commons.entity.*;


public interface IUserDao {

	Account selectAccountByAccountname(String account);

	User selectUserByAccount(Account accountObj);
	
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
	 * 通过id查询子话题
	 * @return
	 */
	FocusTopic queryChildTopicById(int id);
	
	/**
	 * 查询子话题帖子
	 * @return
	 */
	List<Post> queryPostByChildTopic(int id);
	
	/**
	 * 查询条件热门帖子
	 * @return
	 */
	List<Post> queryHotPost();
	
	/**
	 * 查询条件推荐帖子
	 * @return
	 */
	List<Post> queryNewPost(User user);
	/**
	 * 新用户，查询条件推荐帖子
	 * @return
	 */
	List<Post> queryNewPost();
	
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
	 * 关注我的提醒
	 * @param user
	 * @return
	 */
	int focusUserNotes(String username);
	
	/**
	 * 查询回复我的帖子
	 * 根据用户名查询所有回复帖子
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
	 * 查询回复我收藏的帖子
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
	 * 查询关注我的人
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

	void addAccount(Account account);

	void addUser(Account account);

	void addRealUser(User user);

	List<FocusPost> selectPostByUserId(int id);

	List<FocusTopic> selectTopicByUserId(int id);

	List<FocusUser> selectFocusUserById(int id);

	List<FocusUser> selectFocusMeUserById(int id);

	User selectUserById(int id);


	void updateUserCheckCount(User user);

	void addFocusUser(FocusUser fu);

	int queryCount(int userId, int focusUserId);



	List<ParentTopic> selectParentTopics();

	ParentTopic selectParentTopicById(Integer ptid);

	List<User> pjhGoodUsers(Integer id);

	List<Post> pjhUpPosts(Integer id);

	Integer pjhAllPostsCount(Integer id);

	List<Post> pjhOrdinaryPosts(Integer id);

	FocusTopic pjhGoPt(Integer id, Integer id2);

	/**
	 * 根据ID 查询post
	 * @param id
	 * @return
	 */
	Post selectPostById(int id);

	/**
	 * 根据postid查询reply
	 */
	List<Reply> selectReplyByPostId(int id);
	/**
	 * 根据replyid 查询childreply集合
	 */
	List<ChildReply> selectChildReplyByReplyId(int id);

	void cancelFocusUser(FocusUser fu);

  void insertPost(Post post);


	/**
	 * 添加回复
	 */
	void insertReply(Reply reply);

	void updatePost(Post post);

	void updateFocusTopic(FocusTopic focusTopic);
/**
 * 根据父话题，用户查询一个FocusTopic
 */
	FocusTopic selectFocusTopic(int ptopicid, int userid);

    List<Post> pjhScrollPosts();

    void insertCheckPost(CheckPost checkPost);

    void updateParentTopic(ParentTopic parentTopic);
    /**
     * 添加收藏贴
     *
     */


    int serviceQueryUserCount(ParentTopic parentTopic);

    void insertCollectPost(CollectPost collectpost);

    /**
     * 查询活动
     */
    List<Action> selectAction();
    /**
     * 删除帖子
     * @param id
     */
    void deletePost(int id);
    /**
     * 添加关注
     * @param focuspost
     */

    void insertFocusPost(FocusPost focuspost);
    /**
     * 根据用户 帖子 删除focuspost
     * @param id
     * @param id2
     */
    void deleteFocusPost(int id, int id2);
    
    /**
     * 保存advice
     * @param advice
     */
    void addAdvice(Advice advice);
    /**
     * 查询REply集合 根据post user
     * @return
     */
    
    List<Reply> selectReply(int id, int id2);
    /**
     * 根据id 查询活动
     * @param id
     * @return
     */
    Action selectActionById(int id);
    /**
     * 更新活动
     * @param action
     */
    void updateAction(Action action);
    /**
     * 根据活动查询活动回复
     * @param id
     * @return
     */
    List<ActionReply> selcetActionReplyByAction(int id);
    /**
     * 添加活动回复
     * @param actionreply
     */
    
    void insertActionReply(ActionReply actionreply);

    int serviceQueryBigCount(ParentTopic parentTopic);

    int serviceQuerySmallCount(ParentTopic parentTopic);



    int serviceQueryGoodCount(ParentTopic parentTopic);
    
    List<ServicerOperateHistory> serviceQueryBlackUser(ParentTopic parentTopic);

    List<ServicerOperateHistory> serviceQueryTeam(ParentTopic parentTopic);

    List<ServicerOperateHistory> serviceQueryHistory(ParentTopic parentTopic);

    List<Post> searchPt(ParentTopic parentTopic, String search);

    List<Post> searchAll(String search);

    /**
     * 添加吧主申请
     * @param apply
     */

    
    void addChildTopic(ChildTopic childTopic);

    void insertApply(ApplyServicer apply);
   /**
    * 
    * @return
    */
    List<ApplyServicer> selectApplyServicer(); 
    /**
     * 通过ID查询ApplyServicer
     * @param id
     * @return
     */
    ApplyServicer selectApplyServicer(int id);

    void insertChildReply(ChildReply childReply);
    /**
     * 根据用户查询FocusTopic表
     * @return
     */

    FocusTopic selectFocusTopicByUser(int id);
    /**
     *添加操作记录
     * @param history
     */
    void insertServicerOperateHistory(ServicerOperateHistory history);

}
