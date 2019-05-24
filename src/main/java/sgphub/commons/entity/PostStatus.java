package sgphub.commons.entity;

import javax.persistence.*;

@Entity
@Table
public class PostStatus {
	/**
	 * 帖子状态
	 * 分为普通、加精、置顶、首页滚动 。默认为普通
	 * 关闭帖子回复。
	 */
	private Integer id;
	private String statusName;
	public PostStatus() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PostStatus(Integer id, String statusName) {
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
	@Column(length=6)
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	
}
