package sgphub.commons.entity;

import javax.persistence.*;

@Entity
@Table
public class ChildTopic {
	/**
	 * 子话题
	 */
	private Integer id;
	private String name;
	private Integer focusCount;
	private String introduction;
	private ParentTopic parentTopic;
	public ChildTopic() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChildTopic(Integer id, String name, Integer focusCount,
			String introduction, ParentTopic parentTopic) {
		super();
		this.id = id;
		this.name = name;
		this.focusCount = focusCount;
		this.introduction = introduction;
		this.parentTopic = parentTopic;
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
	public Integer getFocusCount() {
		return focusCount;
	}
	public void setFocusCount(Integer focusCount) {
		this.focusCount = focusCount;
	}
	@Column(length=50)
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	@ManyToOne
	@JoinColumn(name="parentTopicID")
	public ParentTopic getParentTopic() {
		return parentTopic;
	}
	public void setParentTopic(ParentTopic parentTopic) {
		this.parentTopic = parentTopic;
	}
	@Override
	public String toString() {
		return "ChildTopic [id=" + id + ", name=" + name + ", focusCount="
				+ focusCount + ", introduction=" + introduction
				+ ", parentTopic=" + parentTopic + "]";
	}
	

}
