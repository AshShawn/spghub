package sgphub.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.Transient;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import sgphub.admin.dao.IAdminDao;
import sgphub.admin.service.dao.IAdminService;
import sgphub.commons.entity.*;


@Transactional
@Service("adminService")
public  class AdminServiceImpl implements IAdminService {
	IAdminDao adminDao;

	
	
	@Resource(name="adminDao")
	@Transient
	public void setAdminDao(IAdminDao adminDao) {
		this.adminDao = adminDao;
	}

		@Override
		public Admin adminLogin(String name) {
			 Admin a = this.adminDao.selectAdminByName(name);
			 
			 return a;
			
		}

		@Override
		public List<Post> queryScrollPost(int statusId) {
			// TODO Auto-generated method stub
			return adminDao.selectScrollPost(statusId);
		}

		@Override
		public void updateScrollPost(Post post) {
			// TODO Auto-generated method stub
			adminDao.modifyScrollPost(post);
		}

		@Override
		public void addScrollPost(Post post) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public List<FocusTopic> queryPostServicer(int statusId) {
			// TODO Auto-generated method stub
			
			return this.adminDao.selectPostServicer(statusId);
			
		}

		@Override
		public void updatePostServicer(FocusTopic focusTopic) {
			// TODO Auto-generated method stub
			this.adminDao.modifyPostServicer(focusTopic);
			
		}

		@Override
		public void addPostServicer(FocusTopic focusTopic) {
			// TODO Auto-generated method stub
			this.adminDao.savePostServicer(focusTopic);
			
		}

		

		@Override
		public List<AdminOperateHistory> queryAdminOperateHistories(Integer pageNow) {
			// TODO Auto-generated method stub
			return this.adminDao.selectAdminOperateHistories(pageNow);
		}

		@Override
		public List<ServicerOperateHistory> servicerOperateHistories() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public Post queryPostById(int id) {
			// TODO Auto-generated method stub
			return adminDao.queryPostById(id);
		}

		@Override
		public void modifyAdmin(Admin admin) {
			// TODO Auto-generated method stub
			adminDao.updateAdmin(admin);
		}


		@Override
		public void upScrollPost(Post post) {
			// TODO Auto-generated method stub
			this.adminDao.upScrollPost(post);
		}


		@Override
		public List<ParentTopic> queryParentTopic() {
			// TODO Auto-generated method stub
			return this.adminDao.queryParentTopic();
		}

		@Override
		public User selectById(int id) {
			// TODO Auto-generated method stub
			return this.adminDao.selectById(id);
		}

		@Override
		public ParentTopic selectByParentId(int id) {
			// TODO Auto-generated method stub
			return this.adminDao.selectByParentId(id);
		}

		@Override
		public TopicPermession selectPermissionById(int id) {
			// TODO Auto-generated method stub
			return this.adminDao.selectPermissionById(id);
		}

		@Override
		public void updatePassword(Admin admin) {
			this.adminDao.updateAdmin(admin);
			
		}
		@Override
		public void addAction(Action action) {
			// TODO Auto-generated method stub
			adminDao.insertAction(action);
		}


		@Override
		public List<Action> queryAction() {
			// TODO Auto-generated method stub
			List<Action> actions = adminDao.selectAction();
			return actions;
		}


		@Override
		public List<Action> queryActionByStatus() {
			// TODO Auto-generated method stub
			List<Action> actions = adminDao.selectActionByStatus();
			return actions;
		}


		@Override
		public Action queryActionById(Integer id) {
			// TODO Auto-generated method stub
			Action action = adminDao.selectActionById(id);
			return action;
		}


		@Override
		public void removeActionById(Integer id) {
			// TODO Auto-generated method stub
			adminDao.deleteActionById(id);
		}

		@Override
		public int selectAdminOperateHistoriesPage() {
			// TODO Auto-generated method stub
			return adminDao.selectAdminOperateHistoriesPage();
		}

		@Override
		public List<Action> queryClosedAction() {
			// TODO Auto-generated method stub
			List<Action> actions = adminDao.selectClosedAction();
			return actions;
		}

		@Override
		public FocusTopic selectFocusTopicById(Integer id) {
			// TODO Auto-generated method stub
			return this.adminDao.queryFocusTopicById(id);
		}

		@Override
		public FocusTopic queryFocusTopicByUserID(Integer id, Integer id2) {
			// TODO Auto-generated method stub
			return this.adminDao.selectFocusTopicByUserAndParentTopic(id,id2);
		}

	
}
