package com.spring.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class getherBoardDAOImpl implements getherBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<getherBoardDTO> getBoardList(PageDTO dto) {

		return this.sqlSession.selectList("gether_all", dto);
		
	}

	@Override
	public int getListCount() {

		return this.sqlSession.selectOne("gether_count");
		
	}

	@Override
	public int readCount(int no) {

		return this.sqlSession.update("gether_hitcount", no);
	}

	@Override
	public int deleteBoard(int no) {

		return this.sqlSession.delete("gether_delete", no);
		
	}

	@Override
	public int updateSequence(int no) {

		return this.sqlSession.update("gether_seq", no);
		
	}

	@Override
	public int insertBoard(getherBoardDTO dto) {
		
		return this.sqlSession.insert("gether_insert", dto);
		
	}

	@Override
	public getherBoardDTO boardCont(int no) {

		return this.sqlSession.selectOne("gether_content", no);
		
	}

	@Override
	public int updateBoard(getherBoardDTO dto) {
		
		return this.sqlSession.update("gether_update", dto);

	}

	@Override
	public int searchBoardCount(String field, String keyword) {

		return this.sqlSession.selectOne("gether_"+field, keyword);
		
	}

	@Override
	public List<getherBoardDTO> searchBoardList(PageDTO dto) {
		
		if(dto.getField().equals("title")) {
			return this.sqlSession.selectList("gether_titleList", dto);
		}else if(dto.getField().equals("cont")) {
			return this.sqlSession.selectList("gether_contList", dto);
		}else if(dto.getField().equals("title_cont")) {
			return this.sqlSession.selectList("gether_titleCont", dto);
		}else {
			return this.sqlSession.selectList("gether_writerList", dto);
		}
		
	}

	
	// 댓글 부분
	
	@Override
	public List<getherReplyDTO> getReplyList(int mno) {
		return this.sqlSession.selectList("gether_replyList", mno);
	}

	@Override
	public int insertReply(getherReplyDTO dto) {
		return this.sqlSession.insert("gether_replyInsert", dto);
	}

	@Override
	public int updateReply(getherReplyDTO dto) {
		return this.sqlSession.update("gether_replyUpdate", dto);
	}

	@Override
	public int deleteReply(int rno) {
		return this.sqlSession.delete("gether_replyDelete", rno);
	}

	@Override
	public int updateReplySequence(int rno) {
		return this.sqlSession.update("gether_replySeq", rno);
	}

	@Override
	public int deleteAllReply(int mno) {
		return this.sqlSession.delete("gether_replyAllDel", mno);
	}

	@Override
	public getherReplyDTO getReply(int rno) {
		return this.sqlSession.selectOne("gether_oneReply", rno);
	}

}
