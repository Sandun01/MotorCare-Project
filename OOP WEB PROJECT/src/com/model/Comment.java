package com.model;

/**
 * Class implementation comment
 * @author IT19802022 W.A.L Priyasarani
 */


public class Comment {

	private String Username;
	private String email;
	private String Comment;
	private int CommentId;
	
	public int getCommentId() 
	{
		return CommentId;
	}
	public void setCommentId(int commentId)
	{
		CommentId = commentId;
	}
	public String getUsername()
	{
		return Username;
	}
	public void setUsername(String username) 
	{
		Username = username;
	}
	public String getEmail() 
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getComment() 
	{
		return Comment;
	}
	public void setComment(String comment)
	{
		Comment = comment;
	}
}
