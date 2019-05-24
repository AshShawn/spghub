package sgphub.commons.entity;

import javax.persistence.*;


@Entity
@Table
public class OperateType {
	/**
	 * 操作类型
	 */
	private Integer id;
	private String operateName;
	public OperateType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OperateType(Integer id, String operateName) {
		super();
		this.id = id;
		this.operateName = operateName;
	}
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(length=10)
	public String getOperateName() {
		return operateName;
	}
	public void setOperateName(String operateName) {
		this.operateName = operateName;
	}
	
	
}
