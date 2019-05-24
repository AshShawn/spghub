package sgphub.commons.entity;

import javax.persistence.*;

@Entity
@Table
public class ParentTopic {
	/**
	 * 父话题
	 */
	private Integer id;
	private String name;
	private Integer focusCount;
	private Integer postCount;
	private String introduction;
	private String imgURL;
	public ParentTopic() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public ParentTopic(Integer id, String name, Integer focusCount,
      Integer postCount, String introduction, String imgURL) {
    super();
    this.id = id;
    this.name = name;
    this.focusCount = focusCount;
    this.setPostCount(postCount);
    this.introduction = introduction;
    this.imgURL = imgURL;
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
	@Column(length=20)
	public String getImgURL() {
		return imgURL;
	}
	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}
	@Override
	public String toString() {
		return "ParentTopic [id=" + id + ", name=" + name + ", focusCount="
				+ focusCount + ", introduction=" + introduction + ", imgURL="
				+ imgURL + "]";
	}


  public Integer getPostCount() {
    return postCount;
  }


  public void setPostCount(Integer postCount) {
    this.postCount = postCount;
  }
	

}
