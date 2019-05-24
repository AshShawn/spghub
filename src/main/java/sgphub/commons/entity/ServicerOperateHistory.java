package sgphub.commons.entity;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table
public class ServicerOperateHistory {
	/**
	 * 吧务操作记录
	 */
	private Integer id;
	private FocusTopic focusTopic;
	private User user;
	private OperateType operateType;
	private String oldHistory;
	private String newRecord;
	private Date operateTime;
	public ServicerOperateHistory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ServicerOperateHistory(Integer id, FocusTopic focusTopic, User user,
			OperateType operateType, String oldHistory, String newRecord,
			Date operateTime) {
		super();
		this.id = id;
		this.focusTopic = focusTopic;
		this.user = user;
		this.operateType = operateType;
		this.oldHistory = oldHistory;
		this.newRecord = newRecord;
		this.operateTime = operateTime;
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
	@JoinColumn(name="focusTopicID")
	public FocusTopic getFocusTopic() {
		return focusTopic;
	}
	public void setFocusTopic(FocusTopic focusTopic) {
		this.focusTopic = focusTopic;
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
	@JoinColumn(name="operateTypeID")
	public OperateType getOperateType() {
		return operateType;
	}
	public void setOperateType(OperateType operateType) {
		this.operateType = operateType;
	}
	public String getOldHistory() {
		return oldHistory;
	}
	public void setOldHistory(String oldHistory) {
		this.oldHistory = oldHistory;
	}
	public String getNewRecord() {
		return newRecord;
	}
	public void setNewRecord(String newRecord) {
		this.newRecord = newRecord;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getOperateTime() {
		return operateTime;
	}
	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}
	

}
