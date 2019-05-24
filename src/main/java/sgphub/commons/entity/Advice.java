package sgphub.commons.entity;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table
public class Advice {
	/**
	 * 建议与反馈
	 */
	private Integer id;
	private User user;
	private String title;
	private String text;
	private AdviceStatus adviceStatus;
	private Date dealTime;
	private User dealUser;
	private ParentTopic parentTopic;
	public Advice() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Advice(Integer id, User user, String title, String text,
      AdviceStatus adviceStatus, Date dealTime, User dealUser,
      ParentTopic parentTopic) {
    super();
    this.id = id;
    this.user = user;
    this.title = title;
    this.text = text;
    this.adviceStatus = adviceStatus;
    this.dealTime = dealTime;
    this.dealUser = dealUser;
    this.setParentTopic(parentTopic);
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
	@Column(length=20)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@ManyToOne
	@JoinColumn(name="adviceStatusID")
	public AdviceStatus getAdviceStatus() {
		return adviceStatus;
	}
	public void setAdviceStatus(AdviceStatus adviceStatus) {
		this.adviceStatus = adviceStatus;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getDealTime() {
		return dealTime;
	}
	public void setDealTime(Date dealTime) {
		this.dealTime = dealTime;
	}
	@ManyToOne
	@JoinColumn(name="dealUserID")
	public User getDealUser() {
		return dealUser;
	}
	public void setDealUser(User dealUser) {
		this.dealUser = dealUser;
	}
  @ManyToOne
  public ParentTopic getParentTopic() {
    return parentTopic;
  }

  public void setParentTopic(ParentTopic parentTopic) {
    this.parentTopic = parentTopic;
  }
	
}
