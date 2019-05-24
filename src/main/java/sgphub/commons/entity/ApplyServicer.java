package sgphub.commons.entity;

import java.util.Date;

import javax.persistence.*;

@Entity
public class ApplyServicer {
  /**
   * 申请职位表
   */
  private Integer id;
  private FocusTopic focusTopic;
  private String text;
  private Date date;
  private User user;
  //1 处理中 2 已处理
  private AdviceStatus adviceStatus;
  public ApplyServicer(Integer id, FocusTopic focusTopic, String text,
      Date date, AdviceStatus adviceStatus,User user) {
    super();
    this.user = user;
    this.id = id;
    this.focusTopic = focusTopic;
    this.text = text;
    this.date = date;
    this.adviceStatus = adviceStatus;
  }
  public ApplyServicer() {
    super();
    // TODO Auto-generated constructor stub
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
  public FocusTopic getFocusTopic() {
    return focusTopic;
  }
  public void setFocusTopic(FocusTopic focusTopic) {
    this.focusTopic = focusTopic;
  }
  public String getText() {
    return text;
  }
  public void setText(String text) {
    this.text = text;
  }
  @Temporal(value = TemporalType.TIMESTAMP)
  public Date getDate() {
    return date;
  }
  public void setDate(Date date) {
    this.date = date;
  }
  @ManyToOne
  public AdviceStatus getAdviceStatus() {
    return adviceStatus;
  }
  public void setAdviceStatus(AdviceStatus adviceStatus) {
    this.adviceStatus = adviceStatus;
  }
  @ManyToOne
  public User getUser() {
    return user;
  }
  public void setUser(User user) {
    this.user = user;
  }
  
  
  
  
  

}
