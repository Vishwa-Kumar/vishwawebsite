package com.vishwa.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.vishwa.dao.BlogDaoSQL;
import com.vishwa.model.BlogPostContent;
import com.vishwa.model.BlogPostMeta;

@Service
public class BlogService {

	BlogDaoSQL blogDaoSQLObj = new BlogDaoSQL();
	HashMap<Integer, BlogPostMeta> mapOfPostIdToBlogPost;

	public ArrayList<BlogPostMeta> generatePostFeedByTrending() {
		System.out.println("generatePostFeedByTrending called in service");
		ArrayList<BlogPostMeta> postsList = blogDaoSQLObj.fetchLatestPost();
		mapOfPostIdToBlogPost = new HashMap<>();

		for (BlogPostMeta post : postsList) {
			mapOfPostIdToBlogPost.put(post.getBlogPostId(), post);
		}

		return postsList;

	}

	public BlogPostContent getPostById(int id) {
		System.out.println("getPostById called in service");
		return blogDaoSQLObj.fetchPostById(id);

	}

	public BlogPostMeta getPostByListOfIds(ArrayList<Integer> ids) {

		return null;

	}

}
