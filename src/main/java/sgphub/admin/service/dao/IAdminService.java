package sgphub.admin.service.dao;


import java.util.List;

import sgphub.commons.entity.*;


public interface IAdminService {

	/**
	 * 登录功能 
	 * 吧务操作记录 后台操作记录
	 * @param admin
	 */
	Admin adminLogin(String name);
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
	List<Post> queryScrollPost(int statusId);
	/**
	 * 更新某个帖子从首页帖中移除
	 * <设置帖子状态ID为普通帖子>
	 * @param post
	 */
	void updateScrollPost(Post post);
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
	void addScrollPost(Post post);
	/**
	 * 查询所有的吧务
	 * @param statusId
	 * @return
	 */
	List<FocusTopic> queryPostServicer(int statusId);
	/**
	 * 更新某个用户的吧务状态
	 * <设置帖子状态ID为普通帖子>
	 * @param post
	 */
	void updatePostServicer(FocusTopic focusTopic);
	/**
	 * 添加某个用户为吧务
	 * @param post
	 */
	void addPostServicer(FocusTopic focusTopic);
	/**
	 * 发起一个活动
	 * @param action
	 */
	void addAction(Action action);
	/**
	 * 查询管理员操作记录
	 * @param page 
	 * @return
	 */
	List<AdminOperateHistory> queryAdminOperateHistories(Integer page);
	/**
	 * 查询管理员操作记录总数
	 * @param page 
	 * @return
	 */
	int selectAdminOperateHistoriesPage();
	/**
	 * 查询吧务操作记录
	 * @return
	 */
	List<ServicerOperateHistory> servicerOperateHistories();

	/**
	 * 修改管理员的最后登录时间
	 */

	void modifyAdmin(Admin admin);
	/**
	 * 修改管理员密码
	 * @return
	 */
	void updatePassword(Admin admin);
	
	
	/**
	 * 查询活动
	 * @param action
	 */
	public List<Action> queryAction();
	
	/**
	 * 查询进行中的活动
	 */
	public List<Action> queryActionByStatus();
	/**
	 * 查询关闭的活动
	 */
	public List<Action> queryClosedAction();
	/**
	 * 根据ID查询活动
	 */
	public Action queryActionById(Integer id);
	
	/**
	 * 根据ID删除活动
	 */
	public void removeActionById(Integer id);
	List<ParentTopic> queryParentTopic();
	
	User selectById(int id);
	
	ParentTopic selectByParentId(int id);
	
	
	TopicPermession selectPermissionById(int id);
	FocusTopic selectFocusTopicById(Integer id);
	FocusTopic queryFocusTopicByUserID(Integer id, Integer id2);
		

}
