package sgphub.commons.entity;

import javax.persistence.*;

@Entity
@Table(name="WonderfulReply")
public class WonderfulReply {
	/**
	 * 精彩回答
	 */
	private Integer id;
	private Post post;
	private Reply reply;
	private Integer approval;
	public WonderfulReply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WonderfulReply(Integer id, Post post, Reply reply, Integer approval) {
		super();
		this.id = id;
		this.post = post;
		this.reply = reply;
		this.approval = approval;
	}
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@OneToOne
	@JoinColumn(name="postID")
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	@OneToOne
	@JoinColumn(name="replyID")
	public Reply getReply() {
		return reply;
	}
	public void setReply(Reply reply) {
		this.reply = reply;
	}
	public Integer getApproval() {
		return approval;
	}
	public void setApproval(Integer approval) {
		this.approval = approval;
	}
	
}
