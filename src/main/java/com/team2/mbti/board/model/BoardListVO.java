package com.team2.mbti.board.model;

import java.util.List;

import org.springframework.web.bind.annotation.ModelAttribute;

import jakarta.servlet.http.HttpServletRequest;
import lombok.Data;

@Data
public class BoardListVO {
	private List<BoardVO> boardItems;
}