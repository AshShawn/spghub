package sgphub.commons.entity;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table
public class Post {
	/**
	 * 主题帖
	 */
	private Integer id;
	private String postName;
	private String postText;
	private User user;
	private Date creatTime; 
	private Date lastReplyTime;
	private User lastReplyUser;
	private Integer replyCount;
	private Integer checkCount;
	private PostStatus postStatus;
	private ParentTopic parentTopic;
	private ChildTopic childTopic;
	private Integer floor;
	private String imgURL;
	private String scrollbg;
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public Post(Integer id, String postName, String postText, User user,
      Date creatTime, Date lastReplyTime, User lastReplyUser,
      Integer replyCount, Integer checkCount, PostStatus postStatus,
      ParentTopic parentTopic, ChildTopic childTopic, Integer floor,
      String imgURL, String scrollbg) {
    super();
    this.id = id;
    this.postName = postName;
    this.postText = postText;
    this.user = user;
    this.creatTime = creatTime;
    this.lastReplyTime = lastReplyTime;
    this.lastReplyUser = lastReplyUser;
    this.replyCount = replyCount;
    this.checkCount = checkCount;
    this.postStatus = postStatus;
    this.parentTopic = parentTopic;
    this.childTopic = childTopic;
    this.floor = floor;
    this.imgURL = imgURL;
    this.setScrollbg(scrollbg);
  }



  @Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(length=20)
	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}
	public String getPostText() {
		return postText;
	}
	public void setPostText(String postText) {
		this.postText = postText;
	}
	@ManyToOne
	@JoinColumn(name="userID",nullable=false)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getLastReplyTime() {
		return lastReplyTime;
	}
	public void setLastReplyTime(Date lastReplyTime) {
		this.lastReplyTime = lastReplyTime;
	}
	@ManyToOne
	@JoinColumn(name="lastReplyUserID")
	public User getLastReplyUser() {
		return lastReplyUser;
	}
	public void setLastReplyUser(User lastReplyUser) {
		this.lastReplyUser = lastReplyUser;
	}
	public Integer getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(Integer replyCount) {
		this.replyCount = replyCount;
	}
	public Integer getCheckCount() {
		return checkCount;
	}
	public void setCheckCount(Integer checkCount) {
		this.checkCount = checkCount;
	}
	@ManyToOne
	@JoinColumn(name="postStatusID")
	public PostStatus getPostStatus() {
		return postStatus;
	}
	public void setPostStatus(PostStatus postStatus) {
		this.postStatus = postStatus;
	}
	@ManyToOne
	@JoinColumn(name="parentTopicID",nullable=false)
	public ParentTopic getParentTopic() {
		return parentTopic;
	}
	public void setParentTopic(ParentTopic parentTopic) {
		this.parentTopic = parentTopic;
	}
	@ManyToOne
	@JoinColumn(name="childTopicID")
	public ChildTopic getChildTopic() {
		return childTopic;
	}
	public void setChildTopic(ChildTopic childTopic) {
		this.childTopic = childTopic;
	}
	public Integer getFloor() {
		return floor;
	}
	public void setFloor(Integer floor) {
		this.floor = floor;
	}
	
	public String getImgURL() {
		return imgURL;
	}
	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}



  public String getScrollbg() {
    return scrollbg;
  }



  public void setScrollbg(String scrollbg) {
    this.scrollbg = scrollbg;
  }



  @Override
  public String toString() {
    return "Post [id=" + id + ", postName=" + postName + ", postText="
        + postText + ", user=" + user + ", creatTime=" + creatTime
        + ", lastReplyTime=" + lastReplyTime + ", lastReplyUser="
        + lastReplyUser + ", replyCount=" + replyCount + ", checkCount="
        + checkCount + ", postStatus=" + postStatus + ", parentTopic="
        + parentTopic + ", childTopic=" + childTopic + ", floor=" + floor
        + ", imgURL=" + imgURL + ", scrollbg=" + scrollbg + "]";
  }
	
	

}
