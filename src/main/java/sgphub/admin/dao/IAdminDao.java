package sgphub.admin.dao;

import java.util.List;

import sgphub.commons.entity.*;


public interface IAdminDao {
	
	/**
	 * 登录功能 
	 * 吧务操作记录 后台操作记录
	 * @param admin
	 */
	void Login(Admin admin);
	/**
	 * 根据id查询帖子
	 * 返回Post
	 * @param admin
	 */
	Post queryPostById(int id);
	/**
	 * 首页滚动图 
	 * @param statusId
	 * 根据帖子被设为--首页帖--的ID查询所有首页帖
	 * @return
	 */
	List<Post> selectScrollPost(int statusId);
	/**
	 * 更新某个帖子从首页帖中移除
	 * <设置帖子状态ID为普通帖子>
	 * @param post
	 */
	void modifyScrollPost(Post post);
	/**
	 * 上传图片
	 * <设置帖子状态ID为首页帖子>
	 * @param post
	 */
	void upScrollPost(Post post);
	/**
	 * 添加某个帖子为首页帖
	 * @param post
	 */
	void saveScrollPost(Post post);
	/**
	 * 查询所有的吧务
	 * @param statusId
	 * @return
	 */
	List<FocusTopic> selectPostServicer(int statusId);
	/**
	 * 更新某个用户的吧务状态4
	 * <设置帖子状态ID为普通帖子>
	 * @param post
	 */
	void modifyPostServicer(FocusTopic focusTopic);
	/**
	 * 添加某个用户为吧务4
	 * 
	 * @param post
	 */
	void savePostServicer(FocusTopic focusTopic);
	/**
	 * 发起一个活动
	 * @param action
	 */
	void saveAction(Action action);
	/**
	 * 查询管理员操作记录
	 * @param pageNow 
	 * @return
	 */
	List<AdminOperateHistory> selectAdminOperateHistories(Integer pageNow);
	/**
	 * 查询管理员操作记录总页数
	 * @param pageNow 
	 * @return
	 */
	int selectAdminOperateHistoriesPage();
	/**
	 * 查询吧务操作记录
	 * @return
	 */
	List<ServicerOperateHistory> servicerOperateHistories();
	
	/**
	 * 根据名字查询管理员
	 */
	Admin selectAdminByName(String name);
	
	/**
	 * 修改管理员的最后登录时间
	 */
	void updateAdmin(Admin admin);
	
	/**
	 * 添加活动
	 * @param action
	 */
	public void insertAction(Action action);
	/**
	 * 查询活动
	 */
	public List<Action> selectAction();
	
	/**
	 * 查询正在进行中的活动
	 */
	public List<Action> selectActionByStatus();
	/**
	 * 根据ID查询活动 
	 */
	public Action selectActionById(Integer id);
	/**
	 * 根据ID 删除活动
	 */
	
	public void deleteActionById(Integer id);
	
	List<ParentTopic> queryParentTopic();
	
	User selectById(int id);
	
	ParentTopic selectByParentId(int id);
	
	TopicPermession selectPermissionById(int id);
	/**
	 * 查询关闭的活动
	 * @return
	 */
	List<Action> selectClosedAction();
	FocusTopic queryFocusTopicById(Integer id);
	FocusTopic selectFocusTopicByUserAndParentTopic(Integer id, Integer id2);
	
}
