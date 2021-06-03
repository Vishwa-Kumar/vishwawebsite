package com.vishwa.model;

public class BlogPostMeta {
	
	int blogPostId;
	String blogPostTag;
	String blogPostTitle;
	String blogPostSubTitle;
	String blogPostCreatedDate;
	String blogPostAuthor;
	String blogPostContent;
	int blogPostReadCount;
	int blogPostShareCount;
	
	
	public int getBlogPostId() {
		return blogPostId;
	}
	public void setBlogPostId(int blogPostId) {
		this.blogPostId = blogPostId;
	}
	
	public String getBlogPostTag() {
		return blogPostTag;
	}
	public void setBlogPostTag(String blogPostTag) {
		this.blogPostTag = blogPostTag;
	}
	public String getBlogPostTitle() {
		return blogPostTitle;
	}
	public void setBlogPostTitle(String blogPostTitle) {
		this.blogPostTitle = blogPostTitle;
	}
	public String getBlogPostSubTitle() {
		return blogPostSubTitle;
	}
	public void setBlogPostSubTitle(String blogPostSubTitle) {
		this.blogPostSubTitle = blogPostSubTitle;
	}
	public String getBlogPostCreatedDate() {
		return blogPostCreatedDate;
	}
	public void setBlogPostCreatedDate(String blogPostCreatedDate) {
		this.blogPostCreatedDate = blogPostCreatedDate;
	}
	public String getBlogPostAuthor() {
		return blogPostAuthor;
	}
	public void setBlogPostAuthor(String blogPostAuthor) {
		this.blogPostAuthor = blogPostAuthor;
	}
	public String getBlogPostContent() {
		return blogPostContent;
	}
	public void setBlogPostContent(String blogPostContent) {
		this.blogPostContent = blogPostContent;
	}
	public int getBlogPostReadCount() {
		return blogPostReadCount;
	}
	public void setBlogPostReadCount(int blogPostReadCount) {
		this.blogPostReadCount = blogPostReadCount;
	}
	public int getBlogPostShareCount() {
		return blogPostShareCount;
	}
	public void setBlogPostShareCount(int blogPostShareCount) {
		this.blogPostShareCount = blogPostShareCount;
	}
	@Override
	public String toString() {
		return "BlogPost [blogPostId=" + blogPostId + ", blogPostTag=" + blogPostTag + ", blogPostTitle="
				+ blogPostTitle + ", blogPostSubTitle=" + blogPostSubTitle + ", blogPostCreatedDate="
				+ blogPostCreatedDate + ", blogPostAuthor=" + blogPostAuthor + ", blogPostContent=" + blogPostContent
				+ ", blogPostReadCount=" + blogPostReadCount + ", blogPostShareCount=" + blogPostShareCount + "]";
	}
	 

	
	
}
