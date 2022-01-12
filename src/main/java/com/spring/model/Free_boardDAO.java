package com.spring.model;

import java.util.List;

public interface Free_boardDAO {
	int getListCount();
	
	List<Free_boardDTO> getFree_boardList(PageDTO dto);
	
	int insertFree_board(Free_boardDTO dto);
	
	Free_boardDTO Free_boardCont(int no);
	
	void readCount(int no);
	
	int updateFree_board(Free_boardDTO dto);
	
	int deleteFree_board(int no);
	
	void updateSequence(int no);
	
	int searchBoardCount(String field, String keyword);
	
	List<Free_boardDTO> searchBoardList(PageDTO dto);
	
	public List<FreeReplyDTO> getReplyList(int bno);
	
	public int insertReply(FreeReplyDTO dto);
	
	public int updateReply(FreeReplyDTO dto);
	
	FreeReplyDTO Free_replyCont(int no);
	
	int deleteReply(int no);
	
	void updateReplySequence(int no);
}
