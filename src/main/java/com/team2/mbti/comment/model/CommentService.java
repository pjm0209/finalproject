package com.team2.mbti.comment.model;

import java.util.List;
import java.util.Map;

public interface CommentService {
	int insertComments(CommentVO vo);
	List<Map<String, Object>> selectCommentList(int boardNo);
	
	void deleteComment(Map<String, String> map);
}