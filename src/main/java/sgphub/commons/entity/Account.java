package sgphub.commons.entity;

import javax.persistence.*;

@Entity
@Table(name="account")
public class Account {
	
	/**
	 * 账号实体类
	 */
	private Integer id;
	private String account;
	private String password;
	private String tel;
	private String email;
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public String getTel() {
		return tel;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public Account(Integer id, String account, String password, String tel,
			String email) {
		super();
		this.id = id;
		this.account = account;
		this.password = password;
		this.tel = tel;
		this.email = email;
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
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	@Column(length=20)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}



	@Override
	public String toString() {
		return "Account [id=" + id + ", account=" + account + ", password="
				+ password + ", tel=" + tel + ", email=" + email + "]";
	}

	
	

}
