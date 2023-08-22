package com.team2.mbti.comment.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentDAO {
	int insertComments(CommentVO vo);
	List<Map<String, Object>> selectCommentList(int boardNo);
	
	void deleteComment(Map<String, String> map);
	
	int insertCommentReply(CommentVO vo);
	int updateComment(CommentVO vo);
}