package sgphub.commons.entity;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table
public class JoinAction {
	/**
	 * 参与的活动
	 */
	private Integer id;
	private Action action;
	private Date joinTime;
	private User user;
	public JoinAction() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public JoinAction(Integer id, Action action, Date joinTime, User user) {
		super();
		this.id = id;
		this.action = action;
		this.joinTime = joinTime;
		this.setUser(user);
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
	@JoinColumn(name="actionID")
	public Action getAction() {
		return action;
	}
	public void setAction(Action action) {
		this.action = action;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getJoinTime() {
		return joinTime;
	}
	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}
	@ManyToOne
	@JoinColumn(name="userID")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
