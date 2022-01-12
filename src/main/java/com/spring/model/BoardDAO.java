package com.spring.model;

import java.util.List;
import java.util.Map;


public interface BoardDAO {

	int getListCount();
	
	List<BoardDTO> getBoardList(PageDTO dto);
	
	int getKListCount(String keyword);
	
	List<BoardDTO> getKBoardList(PageDTO dto);
	
	int boardEdit(BoardDTO dto);

	int commentCount(int no);
	
	int commentDown(int no);
	
	int boardCommentDelete(int no);
	
	int insertBoard(BoardDTO dto);
	
	BoardDTO boardCont(int no);

	void readCount(int no);
	
	int deleteBoard(int no);
	
	int boardComment(ReviewReplyDTO dto);
	
	List<ReviewReplyDTO> replyList(int no);
	
	//like관련
	
	List<Integer> getListLike(Map<String, Object> like);
	
	int selectLike(ReviewLikeDTO dto);
	
	int boardLike(ReviewLikeDTO dto);
	
	void plusLike(int no);
	
	int boardDislike(ReviewLikeDTO dto);
	
	void minusLike(int no);

	int replyUpdate(ReviewReplyDTO dto);

	BoardDTO getLeftBoard(int bno);

	BoardDTO getRightBoard(int bno);
	
}
