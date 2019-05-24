package sgphub.commons.entity;

import javax.persistence.*;

@Entity
@Table
public class AdviceStatus {
	/**
	 * 建议与反馈状态
	 * 受理中、已受理
	 */
	private Integer id;
	private String statusname;
	public AdviceStatus() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdviceStatus(Integer id, String statusname) {
		super();
		this.id = id;
		this.statusname = statusname;
	}
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(length=6)
	public String getStatusname() {
		return statusname;
	}
	public void setStatusname(String statusname) {
		this.statusname = statusname;
	}

}
