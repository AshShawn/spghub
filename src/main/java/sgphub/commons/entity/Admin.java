package sgphub.commons.entity;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table
public class Admin {
	/**
	 * 后台管理员
	 */
	private Integer id;
	private String name;
	private String password;
	private Date lastLogin;
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Admin(Integer id, String name, String password, Date lastLogin) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.lastLogin = lastLogin;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}
	@Column(length=10)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Admin [id=" + id + ", name=" + name + ", password=" + password
				+ ", lastLogin=" + lastLogin + "]";
	}
	
}
