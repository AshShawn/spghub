package sgphub.commons.entity;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="user")
public class User {
	/**
	 * 用户实体
	 */
	private Integer id;
	private Account account;
	private String username;
	private String imgURL;
	private String sex;
	private Date birthday;
	private Date createDate;
	private Integer postCount;
	private Integer focusUserCount;
	private Integer fansCount;
	private Integer replyCount;
	private Integer focusPostCount;
	private Integer checkCount;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(Integer id, Account account, String username, String imgURL,
			String sex, Date birthday, Date createDate, Integer postCount,
			Integer focusUserCount, Integer fansCount, Integer replyCount,
			Integer focusPostCount, Integer checkCount) {
		super();
		this.id = id;
		this.account = account;
		this.username = username;
		this.imgURL = imgURL;
		this.sex = sex;
		this.birthday = birthday;
		this.createDate = createDate;
		this.postCount = postCount;
		this.focusUserCount = focusUserCount;
		this.fansCount = fansCount;
		this.replyCount = replyCount;
		this.focusPostCount = focusPostCount;
		this.checkCount = checkCount;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Column(length=20)
	public String getImgURL() {
		return imgURL;
	}
	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}
	@Column(length=2)
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	@Temporal(TemporalType.DATE)
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	@Temporal(TemporalType.DATE)
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getPostCount() {
		return postCount;
	}
	public void setPostCount(Integer postCount) {
		this.postCount = postCount;
	}
	public Integer getFocusUserCount() {
		return focusUserCount;
	}
	public void setFocusUserCount(Integer focusUserCount) {
		this.focusUserCount = focusUserCount;
	}
	public Integer getFansCount() {
		return fansCount;
	}
	public void setFansCount(Integer fansCount) {
		this.fansCount = fansCount;
	}
	public Integer getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(Integer replyCount) {
		this.replyCount = replyCount;
	}
	public Integer getFocusPostCount() {
		return focusPostCount;
	}
	public void setFocusPostCount(Integer focusPostCount) {
		this.focusPostCount = focusPostCount;
	}
	public Integer getCheckCount() {
		return checkCount;
	}
	public void setCheckCount(Integer checkCount) {
		this.checkCount = checkCount;
	}
	@OneToOne
	@JoinColumn(name="accountID")
	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", account=" + account + ", username="
				+ username + ", imgURL=" + imgURL + ", sex=" + sex
				+ ", birthday=" + birthday + ", createDate=" + createDate
				+ ", postCount=" + postCount + ", focusUserCount="
				+ focusUserCount + ", fansCount=" + fansCount + ", replyCount="
				+ replyCount + ", focusPostCount=" + focusPostCount
				+ ", checkCount=" + checkCount + "]";
	}
	
}
