package sgphub.commons.entity;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class ActionReply {
	/**
	 * 活动回复
	 */
	private Integer id;
	private User user;
	private String reply;
	private Action action;
	//赞同数
	private Integer approval;
	public ActionReply() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ActionReply(Integer id, User user, String reply, Integer approval,Action action) {
		super();
		this.id = id;
		this.user = user;
		this.reply = reply;
		this.approval = approval;
		this.action= action;
	}
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@ManyToOne
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Integer getApproval() {
		return approval;
	}
	public void setApproval(Integer approval) {
		this.approval = approval;
	}

  @ManyToOne
  public Action getAction() {
    return action;
  }

  public void setAction(Action action) {
    this.action = action;
  }


	
}
