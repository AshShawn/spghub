package sgphub.commons.entity;

import javax.persistence.*;

@Entity
@Table(name="ActionStatus")
public class ActionStatus {
	/**
	 * 活动状态
	 */
	private Integer id;
	private String statusName;
	public ActionStatus() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ActionStatus(Integer id, String statusName) {
		super();
		this.id = id;
		this.statusName = statusName;
	}
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(length=5)
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	
}
