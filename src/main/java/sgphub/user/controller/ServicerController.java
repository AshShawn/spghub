package sgphub.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import sgphub.commons.entity.*;
import sgphub.user.service.dao.IUserService;


@Controller
@RequestMapping("/servicer")
public class ServicerController {
      IUserService userService;
      @Resource(name="userService")
      public void setUserService(IUserService userService) {
        this.userService = userService;
      }
      
      @RequestMapping("/userService")
      public String userService(Integer ptid, HttpSession session, Model model) {
        if (session.getAttribute("service_pt")!=null) {
          session.removeAttribute("service_pt");
        }
       ParentTopic parentTopic = this.userService.queryParentTopicById(ptid);
       int userCount = this.userService.serviceQueryUserCount(parentTopic);
       int bigCount = this.userService.serviceQueryBigCount(parentTopic);
       int smallCount = this.userService.serviceQuerySmallCount(parentTopic);
       int goodUserCount = this.userService.serviceQueryGoodCount(parentTopic);
       session.setAttribute("service_pt",parentTopic);
       session.setAttribute("userCount",userCount);
       session.setAttribute("bigCount",bigCount);
       session.setAttribute("smallCount",smallCount);  
       session.setAttribute("goodUserCount",goodUserCount);
       return "/service/userService";
      }
      
      @RequestMapping("/info")
      public String info(Integer ptid, HttpSession session, Model model) {
        if (session.getAttribute("userCount")!=null) {
          session.removeAttribute("userCount");
          session.removeAttribute("bigCount");
          session.removeAttribute("smallCount");
          session.removeAttribute("goodUserCount");
        }
        
       ParentTopic parentTopic = this.userService.queryParentTopicById(ptid);
       int userCount = this.userService.serviceQueryUserCount(parentTopic);
       int bigCount = this.userService.serviceQueryBigCount(parentTopic);
       int smallCount = this.userService.serviceQuerySmallCount(parentTopic);
       int goodUserCount = this.userService.serviceQueryGoodCount(parentTopic);
       model.addAttribute("service_pt",parentTopic);
       model.addAttribute("userCount",userCount);
       model.addAttribute("bigCount",bigCount);
       model.addAttribute("smallCount",smallCount);  
       model.addAttribute("goodUserCount",goodUserCount);
       return "/service/info";
      }
      
      @RequestMapping("/team")
      public String team(Integer ptid, HttpSession session, Model model) {
        ParentTopic parentTopic =(ParentTopic) session.getAttribute("service_pt");
        List<ServicerOperateHistory> teams = this.userService.serviceQueryTeam(parentTopic);
        model.addAttribute("team", teams);
        return "/service/team";
      }
      
      @RequestMapping("/message")
      public String message(Integer ptid, HttpSession session, Model model) {
        ParentTopic parentTopic =(ParentTopic) session.getAttribute("service_pt");
        List<ServicerOperateHistory> servicerOperateHistories = this.userService.serviceQueryBlackUser(parentTopic);
        model.addAttribute("message", servicerOperateHistories);
        
        return "/service/message";
      }
      @RequestMapping("/history")
      public String history(Integer ptid, HttpSession session, Model model) {
        ParentTopic parentTopic =(ParentTopic) session.getAttribute("service_pt");
        List<ServicerOperateHistory> servicerOperateHistories= this.userService.serviceQueryHistory(parentTopic);
        model.addAttribute("history", servicerOperateHistories);
        
        return "/service/history";
      }
      
      @RequestMapping("/search")
      public String search(Integer ptid, HttpSession session, Model model, String search) {
        
        search = search.trim();
        model.addAttribute("search", search);
        if (ptid!=null) {
          ParentTopic parentTopic =this.userService.queryParentTopicById(ptid);
          List<Post> posts = this.userService.searchPt(parentTopic,search);
          model.addAttribute("posts", posts);
          model.addAttribute("pt", parentTopic);
        } else {
          List<Post> posts = this.userService.searchAll(search);
          model.addAttribute("posts", posts);
        }
      
        
        return "/search/main";
      }
      @RequestMapping("/queryApplyServicer")
      public String queryApplyServicer(Model model){
    	  List<ApplyServicer> applys= this.userService.queryApplyServicer();
    	  model.addAttribute("applys", applys);
    	  return "/service/serviceApply";
      }
      @RequestMapping("/modifyApplyStatus")
      public String modifyApplyStatus(HttpServletRequest req,HttpSession session){
    	  //先把用户的权限修改了
    	  ApplyServicer apply=this.userService.queryApplyServicer(Integer.valueOf(req.getParameter("id")));
    	  //根据 apply的FT 和 user 修改user的权限
    	  FocusTopic ft =this.userService.queryFocusTopicByUserId(apply.getUser().getId());
    	  ft.getTopicPermession().setId(3);
    	  AdviceStatus status = new AdviceStatus();
    	  status.setId(1);
    	  apply.setAdviceStatus(status);//1处理中2未处理
    	  this.userService.addApplyServicer(apply);
    	  //添加操作记录
    	  ServicerOperateHistory history = new ServicerOperateHistory();
    	  Date date = new Date();
    	  OperateType otype= new OperateType();
    	  otype.setId(2);
    	  User user = (User) session.getAttribute("userInfo");
    	  history.setFocusTopic(ft);
    	  history.setOperateTime(date);
    	  history.setUser(user);
    	  history.setOperateType(otype);
    	  this.userService.addServicerOperateHistory(history);
    	  return "/service/userService";
      }
      @RequestMapping("/registerTest")
      public void registerTest(HttpServletResponse response,HttpServletRequest req){
    	  PrintWriter out=null;
  		try {
  			Account account= this.userService.loginAccount(req.getParameter("name"));
  			if(account != null ){
  				out=response.getWriter();
  	  			out.print("0");
  			}//存在
  			
  		} catch (IOException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
  		if(out!=null){
  			out.close();
  		}
    	  
      }
}
