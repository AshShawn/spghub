package sgphub.admin.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sgphub.admin.service.dao.IAdminService;
import sgphub.commons.entity.*;


@Controller
@RequestMapping("/admin")
public class AdminContorller {
	
	private static String imgName;
	@Resource(name="adminService")
	IAdminService adminService;
	
	
	@RequestMapping("/adminLogin")
	public String adminLogin(Admin admin, HttpSession session, Model model){
		Admin a = adminService.adminLogin(admin.getName());
		if(a != null){
			if(a.getPassword().equals(admin.getPassword())){
				Date time = a.getLastLogin();
				
				session.setAttribute("lastT", time);
				a.setLastLogin(new Date());//给admin赋值新的LastLogin时间
				adminService.modifyAdmin(a);
				session.setAttribute("admininfo", a);
				return "redirect:/UI/admin/main.jsp";
			}else{
				model.addAttribute("info", 1);
				return "forward:/UI/admin/login.jsp";
			}
		}else{
			model.addAttribute("info", 1);
			return "forward:/UI/admin/login.jsp";
		}
	}
	/**
	 * 
	 * 查询滚动图帖子
	 * @return
	 */
	@RequestMapping("/showPhoto")
	public String showPhoto(Model model) {
		List<Post> list=this.adminService.queryScrollPost(5);
		model.addAttribute("photos",list);		
		return "admin/adminPhoto";
	}
	/**
	 * 
	 * 获取参数，得到Post，修改StatusId
	 *  @param post
	 * @param request
	 * @return
	 */
	@RequestMapping("/modifyPhoto")
	public String preModifyPhoto(Post post) {
		post=adminService.queryPostById(post.getId());
		this.adminService.updateScrollPost(post);
		return "redirect:/admin/showPhoto.form";
	}
	/**
	 * 
	 * 上传帖子图片
	 *  @param post
	 * @param request
	 * @return
	 */
	@RequestMapping("/upPhoto")
	public String upPhoto(Post post,HttpServletRequest request) {
		post=adminService.queryPostById(post.getId());
		String path = "/UI/images/";
		
		post.setImgURL(path+imgName);
		this.adminService.upScrollPost(post);

		return "redirect:/admin/showPhoto.form";
	}
	
	
	/**
	 * 
	 * 修改密码
	 *  @param post
	 * @param request
	 * @return
	 */
	@RequestMapping("/updatePassword")
	public String updatePassword(Admin admin) {
		String password=admin.getPassword();
		admin=adminService.adminLogin(admin.getName());
		admin.setPassword(password);
		adminService.updatePassword(admin);

		return "/admin/index";
	}

	/**
	 * 查询吧主
	 * @param model
	 * @return
	 */
	@RequestMapping("/queryService")
	public String queryPostServicer(Model model){
		List<FocusTopic> lists=this.adminService.queryPostServicer(4);
		List<ParentTopic> parentTopics=this.adminService.queryParentTopic();
		model.addAttribute("lists", lists);
		model.addAttribute("parentTopics", parentTopics);
		return "/admin/leader";
		
	}
	
	
	/**
	 * 增加吧主
	 * @param focusTopic
	 * @return
	 */
	@RequestMapping("/addServicer")
	public String addService(FocusTopic focusTopic2, Model model){
		// ft ---user  --- topicpermissin --- parenttopic
	
		FocusTopic focusTopic = this.adminService.queryFocusTopicByUserID(focusTopic2.getUser().getId(),focusTopic2.getParentTopic().getId());
		if (focusTopic == null) {	
			model.addAttribute("info", 1);
			return "forward:/admin/queryService.form";
		}else {
			focusTopic.getTopicPermession().setId(4);
			this.adminService.addPostServicer(focusTopic);
			return "redirect:/admin/queryService.form";
		}
	
		
		
	}
	
	
	/**
	 * 修改吧务
	 * @param focusTopic
	 * @return
	 */
	@RequestMapping("/updateServicer")
	public String updateServicer(FocusTopic focusTopic){
		FocusTopic focusTopic2 = this.adminService.selectFocusTopicById(focusTopic.getId());
		focusTopic2.setTopicPermession(this.adminService.selectPermissionById(1));
		this.adminService.updatePostServicer(focusTopic2);
		return "redirect:/admin/queryService.form";
		
	}
	/**
	 * 查询管理员操作记录
	 * @return
	 */
	@RequestMapping("/queryAdminOperate")
	public String queryAdminOperate(Model model, String pageNow) {
		if (pageNow==null||pageNow =="") {
			pageNow="1";
		}
		Integer page = Integer.parseInt(pageNow);
		List<AdminOperateHistory> histories = this.adminService.queryAdminOperateHistories(page);
		model.addAttribute("servicerHistory", histories);
		model.addAttribute("pageAll", adminService.selectAdminOperateHistoriesPage());
		return "/admin/servicer";
	}

	@RequestMapping("/queryAdminOperatePage")
	public String queryAdminOperatePage(Model model, String pageNow) {
		Integer page = Integer.parseInt(pageNow);
		List<AdminOperateHistory> histories = this.adminService.queryAdminOperateHistories(page);
		model.addAttribute("servicerHistory", histories);
		return "/admin/showtable";
	}

	/**
	 * 查询关闭的活动
	 * @param 
	 */
	@RequestMapping("/queryColsedAction")
	public String queryColsedAction(Model model){
		List<Action> actions = adminService.queryClosedAction();
		model.addAttribute("lists", actions);
		return "/admin/action";
	}

	
	/**
	 * 添加活动，及添加后的查询
	 * @param action
	 * @param model
	 * @return
	 */
	@RequestMapping("/addAction")
	public String addAction(Action action, Model model){
		String path = "/UI/images/";
		
		action.setImgURL(path+imgName);
		
		adminService.addAction(action);
		return	"redirect:/admin/queryActionByStatus.form";
	}
	/**
	 * 查询活动
	 * @param model
	 * @return
	 */
	@RequestMapping("/queryAction")
	public String queryAction(Model model){
		List<Action> actions = adminService.queryAction();
		model.addAttribute("lists",actions);
		return "/admin/action";
	}
	/**
	 * 根据活动ID删除活动
	 * @param binder
	 */
	@RequestMapping("/removeAction")
	public String removeAction(HttpServletRequest req){
		adminService.removeActionById(Integer.valueOf(req.getParameter("id")));
		return "redirect:/admin/queryAction.form";
	}
	
	/**
	 * ajax传到后台看用户是否存在
	 * @param user
	 * @param response
	 */

	/**
	 * 查询进行中的活动
	 * @param 
	 */
	@RequestMapping("/queryActionByStatus")
	public String queryActionByStatus(Model model){
		List<Action> actions = adminService.queryActionByStatus();
		model.addAttribute("lists", actions);
		return "/admin/addaction";
	}
	
	/**
	 * 将进行中的活动关闭
	 * @param 
	 */
	@RequestMapping("/modifyActionStatus")
	public String modifyActionStatus(HttpServletRequest req){
		
		Action action = adminService.queryActionById(Integer.valueOf(req.getParameter("id")));
		if(action.getActionStatus().getId() == 2){
			//在页面输出活动已经关闭，无需再次关闭
			action.getActionStatus().setId(1);
			adminService.addAction(action);
			return "redirect:/admin/queryActionByStatus.form";
		}else{
			action.getActionStatus().setId(2);
			adminService.addAction(action);
			return "redirect:/admin/queryActionByStatus.form";
		}
		
	}
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder){
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),
	            true));
	}


	/**
	 * 异步上传图片
	 * @throws IOException 
	 */
	@RequestMapping("/uploadPhoto")
	@ResponseBody
	public Map<String, Object> uploadPhoto(MultipartFile imgURL, HttpServletRequest request) throws IOException {

		String name = imgURL.getOriginalFilename();//获得图片文件名
		//System.out.println(request.getContextPath()+"--------requestContextpath");

		String filePath =request.getServletContext().getRealPath("UI/images/");	
		File temFile = new File(filePath,name);
		if (!temFile.exists()) {
			temFile.mkdirs();
		}
		
		imgURL.transferTo(temFile);
		imgName=name;
		/**
		 * 上传成功返回json字符
		 */
		String /*path =request.getServletContext().getContextPath();*/
		path =filePath+name;
		Map<String,Object> jsonUtils = new HashMap<>();
		jsonUtils.put("code",new Integer(0));
		jsonUtils.put("msg","ok");
		/*jsonUtils.put("data",);*/
		Map<String,Object> data = new HashMap<>();
		data.put("src", path);
		data.put("title", name);
		
		jsonUtils.put("data",data);				
		System.out.println(jsonUtils);
		System.out.println("1111111111111"+"++++++++++");
		/*{
			  "code": 0 //0表示成功，其它失败
			  ,"msg": "" //提示信息 //一般上传失败后返回
			  ,"data": {
			    src: "图片路径"
			    ,title: "图片名称" //可选
			  }
			}*/
		return jsonUtils;
	}

	@RequestMapping("/testUser")
	public void  testUser(User user, HttpServletResponse response){
		PrintWriter out=null;
		try {
			out=response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(user!=null){
			User u=this.adminService.selectById(user.getId());
			if(u==null){
				out.print("none");
			}
		}
		
	}
	
	
}
