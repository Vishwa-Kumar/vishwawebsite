package com.vishwa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.vishwa.model.BlogPostContent;
import com.vishwa.model.BlogPostMeta;
import com.vishwa.model.Result;

public class BlogDaoSQL {

	public ArrayList<BlogPostMeta> fetchLatestPost() {
		Connection conn = DBConnection.getInstance();
		Result result = new Result();
		System.out.println("calling db");
		String sqlSelectAllPersons = "SELECT vishwablog.blogpostmeta.bp_id,\r\n" + 
				"		vishwablog.blogpostmeta.bp_title,\r\n" + 
				"        vishwablog.blogpostmeta.bp_subtitle,\r\n" + 
				"        vishwablog.blogpostmeta.bp_content_id,\r\n" + 
				"        vishwablog.blogpostmeta.bp_read_count,\r\n" + 
				"        vishwablog.blogpostmeta.bp_share_count,\r\n" + 
				"        vishwablog.blogpostmeta.bp_created_date,\r\n" + 
				"        vishwablog.blog_tag.b_tag_name,\r\n" + 
				"        vishwablog.author.author_name,\r\n" + 
				"        vishwablog.author.author_linkedin,\r\n" + 
				"        vishwablog.author.author_email,\r\n" + 
				"        vishwablog.author.author_img\r\n" + 
				"FROM vishwablog.blogpostmeta \r\n" + 
				"join vishwablog.blog_tag \r\n" + 
				"	on vishwablog.blog_tag.b_tag_id=vishwablog.blogpostmeta.bp_id\r\n" + 
				"join vishwablog.author\r\n" + 
				"	on vishwablog.blogpostmeta.bp_author_id=vishwablog.author.author_id;\r\n" + 
				"";
		int count = -1;
		ArrayList<BlogPostMeta> blogPostList = new ArrayList<BlogPostMeta>();
		try {
			System.out.println("conn  " + conn);
			PreparedStatement ps = conn.prepareStatement(sqlSelectAllPersons);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				BlogPostMeta blogPostObj = new BlogPostMeta();
				blogPostObj.setBlogPostId(rs.getInt("bp_id"));
				blogPostObj.setBlogPostTitle(rs.getString("bp_title"));
				blogPostObj.setBlogPostSubTitle(rs.getString("bp_subtitle"));
				blogPostObj.setBlogPostContent(rs.getString("bp_content_id"));
				blogPostObj.setBlogPostReadCount(rs.getInt("bp_read_count"));
				blogPostObj.setBlogPostShareCount(rs.getInt("bp_share_count"));
				blogPostObj.setBlogPostCreatedDate(rs.getDate("bp_created_date")+"");
				blogPostObj.setBlogPostTag(rs.getString("b_tag_name"));
				blogPostObj.setBlogPostAuthor(rs.getString("author_name"));
				
				System.out.println(blogPostObj);
				blogPostList.add(blogPostObj);
			}
			System.out.println("count of blog" + blogPostList.size());

		}

		catch (SQLException e) {
			e.printStackTrace();
			result.setErrorCode(e.getErrorCode());
			result.setRes(false);
			result.setErrorMsg(e.getLocalizedMessage());
			;

		}
		return blogPostList;
	}

	
	
	
	public BlogPostContent fetchPostById(int id) {
		Connection conn = DBConnection.getInstance();
		Result result = new Result();
		System.out.println("calling db");
		String sqlSelectPostById = "SELECT * FROM vishwablog.blogpostcontent where blogpostid=?;";
		BlogPostContent blogPostContentObj=null;
		try {
			System.out.println("conn  " + conn);
			PreparedStatement ps = conn.prepareStatement(sqlSelectPostById);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				blogPostContentObj = new BlogPostContent();
				blogPostContentObj.setId(rs.getInt("blogpostid"));
				blogPostContentObj.setContent(rs.getString("bpcontent"));
				System.out.println("blogPostContentObj" + blogPostContentObj);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			result.setErrorCode(e.getErrorCode());
			result.setRes(false);
			result.setErrorMsg(e.getLocalizedMessage());
			;

		}
		return blogPostContentObj;
	}
}
