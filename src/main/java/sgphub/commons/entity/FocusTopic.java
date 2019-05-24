package sgphub.commons.entity;

import javax.persistence.*;

@Entity
@Table
public class FocusTopic {
	/**
	 * 用户关注的话题
	 */
	private Integer id;
	private User user;
	private ParentTopic parentTopic;
	private ChildTopic childTopic;
	private TopicPermession topicPermession;
	private Integer experience;
	public FocusTopic() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FocusTopic(Integer id, User user, ParentTopic parentTopic,
			ChildTopic childTopic, TopicPermession topicPermession,
			Integer experience) {
		super();
		this.id = id;
		this.user = user;
		this.parentTopic = parentTopic;
		this.childTopic = childTopic;
		this.topicPermession = topicPermession;
		this.experience = experience;
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
	@JoinColumn(name="userID")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@ManyToOne
	@JoinColumn(name="parentTopicID")
	public ParentTopic getParentTopic() {
		return parentTopic;
	}
	public void setParentTopic(ParentTopic parentTopic) {
		this.parentTopic = parentTopic;
	}
	@ManyToOne
	@JoinColumn(name="childTopicID")
	public ChildTopic getChildTopic() {
		return childTopic;
	}
	public void setChildTopic(ChildTopic childTopic) {
		this.childTopic = childTopic;
	}
	@ManyToOne
	@JoinColumn(name="topicPermessionID")
	public TopicPermession getTopicPermession() {
		return topicPermession;
	}
	public void setTopicPermession(TopicPermession topicPermession) {
		this.topicPermession = topicPermession;
	}
	public Integer getExperience() {
		return experience;
	}
	public void setExperience(Integer experience) {
		this.experience = experience;
	}
	@Override
	public String toString() {
		return "FocusTopic [id=" + id + ", user=" + user + ", parentTopic="
				+ parentTopic + ", childTopic=" + childTopic
				+ ", topicPermession=" + topicPermession + ", experience="
				+ experience + "]";
	}
	
	
}
