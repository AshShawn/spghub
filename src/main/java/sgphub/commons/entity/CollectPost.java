package sgphub.commons.entity;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table
public class CollectPost {
	/**
	 * 用户收藏的帖子
	 */
	private Integer id;
	private User user;
	private Post post;
	private Date collectTime;
	public CollectPost(Integer id, User user, Post post, Date collectTime) {
		super();
		this.id = id;
		this.user = user;
		this.post = post;
		this.collectTime = collectTime;
	}
	public CollectPost() {
		super();
		// TODO Auto-generated constructor stub
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
	@Temporal(TemporalType.DATE)
	public Date getCollectTime() {
		return collectTime;
	}
	public void setCollectTime(Date collectTime) {
		this.collectTime = collectTime;
	}
	@Override
	public String toString() {
		return "CollectPost [id=" + id + ", user=" + user + ", post=" + post
				+ ", collectTime=" + collectTime + "]";
	}
	
}
