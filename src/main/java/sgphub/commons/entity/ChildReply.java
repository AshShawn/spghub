package sgphub.commons.entity;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table
public class ChildReply {
	/**
	 * 楼中楼
	 */
	private Integer id;
	//被回复的人
	private User toUser;
	//回复的人
	private User reUser;
	private String text;
	private Date creatTime;
	private Reply reply;
	public ChildReply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChildReply(Integer id, User toUser, User reUser, String text,
			Date creatTime, Reply reply) {
		super();
		this.id = id;
		this.toUser = toUser;
		this.reUser = reUser;
		this.text = text;
		this.creatTime = creatTime;
		this.reply = reply;
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
	@JoinColumn(name="toUserID")
	public User getToUser() {
		return toUser;
	}
	public void setToUser(User toUser) {
		this.toUser = toUser;
	}
	@ManyToOne
	@JoinColumn(name="reUserID")
	public User getReUser() {
		return reUser;
	}
	public void setReUser(User reUser) {
		this.reUser = reUser;
	}
	@Column(length=50)
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	@ManyToOne
	@JoinColumn(name="replyID")
	public Reply getReply() {
		return reply;
	}
	public void setReply(Reply reply) {
		this.reply = reply;
	}
	
	

}
