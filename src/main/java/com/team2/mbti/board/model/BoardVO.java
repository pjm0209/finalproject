package com.team2.mbti.board.model;

import java.sql.Timestamp;

import com.team2.mbti.common.SearchVO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO extends SearchVO {
	private int boardNo;
	private int boardFormNo;
	private String boardTitle;
	private String boardBody;
	private Integer no;
	private Timestamp boardRegdate;
	private int boardReadcount;
	private int rcmdCount;
	private int boardGroupNo;
	private int boardStep;
	private int boardSort;
	private String boardDelFlag;
	private int mbtiNo;
	private int adminNo;
	
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", boardFormNo=" + boardFormNo + ", boardTitle=" + boardTitle
				+ ", boardBody=" + boardBody + ", no=" + no + ", boardRegdate=" + boardRegdate + ", boardReadcount="
				+ boardReadcount + ", rcmdCount=" + rcmdCount + ", boardGroupNo=" + boardGroupNo + ", boardStep="
				+ boardStep + ", boardSort=" + boardSort + ", boardDelFlag=" + boardDelFlag + ", mbtiNo=" + mbtiNo
				+ ", adminNo=" + adminNo + ", toString()=" + super.toString() + "]";
	}
}