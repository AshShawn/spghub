package sgphub.commons.entity;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table
public class Reply {
	/**
	 * 帖子回复
	 */
	private Integer id;
	private User user;
	private String replyText;
	private Post post;
	private Date creatTime;
	private Integer approval;
	private Integer floor;
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Reply(Integer id, User user, String replyText, Post post,
      Date creatTime, Integer approval, Integer floor) {
    super();
    this.id = id;
    this.user = user;
    this.replyText = replyText;
    this.post = post;
    this.creatTime = creatTime;
    this.approval = approval;
    this.floor = floor;
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
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}
	@ManyToOne
	@JoinColumn(name="postID")
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	@Temporal(value = TemporalType.TIMESTAMP)
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	public Integer getApproval() {
		return approval;
	}
	public void setApproval(Integer approval) {
		this.approval = approval;
	}
	
  @Override
  public String toString() {
    return "Reply [id=" + id + ", user=" + user + ", replyText=" + replyText
        + ", post=" + post + ", creatTime=" + creatTime + ", approval="
        + approval + ", floor=" + floor + "]";
  }
  public Integer getFloor() {
    return floor;
  }
  public void setFloor(Integer floor) {
    this.floor = floor;
  }
	
}
