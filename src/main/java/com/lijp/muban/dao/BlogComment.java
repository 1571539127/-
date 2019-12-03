package com.lijp.muban.dao;

import java.io.Serializable;
import java.util.Date;

public class BlogComment implements Serializable{
	private static final long serialVersionUID = 6687286913317513141L;
	  
    private Integer commentId;

    private Long articleId;

    private Long commentPid;

    private String commentPname;

    private String commentAuthorName;

    private String commentContent;

    private Date commentCreatetime;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public Long getCommentPid() {
        return commentPid;
    }

    public void setCommentPid(Long commentPid) {
        this.commentPid = commentPid;
    }

    public String getCommentPname() {
        return commentPname;
    }

    public void setCommentPname(String commentPname) {
        this.commentPname = commentPname == null ? null : commentPname.trim();
    }

    public String getCommentAuthorName() {
        return commentAuthorName;
    }

    public void setCommentAuthorName(String commentAuthorName) {
        this.commentAuthorName = commentAuthorName == null ? null : commentAuthorName.trim();
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }

    public Date getCommentCreatetime() {
        return commentCreatetime;
    }

    public void setCommentCreatetime(Date commentCreatetime) {
        this.commentCreatetime = commentCreatetime;
    }

	@Override
	public String toString() {
		return "BlogComment [commentId=" + commentId + ", articleId=" + articleId + ", commentPid=" + commentPid
				+ ", commentPname=" + commentPname + ", commentAuthorName=" + commentAuthorName + ", commentContent="
				+ commentContent + ", commentCreatetime=" + commentCreatetime + "]";
	}
    
}