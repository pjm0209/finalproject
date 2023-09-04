package com.team2.mbti.comment.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentsVO extends CommentVO {
	private String adminId;
	private String name;
	private String userId;
	
	@Override
	public String toString() {
		return "CommentsVO [adminId=" + adminId + ", name=" + name + ", userId=" + userId + ", toString()="
				+ super.toString() + "]";
	}
}