package com.spring.model;

import java.util.List;

public interface getherBoardDAO {

	public List<getherBoardDTO> getBoardList(PageDTO dto);
	public int getListCount();
	
	public int readCount(int no);	
	public int deleteBoard(int no);
	public int updateSequence(int no);
		
	public int insertBoard(getherBoardDTO dto);
	
	public getherBoardDTO boardCont(int no);
	public int updateBoard(getherBoardDTO dto);
	
	
	public int searchBoardCount(String field, String keyword);
	
	public List<getherBoardDTO> searchBoardList(PageDTO dto);
	
	//댓글 관련 메서드
	public List<getherReplyDTO> getReplyList(int mno);
	public int insertReply(getherReplyDTO dto);
	public getherReplyDTO getReply(int rno);
	public int updateReply(getherReplyDTO dto);
	public int deleteReply(int rno);
	public int updateReplySequence(int rno);
	public int deleteAllReply(int mno);
}
