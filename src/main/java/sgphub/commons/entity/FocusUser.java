package sgphub.commons.entity;

import javax.persistence.*;

@Entity
@Table
public class FocusUser {
	/**
	 * 用户关注的人
	 */
	private Integer id;
	private User user;
	private User focusUser;
	private Integer count;
	public FocusUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public FocusUser(Integer id, User user, User focusUser, Integer count) {
		super();
		this.id = id;
		this.user = user;
		this.focusUser = focusUser;
		this.count = count;
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
	@JoinColumn(name="focusUserID")
	public User getFocusUser() {
		return focusUser;
	}
	public void setFocusUser(User focusUser) {
		this.focusUser = focusUser;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
}
