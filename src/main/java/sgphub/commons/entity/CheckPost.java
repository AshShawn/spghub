package sgphub.commons.entity;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table
public class CheckPost {
	/**
	 * 用户浏览过的帖子
	 */
	private Integer id;
	private User user;
	private Post post;
	private Date checkTime;
	public CheckPost() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CheckPost(Integer id, User user, Post post, Date checkTime) {
    super();
    this.id = id;
    this.user = user;
    this.post = post;
    this.checkTime = checkTime;
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
	@JoinColumn(name="postID")
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
  public Date getCheckTime() {
    return checkTime;
  }
  public void setCheckTime(Date checkTime) {
    this.checkTime = checkTime;
  }
	
}
