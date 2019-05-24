package sgphub.commons.entity;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="action")
public class Action {
	/**
	 * 活动
	 */
	private Integer id;
	private String name;
	private String introduction;
	private Integer joinCount;
	private Date creatTime;
	private ActionStatus actionStatus;
	private String imgURL;
	public Action() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Action(Integer id, String name, String introduction,
			Integer joinCount, Date creatTime, ActionStatus actionStatus,
			String imgURL) {
		super();
		this.id = id;
		this.name = name;
		this.introduction = introduction;
		this.joinCount = joinCount;
		this.creatTime = creatTime;
		this.actionStatus = actionStatus;
		this.imgURL = imgURL;
	}


	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name="name",length=20)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name="introduction",length=50)
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public Integer getJoinCount() {
		return joinCount;
	}
	public void setJoinCount(Integer joinCount) {
		this.joinCount = joinCount;
	}
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	@Column(length=20)
	public String getImgURL() {
		return imgURL;
	}
	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}
	@ManyToOne
	@JoinColumn(name="actionStatusID")
	public ActionStatus getActionStatus() {
		return actionStatus;
	}

	public void setActionStatus(ActionStatus actionStatus) {
		this.actionStatus = actionStatus;
	}
	
	

}
