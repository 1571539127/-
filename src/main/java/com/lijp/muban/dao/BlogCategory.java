package com.lijp.muban.dao;

import java.io.Serializable;
import java.util.Date;

public class BlogCategory implements Serializable{
	private static final long serialVersionUID = 6687286913317513141L;
	
    private Integer categoryId;

    private String categoryName;

    private String categoryDescribe;

    private Integer categoryParentId;

    private Date categoryCreatetime;

    private Date categoryUpdatetime;
    
    private Integer pategoryId;

    private String pategotyName;

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.categoryName = CategoryName == null ? null : CategoryName.trim();
    }

    public String getCategoryDescribe() {
        return categoryDescribe;
    }

    public void setCategoryDescribe(String categoryDescribe) {
        this.categoryDescribe = categoryDescribe == null ? null : categoryDescribe.trim();
    }

    public Integer getCategoryParentId() {
        return categoryParentId;
    }

    public void setCategoryParentId(Integer categoryParentId) {
        this.categoryParentId = categoryParentId;
    }

    public Date getCategoryCreatetime() {
        return categoryCreatetime;
    }

    public void setCategoryCreatetime(Date categoryCreatetime) {
        this.categoryCreatetime = categoryCreatetime;
    }

    public Date getCategoryUpdatetime() {
        return categoryUpdatetime;
    }

    public void setCategoryUpdatetime(Date categoryUpdatetime) {
        this.categoryUpdatetime = categoryUpdatetime;
    }

	public Integer getPategoryId() {
		return pategoryId;
	}

	public void setPategoryId(Integer pategoryId) {
		this.pategoryId = pategoryId;
	}

	public String getPategotyName() {
		return pategotyName;
	}

	public void setPategotyName(String pategotyName) {
		this.pategotyName = pategotyName;
	}

	@Override
	public String toString() {
		return "BlogCategory [categoryId=" + categoryId + ", categoryName=" + categoryName + ", categoryDescribe="
				+ categoryDescribe + ", categoryParentId=" + categoryParentId + ", categoryCreatetime="
				+ categoryCreatetime + ", categoryUpdatetime=" + categoryUpdatetime + ", pategoryId=" + pategoryId
				+ ", pategotyName=" + pategotyName + "]";
	}

	
    
}