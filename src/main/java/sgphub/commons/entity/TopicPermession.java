package sgphub.commons.entity;

import javax.persistence.*;

@Entity
@Table(name="TopicPermession")
public class TopicPermession {
	/**
	 * 父话题下的权限
	 * 包括 大吧主 小吧主 优秀回答者 普通用户 被封禁用户 。默认为普通用户
	 */
	private Integer id;
	private String permissionName;
	public TopicPermession() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TopicPermession(Integer id, String permissionName) {
		super();
		this.id = id;
		this.permissionName = permissionName;
	}
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(length=8)
	public String getPermissionName() {
		return permissionName;
	}
	public void setPermissionName(String permissionName) {
		this.permissionName = permissionName;
	}

}
