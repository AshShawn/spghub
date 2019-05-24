package sgphub.commons.entity;


import javax.persistence.*;

@Entity
@Table
public class FocusPost {
	/**
	 * 用户关注的帖子
	 */
	private Integer id;
	private User user;
	private Post post;
	private Integer count;
	public FocusPost() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public FocusPost(Integer id, User user, Post post, Integer count) {
    super();
    this.id = id;
    this.user = user;
    this.post = post;
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
	@JoinColumn(name="postID")
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	  
	  public Integer getCount() {
	    return count;
	  }

	  public void setCount(Integer count) {
	    this.count = count;
	  }

	@Override
	public String toString() {
		return "FocusPost [id=" + id + ", user=" + user + ", post=" + post
				+ ", count=" + count + "]";
	}
	  
	
	

}
