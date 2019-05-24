package sgphub.commons.entity;

import javax.persistence.*;

@Entity
@Table
public class Fans {
	/**
	 * 用户粉丝
	 */
	private Integer id;
	private User user;
	private User fanUser;
	public Fans() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Fans(Integer id, User user, User fanUser) {
		super();
		this.id = id;
		this.user = user;
		this.fanUser = fanUser;
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
	@JoinColumn(name="userID")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@ManyToOne
	@JoinColumn(name="fanUserID")
	public User getFanUser() {
		return fanUser;
	}
	public void setFanUser(User fanUser) {
		this.fanUser = fanUser;
	}
	
}
