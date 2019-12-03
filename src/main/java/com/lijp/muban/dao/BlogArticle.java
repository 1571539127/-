package com.lijp.muban.dao;

import java.util.Date;

public class BlogArticle {
    private Integer articleId;

    private Integer userId;
    private String articleAuthorName;
    private String articleTitle;
    private String articleContent;
    private String articleState;
    private Date articleCreatetime;
    private Date articleUpdatetime;
    private Integer categoryId;
    private String categoryName;
    
    private BlogArticleRefKey blogArticleRefKey;
    
    private BlogCategory blogCategory;
    
    private Integer firstCategory;
    
    private Integer secondCategory;

    
    
    public Integer getFirstCategory() {
		return firstCategory;
	}

	public void setFirstCategory(Integer firstCategory) {
		this.firstCategory = firstCategory;
	}

	public Integer getSecondCategory() {
		return secondCategory;
	}

	public void setSecondCategory(Integer secondCategory) {
		this.secondCategory = secondCategory;
	}

	public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getArticleAuthorName() {
        return articleAuthorName;
    }

    public void setArticleAuthorName(String articleAuthorName) {
        this.articleAuthorName = articleAuthorName == null ? null : articleAuthorName.trim();
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle == null ? null : articleTitle.trim();
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent == null ? null : articleContent.trim();
    }

    public String getArticleState() {
        return articleState;
    }

    public void setArticleState(String articleState) {
        this.articleState = articleState == null ? null : articleState.trim();
    }

    public Date getArticleCreatetime() {
        return articleCreatetime;
    }

    public void setArticleCreatetime(Date articleCreatetime) {
        this.articleCreatetime = articleCreatetime;
    }

    public Date getArticleUpdatetime() {
        return articleUpdatetime;
    }

    public void setArticleUpdatetime(Date articleUpdatetime) {
        this.articleUpdatetime = articleUpdatetime;
    }

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public BlogArticleRefKey getBlogArticleRefKey() {
		return blogArticleRefKey;
	}

	public void setBlogArticleRefKey(BlogArticleRefKey blogArticleRefKey) {
		this.blogArticleRefKey = blogArticleRefKey;
	}

	public BlogCategory getBlogCategory() {
		return blogCategory;
	}

	public void setBlogCategory(BlogCategory blogCategory) {
		this.blogCategory = blogCategory;
	}
	
	
    
    
}