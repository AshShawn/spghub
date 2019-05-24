package sgphub.user.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;
import sgphub.commons.entity.*;
import sgphub.user.service.dao.IUserService;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/user")
public class UserController {
	
	IUserService userService;
	@Resource(name="userService")
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping("/userLogin")
	public String userLogin(Account account, Model model, HttpSession session) {
		Account accountObj = this.userService.loginAccount(account.getAccount());
		
		if (accountObj!=null&&accountObj.getPassword().equals(account.getPassword())) {
			User user = this.userService.queryUserByAccount(accountObj);
			session.setAttribute("userInfo", user);
		} else {
			model.addAttribute("info", 1);
			return "forward:/UI/user/login.jsp";
		}
		

		return "redirect:/user/userMain.form";
	}
	
	/*
	 * 查询回复我的帖子
	 * @return
	 */
	/**
	 *  utils 
	 *  List 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/userMain")
	public String main(Model model, HttpSession session) {
		List<Post> list = userService.queryHot();
		model.addAttribute("hots",list);
		User user=(User) session.getAttribute("userInfo");
			model.addAttribute("hots",list);

		List<Post> list1 = userService.queryNew(user);
		if(list1 !=null && list1.size()>0){
			model.addAttribute("recommendations",list1);
		}else{
			model.addAttribute("recommendations",userService.queryNew());
		}
		List<Post> list2 = userService.queryLike(user);
		if(list2 !=null && list2.size()>0){
			model.addAttribute("likes",list2);
		}else{
			//model.addAttribute("likes",list2);
			model.addAttribute("likes",userService.queryLike());
		}
		//查询所有的父话题
		List<ParentTopic> parentTopics = this.userService.queryParentToppics();
		model.addAttribute("parentTopics", parentTopics);
		//查询轮播图
		List<Post> scrollPosts = this.userService.pjhScrollPosts();
		ObjectMapper objectMapper = new ObjectMapper();
		String str=null;
        try {
          str = objectMapper.writeValueAsString(scrollPosts);
        } catch (JsonProcessingException e) {
          e.printStackTrace();
        }
		model.addAttribute("scrollPosts", str);		
		String rnote="("+userService.replyNotes(user.getUsername())+")";
		if(userService.replyNotes(user.getUsername())==0){
			model.addAttribute("rnote", "0");
		}else{
			model.addAttribute("rnote", rnote);
		}
		String fnote="("+userService.focusNotes(user.getUsername())+")";
		if(userService.focusNotes(user.getUsername())==0){
			model.addAttribute("fnote", "0");
		}else{
			model.addAttribute("fnote", fnote);
		}
		String funote="("+userService.focusUserNotes(user.getUsername())+")";
		if(userService.focusUserNotes(user.getUsername())==0){
			model.addAttribute("funote", "0");
		}else{
			model.addAttribute("funote", funote);
		}
		return "/user/main";
		
	}
	/**
	 * 去某个父话题
	 * @param model
	 * @param ptid
	 * @return
	 */
	@RequestMapping("/goPT")
	public String goPT(Model model, HttpSession session, Integer ptid ) {
		User user = (User) session.getAttribute("userInfo");
		ParentTopic parentTopic = this.userService.queryParentTopicById(ptid);
		FocusTopic focusTopic = this.userService.pjhgoPT(user.getId(),parentTopic.getId());
		List<Post> upPosts = this.userService.pjhUpPosts(parentTopic.getId());
		List<Post> ordinaryPosts = this.userService.pjhOrdinaryPosts(parentTopic.getId());
		List<User> goodUsers = this.userService.pjhGoodUsers(parentTopic.getId());
		model.addAttribute("pt", parentTopic);
		model.addAttribute("ft", focusTopic);
		model.addAttribute("upPost", upPosts);
		model.addAttribute("ordinary", ordinaryPosts);
		model.addAttribute("goodUsers", goodUsers);
		return "/user/topic";
	}
	@RequestMapping("/addPost")
	public String addPost(Post post, Model model, HttpSession session, Integer ptid) {
	  User user = (User) session.getAttribute("userInfo");
	  PostStatus postStatus = new PostStatus();
	  postStatus.setId(1); 
	  ParentTopic parentTopic = this.userService.queryParentTopicById(ptid);
      post.setCreatTime(new Date());
      post.setLastReplyTime(new Date());
      post.setLastReplyUser(user);
      post.setUser(user);
      post.setReplyCount(0);
      post.setCheckCount(0);
	  post.setPostStatus(postStatus);
	  post.setParentTopic(parentTopic);
	  post.setFloor(1);
	  this.userService.addPost(post);
	  //更新本吧帖子数量
	  parentTopic.setPostCount(parentTopic.getPostCount()+1);
	  this.userService.updateParentTopic(parentTopic);
	  //增加经验值
	  FocusTopic focusTopic = this.userService.pjhgoPT(user.getId(),parentTopic.getId());
	  if (focusTopic!=null) {
        focusTopic.setExperience(focusTopic.getExperience()+3);
        this.userService.updateFocusTopic(focusTopic);
      } 
	  
	  return "redirect:/user/goPT.form?ptid="+ptid;
    }
	


	/*
	 * 查询回复我的帖子
	 * @return
	 */
	@RequestMapping("/userHomeReply")
	public String userHomeReply(Model model, HttpSession session, String pageNow) {
		if (pageNow==null||pageNow =="") {
			pageNow="1";
		}
		Integer page = Integer.parseInt(pageNow);
		User user=(User) session.getAttribute("userInfo");
		List<Reply> list = userService.queryUserHomeReplyByName(user.getUsername(),page);
		model.addAttribute("replies",list);	
		model.addAttribute("pageAll", userService.selectReplyPage(user.getUsername()));
		return "/user/userhome/showReply";
	}
	@RequestMapping("/userHomeReplyPage")
	public String userHomeReplyPage(Model model, HttpSession session, String pageNow) {
		User user=(User) session.getAttribute("userInfo");
		Integer page = Integer.parseInt(pageNow);
		List<Reply> list = userService.queryUserHomeReplyByName(user.getUsername(),page);
		model.addAttribute("replies",list);	
		return "/user/userHome/showReply";
	}
	
	/*
	 * 查询我回复的帖子
	 * @return
	 */
	@RequestMapping("/MyHMReply")
	public String MyReply(Model model, HttpSession session, String pageNow) {
		if (pageNow==null||pageNow =="") {
			pageNow="1";
		}
		Integer page = Integer.parseInt(pageNow);
		User user=(User) session.getAttribute("userInfo");
		List<Reply> list = userService.queryMyReplyByName(user.getUsername(),page);
		model.addAttribute("replies",list);	
		model.addAttribute("pageAll", userService.selectMyReplyPage(user.getUsername()));
		return "/user/userHome/MyReply";
	}
	@RequestMapping("/MyHMReplyPage")
	public String MyReplyPage(Model model, HttpSession session, String pageNow) {
		User user=(User) session.getAttribute("userInfo");
		Integer page = Integer.parseInt(pageNow);
		List<Reply> list = userService.queryMyReplyByName(user.getUsername(),page);
		model.addAttribute("replies",list);	
		return "/user/userHome/showMyReply";
	}
	
	/*
	 * 查询我关注的帖子
	 * @return
	 */
	@RequestMapping("/userHomeFocus")
	public String userHomeFocus(Model model, HttpSession session, String pageNow) {
		if (pageNow==null||pageNow =="") {
			pageNow="1";
		}
		Integer page = Integer.parseInt(pageNow);
		User user=(User) session.getAttribute("userInfo");
		List<FocusPost> list = userService.queryUserHomeFocusByName(user.getUsername(),page);
		model.addAttribute("focus",list);
		model.addAttribute("pageAll", userService.selectFocusPage(user.getUsername()));
		return "/user/userHome/focusPost";
	}
	@RequestMapping("/userHomeFocusPage")
	public String userHomeFocusPage(Model model, HttpSession session, String pageNow) {
		Integer page = Integer.parseInt(pageNow);
		User user=(User) session.getAttribute("userInfo");
		List<FocusPost> list = userService.queryUserHomeFocusByName(user.getUsername(),page);
		model.addAttribute("focus",list);
		for(FocusPost o : list){
			System.out.println("=====111======"+o);
		}
		return "/user/userHome/showFocus";
	}

	/*
	 * 查询我收藏的帖子
	 * @return
	 */
	@RequestMapping("/UHcollectPost")
	public String userHomeCollectPost(Model model, HttpSession session, String pageNow) {
		if (pageNow==null||pageNow =="") {
			pageNow="1";
		}
		Integer page = Integer.parseInt(pageNow);
		User user=(User) session.getAttribute("userInfo");
		List<CollectPost> list = userService.queryUHCollectPostByName(user.getUsername(),page);
		model.addAttribute("collectPosts",list);	
		model.addAttribute("pageAll", userService.selectCollectPage(user.getUsername()));
		return "/user/userHome/collectPost";
	}

	@RequestMapping("/UHcollectPostPage")
	public String userHomeCollectPostPage(Model model, HttpSession session, String pageNow) {
		Integer page = Integer.parseInt(pageNow);
		User user=(User) session.getAttribute("userInfo");
		List<CollectPost> list = userService.queryUHCollectPostByName(user.getUsername(),page);
		model.addAttribute("collectPosts",list);		
		return "/user/userHome/showCollection";
	}
	
	/*
	 * 查询我发过的帖子
	 * @return
	 */
	@RequestMapping("/myUHPost")
	public String myUHPostPost(Model model, HttpSession session, String pageNow) {
		if (pageNow==null||pageNow =="") {
			pageNow="1";
		}
		Integer page = Integer.parseInt(pageNow);
		User user=(User) session.getAttribute("userInfo");
		List<Post> list = userService.queryUHMyPostPostByName(user.getUsername(),page);
		model.addAttribute("myPosts",list);	
		model.addAttribute("pageAll", userService.selectMyPostPage(user.getUsername()));
		return "/user/userHome/MyPost";
	}

	@RequestMapping("/myUHPostPage")
	public String myUHPostPostPage(Model model, HttpSession session, String pageNow) {
		Integer page = Integer.parseInt(pageNow);
		User user=(User) session.getAttribute("userInfo");
		List<Post> list = userService.queryUHMyPostPostByName(user.getUsername(),page);
		model.addAttribute("myPosts",list);		
		return "/user/userHome/showMyPost";
	}
	
	/*
	 * 查询我浏览过的帖子
	 * @return
	 */
	@RequestMapping("/myBrowsePost")
	public String myUHBrowsePost(Model model, HttpSession session, String pageNow) {
		if (pageNow==null||pageNow =="") {
			pageNow="1";
		}
		Integer page = Integer.parseInt(pageNow);
		User user=(User) session.getAttribute("userInfo");
		List<CheckPost> list = userService.queryUHMyBrowsePostByName(user.getUsername(),page);
		model.addAttribute("browses",list);	
		model.addAttribute("pageAll", userService.selectMyBrowsePostPage(user.getUsername()));
		return "/user/userHome/MyBrowse";
	}

	@RequestMapping("/myBrowsePage")
	public String myUHBrowsePostPage(Model model, HttpSession session, String pageNow) {
		Integer page = Integer.parseInt(pageNow);
		User user=(User) session.getAttribute("userInfo");
		List<CheckPost> list = userService.queryUHMyBrowsePostByName(user.getUsername(),page);
		model.addAttribute("browses",list);		
		return "/user/userHome/showBrowse";
	}
	
	/*
	 * 查询关注我的好友
	 * @return
	 */
	@RequestMapping("/UHFriends")
	public String userHomeFriend(Account account, Model model, HttpSession session, String pageNow) {
		if (pageNow==null||pageNow =="") {
			pageNow="1";
		}
		Integer page = Integer.parseInt(pageNow);
		User user=(User) session.getAttribute("userInfo");
		//查看关注我的人
		List<FocusUser> meUsers=userService.queryUHFriendsByName(user.getUsername(), page);
		model.addAttribute("meUsers", meUsers);	
		model.addAttribute("pageAll", userService.selectFriendsPage(user.getUsername()));
		return "/user/userHome/newFriends";
	}
	@RequestMapping("/UHFriendsPage")
	public String userHomeFriendPage(Account account, Model model, HttpSession session, String pageNow) {
		Integer page = Integer.parseInt(pageNow);
		User user=(User) session.getAttribute("userInfo");
		//查看关注我的人
		List<FocusUser> meUsers=this.userService.queryUHFriendsByName(user.getUsername(), page);
		model.addAttribute("meUsers", meUsers);	
		return "/user/userHome/showFriends";
	}
	
	/*
	 * 修改我的个人信息
	 * @return
	 */
	@RequestMapping("/setUserMessage")
	public String setUserMessage(User user,HttpSession session) {
		User u = this.userService.queryUserByUserId(user.getId());
		u.setUsername(user.getUsername());
		u.setSex(user.getSex());
		u.setBirthday(user.getBirthday());
		u.getAccount().setEmail(user.getAccount().getEmail());
		u.getAccount().setTel(user.getAccount().getTel());
		userService.updateUserMessage(u);
		session.setAttribute("userInfo", u);
		return "redirect:/user/userShow.form";
	}
	
	/*
	 * 初始化时间转型
	 */
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder){
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),
	            true));
	}
	
	@RequestMapping("/register")
	private String register(Account account,HttpServletResponse response)  {
		this.userService.addUser(account);	
		return "/user/login";
		
	}	
	


	@RequestMapping("/userShow")
	public String userShow(HttpServletRequest request, Model model, HttpSession session){
		
		User user=(User) session.getAttribute("userInfo");
		int id=user.getId();
		//查关注的贴吧
		List<FocusTopic> topics=this.userService.selectTopicByUserId(id);
		model.addAttribute("topics", topics);
		//查关注的帖子
		List<FocusPost> posts=this.userService.selectPostByUserId(id);
		model.addAttribute("posts", posts);
		//查看关注的人
		List<FocusUser> users=this.userService.selectFocusUserById(id);
		model.addAttribute("users", users);
		//查看关注我的人
		List<FocusUser> meUsers=this.userService.selectFocusMeUserById(id);
		model.addAttribute("meUsers", meUsers);
		
		
		return "/user/myPage2";
	}
	
	@RequestMapping("/userDisplay")
	public String userDisplay(HttpServletRequest request, Model model, User user){
		
		User u=this.userService.selectUserById(user.getId());
		int checkCount=u.getCheckCount()+1;
		u.setCheckCount(checkCount);
		this.userService.updateUserCheckCount(u);
		model.addAttribute("user", u);
		//看是否关注
		User sessionUser=(User) request.getSession().getAttribute("userInfo");
		int count=this.userService.queryCount(sessionUser.getId(),u.getId());
		model.addAttribute("count", count);
		//查关注的贴吧
		List<FocusTopic> topics=this.userService.selectTopicByUserId(u.getId());
		model.addAttribute("topics", topics);
		//查关注的帖子
		List<FocusPost> posts=this.userService.selectPostByUserId(u.getId());
		model.addAttribute("posts", posts);
		//查看关注的人
		List<FocusUser> users=this.userService.selectFocusUserById(u.getId());
		model.addAttribute("users", users);
		//查看关注我的人
		List<FocusUser> meUsers=this.userService.selectFocusMeUserById(u.getId());
		model.addAttribute("meUsers", meUsers);
		
		
		return "/user/userPage";
	}

	@RequestMapping("/addImage")
	public String addImage(MultipartFile image, Model model, HttpServletRequest request){
		if(image!=null){
			String path = request.getServletContext().getRealPath("/User-images");
			String originalFilename=image.getOriginalFilename();
			User user=(User) request.getSession().getAttribute("userInfo");
			String newFileName=user.getId()+originalFilename.substring(originalFilename.lastIndexOf("."));
			File newFile=new File(path,newFileName);
			try {
				image.transferTo(newFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			user.setImgURL(newFileName);
		    request.getSession().setAttribute("userInfo", user);
			this.userService.addRealUser(user);

		}		
		
		return "redirect:/user/userShow.form";

	}

	
	
	

	
	
	
	
	@RequestMapping("focusUser")
	public void focusUser(FocusUser fu,HttpServletResponse response){
		this.userService.addFocusUser(fu);
		PrintWriter out=null;
		try {
			out=response.getWriter();
			out.print("focus");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(out!=null){
			out.close();
		}
		
	}
	
	@RequestMapping("cancelFocusUser")
	public void cancelFocusUser(FocusUser fu,HttpServletResponse response){
		this.userService.cancelFocusUser(fu);
		PrintWriter out=null;
		try {
			out=response.getWriter();
			out.print("cancel");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(out!=null){
			out.close();
		}
		
	}

	/**
	 * 根据postID 查询post,查询reply,reply的id查询childreplay.
	 * user user信息  
	 */
	@RequestMapping("/showPostById")
	public String showPostById(HttpServletRequest req, Model model, Integer postId, HttpSession session){
		Post post = this.userService.queryPostById(postId);
		List<Reply> replys = this.userService.queryReplyByPostId(postId);
		ParentTopic parentTopic = this.userService.queryParentTopicById(post.getParentTopic().getId());
		FocusTopic focustopic = this.userService.queryFocusTopic(parentTopic.getId(), post.getUser().getId());
		User user = (User) session.getAttribute("userInfo");
		FocusTopic userfocustopic = this.userService.queryFocusTopic(parentTopic.getId(), user.getId());
		model.addAttribute("post",post);//帖子信息
		model.addAttribute("replys", replys);//Reply集合
		model.addAttribute("focustopic",focustopic);//1L用户经验
		model.addAttribute("userfocustopic",userfocustopic);//登录的用户经验
		List<ChildReply> lists= new ArrayList<ChildReply>();
		List<FocusTopic> focusTopics= new ArrayList<FocusTopic>();
		for(Reply reply:replys){
			List<ChildReply> childReplys=this.userService.queryChildReplyByReplyId(reply.getId());
			lists.addAll(childReplys);
			FocusTopic focusTopic =this.userService.queryFocusTopic(parentTopic.getId(), reply.getUser().getId());
			focusTopics.add(focusTopic);
		}
		model.addAttribute("focusTopics", focusTopics);//回复人在本吧信息
		model.addAttribute("lists", lists);//所有的子回复
		post.setCheckCount(post.getCheckCount()+1);//帖子浏览+1
		this.userService.updatePost(post);//更新帖子
		CheckPost checkPost = new CheckPost();
		checkPost.setPost(post);
		checkPost.setUser(user);
		checkPost.setCheckTime(new Date());
		this.userService.addCheckPost(checkPost);

		return "/user/post";
	}
	/**
	 *回复帖子 //
	 */
	@RequestMapping("/addReply")
	public String addReply(HttpServletRequest req,Reply reply,HttpSession session){
		Post post = this.userService.queryPostById(Integer.valueOf(req.getParameter("ptid")));
		User user = (User) session.getAttribute("userInfo");
		Date date = new Date();
		reply.setPost(post);
		reply.setCreatTime(date);
		reply.setUser(user);
		//调用添加Reply方法
		userService.addReply(reply);
		//更新帖子
		post.setFloor(post.getFloor()+1);
		post.setLastReplyTime(date);
		post.setLastReplyUser(user);
		post.setReplyCount(post.getReplyCount()+1);//设置默认rc
		this.userService.updatePost(post);
		
		//给关注的用户加经验
		FocusTopic focusTopic=this.userService.pjhgoPT(user.getId(), post.getParentTopic().getId());
		if (focusTopic != null) {
		    focusTopic.setExperience(focusTopic.getExperience()+1);//设置默认经验
	        this.userService.updateFocusTopic(focusTopic);
        }
		return "redirect:/user/showPostById.form?postId="+post.getId();
	}
	

	/**
	 * 添加收藏贴
	 */
	@RequestMapping("/addCollectPost")
	public void addCollectPost(HttpSession session,HttpServletRequest req,HttpServletResponse response){
		PrintWriter out=null;
		try {
			CollectPost collectpost = new CollectPost();
			User user = (User) session.getAttribute("userInfo");
			collectpost.setUser(user);
			//System.out.println(Integer.valueOf(req.getParameter("postId")));
			Post post = this.userService.queryPostById(Integer.valueOf(req.getParameter("postId")));
			collectpost.setPost(post);
			Date date = new Date();
			collectpost.setCollectTime(date);
			this.userService.addCollectPost(collectpost);
			out=response.getWriter();
			out.print("0");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(out!=null){
			out.close();
		}
		
	}
	@RequestMapping("/queryAction")
	public String queryAction(Model model){
			List<Action> actions = this.userService.queryAction();
			model.addAttribute("actions",actions);
		return "/user/actionCenter";
	}
	@RequestMapping("/changePostStatus")
	public void changePostStatus(HttpServletResponse response,HttpServletRequest req){
		PrintWriter out=null;
		try {
			Post post= this.userService.queryPostById(Integer.valueOf(req.getParameter("postId")));
			post.getPostStatus().setId(3);
			this.userService.updatePost(post);
			out=response.getWriter();
			out.print("0");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(out!=null){
			out.close();
		}
	}
	@RequestMapping("/modifyPost")
	public void modifyPost(HttpServletResponse response,HttpServletRequest req){
		PrintWriter out=null;
		try {
			Post post= this.userService.queryPostById(Integer.valueOf(req.getParameter("postId")));
			post.getPostStatus().setId(2);
			this.userService.updatePost(post);
			out=response.getWriter();
			out.print("0");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(out!=null){
			out.close();
		}
	}
	@RequestMapping("/cancePost")
	public void cancePost(HttpServletResponse response,HttpServletRequest req){
		PrintWriter out=null;
		try {
			Post post= this.userService.queryPostById(Integer.valueOf(req.getParameter("postId")));
			post.getPostStatus().setId(1);
			this.userService.updatePost(post);
			out=response.getWriter();
			out.print("0");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(out!=null){
			out.close();
		}
	}
	@RequestMapping("/deletePost")
	public void deletePost(HttpServletResponse response,HttpServletRequest req){
		PrintWriter out=null;
		try {
			this.userService.removePost(Integer.valueOf(req.getParameter("postId")));
			out=response.getWriter();
			out.print("0");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(out!=null){
			out.close();
		}
	}
	@RequestMapping("/focusPostUser")
	public void focusPostUser(HttpServletResponse response,HttpServletRequest req,HttpSession session){
		PrintWriter out=null;
		try {
			Post post = this.userService.queryPostById(Integer.valueOf(req.getParameter("postId")));
			User user = (User) session.getAttribute("userInfo");
			FocusPost focuspost = new FocusPost();
			focuspost.setPost(post);
			focuspost.setUser(user);
			this.userService.addFocusPost(focuspost);
			out=response.getWriter();
			out.print("0");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(out!=null){
			out.close();
		}
		
	}
	@RequestMapping("/cancelFocusPostUser")
	public void cancelFocusPostUser(HttpServletResponse response,HttpServletRequest req,HttpSession session){
		PrintWriter out=null;
		try {
			User user = (User) session.getAttribute("userInfo");
			this.userService.removeFocusPost(user.getId(),Integer.valueOf(req.getParameter("postId")));
			out=response.getWriter();
			out.print("0");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(out!=null){
			out.close();
		}
		
	}
	@RequestMapping("/showPostMaster")
	public String showPostMaster(HttpServletRequest req, Model model){
		Post post = this.userService.queryPostById(Integer.valueOf(req.getParameter("postId")));
		int id2 = post.getUser().getId();
		List<Reply> replys = this.userService.queryReply(Integer.valueOf(req.getParameter("postId")), id2);
		model.addAttribute("replys", replys);
		return "/user/loadReply";
	}
	@RequestMapping("/takeAction")
	public String  takeAction(HttpServletRequest req){
		
			Action action = this.userService.queryActionById(Integer.valueOf(req.getParameter("actionid")));
			int count = action.getJoinCount();
			action.setJoinCount(count+1);
			this.userService.modifyAction(action);
			
		
		return"redirect:/user/queryAction.form";
		
	}
	@RequestMapping("/showOneAction")
	public String showOneAction(Model model, HttpServletRequest req){
		Action action = this.userService.queryActionById(Integer.valueOf(req.getParameter("actionid")));
		
		List<ActionReply> actionrpeplys = this.userService.queryActionReplyByAction(action.getId());
		
		model.addAttribute("action", action);
		model.addAttribute("actionrpeplys", actionrpeplys);
		return"/user/showAction";
	}
	@RequestMapping("/addActionReply")
	public String addActionReply(HttpSession session,ActionReply actionreply,HttpServletRequest req){
		//ActionReply actionreply = new ActionReply();
		Action action = this.userService.queryActionById(Integer.valueOf(req.getParameter("actionid")));
		User user = (User) session.getAttribute("userInfo");
		actionreply.setAction(action);
		actionreply.setUser(user);
		actionreply.setApproval(0);
		this.userService.addActionReply(actionreply);
		return "redirect:/user/showOneAction.form?actionid="+action.getId();
	}

	/**
	 * 退出
	 */
	@RequestMapping("/exit")
	public String exit(HttpSession session){
		
		session.invalidate();
		
		return "redirect:/index.jsp";
		
	}
	
	@RequestMapping("/addAdvice")
	public String addAdvice(HttpSession session,Advice advice){
		User user=(User) session.getAttribute("userInfo");
		advice.setDealTime(new Date());
		advice.setUser(user);
		this.userService.addAdvice(advice);
		return "redirect:/user/userMain.form";
	}
	
		
	
	/**
	 * 在post页面 点击申请的跳转方法
	 * @param model
	 * @param req
	 * @return
	 */
	@RequestMapping("/applyService")
	public String applyService(Model model, HttpServletRequest req){
		//加判断  用AJAX做


		ParentTopic parenttopic = this.userService.queryParentTopicById(Integer.valueOf(req.getParameter("ptid")));
		model.addAttribute("parenttopic", parenttopic);
		return "/user/applyService";
	} 
	/**
	 * 在applyService页面的Form表单的提交
	 * @param apply
	 * @param req
	 * @param session
	 * @return
	 */
	@RequestMapping("/apply")
	public String apply(ApplyServicer apply,HttpServletRequest req,HttpSession session){
		Date date = new Date();
		apply.setDate(date);
		AdviceStatus adviceStatus= new AdviceStatus();
		adviceStatus.setId(1);
		apply.setAdviceStatus(adviceStatus);
		User user = (User) session.getAttribute("userInfo");
		FocusTopic ftopic = this.userService.queryFocusTopic(Integer.valueOf(req.getParameter("ptopicid")),user.getId());
		apply.setFocusTopic(ftopic);
		apply.setUser(user);
		this.userService.addApplyServicer(apply);
		return "/user/applyService";
	}
	

}
