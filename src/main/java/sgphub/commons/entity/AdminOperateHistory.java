package sgphub.commons.entity;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table
public class AdminOperateHistory {
	/**
	 * 后台操作记录表
	 */
	private Integer id;
	private Admin admin;
	private String type;
	private OperateType operateType;
	private String oldHistory;
	private String newRecord;
	private Date operateTime;
	public AdminOperateHistory() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AdminOperateHistory(Integer id, Admin admin, String type,
			OperateType operateType, String oldHistory, String newRecord,
			Date operateTime) {
		super();
		this.id = id;
		this.admin = admin;
		this.type = type;
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
	@JoinColumn(name="adminID")
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@ManyToOne
	@JoinColumn(name="operateTypeID")
	public OperateType getOperateType() {
		return operateType;
	}
	public void setOperateType(OperateType operateType) {
		this.operateType = operateType;
	}
	@Column(length=10)
	public String getOldHistory() {
		return oldHistory;
	}
	public void setOldHistory(String oldHistory) {
		this.oldHistory = oldHistory;
	}
	@Column(length=10)
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
