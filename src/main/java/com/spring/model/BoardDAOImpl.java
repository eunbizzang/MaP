package com.spring.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		
		return this.sqlSession.selectOne("review_count");
	}

	
	@Override
	public List<BoardDTO> getBoardList(PageDTO dto) {
		
		return this.sqlSession.selectList("review_list", dto);
	}

	@Override
	public int getKListCount(String keyword) {
		
		return this.sqlSession.selectOne("review_kcount", keyword);
	}


	@Override
	public List<BoardDTO> getKBoardList(PageDTO dto) {
		
		return this.sqlSession.selectList("review_klist", dto);
	}
	
	@Override
	public int boardEdit(BoardDTO dto) {
		
		if(dto.getBfile_name().equals("")) {
			return this.sqlSession.update("review_edit", dto);
		}else {
			return this.sqlSession.update("review_edit_file", dto);	
		}
	}
	
	@Override
	public int insertBoard(BoardDTO dto) {

		return this.sqlSession.insert("review_add", dto);
	}

	@Override
	public BoardDTO boardCont(int no) {
		
		return this.sqlSession.selectOne("review_content", no);
	}

	@Override
	public void readCount(int no) {
		
		this.sqlSession.update("review_read", no);
	}
	
	@Override
	public int deleteBoard(int no) {
		
		return this.sqlSession.delete("review_delete", no);
	}

	@Override
	public List<ReviewReplyDTO> replyList(int no) {
		
		return this.sqlSession.selectList("review_rlist", no);
	}


	@Override
	public int boardComment(ReviewReplyDTO dto) {
		
		return this.sqlSession.insert("review_comment", dto);
	}


	@Override
	public int boardCommentDelete(int no) {
		
		return this.sqlSession.delete("review_comment_delete", no);
	}

	
	// like관련
	@Override
	public List<Integer> getListLike(Map<String, Object> like) {
		
		return this.sqlSession.selectList("review_list_like", like);
	}	
	
	@Override
	public int selectLike(ReviewLikeDTO dto) {
		
		return this.sqlSession.selectOne("review_likecnt", dto);
	}


	@Override
	public int boardLike(ReviewLikeDTO dto) {
		
		return this.sqlSession.update("review_like", dto);
	}


	@Override
	public void plusLike(int no) {
		
		this.sqlSession.update("review_pluslike", no);
	}


	@Override
	public int boardDislike(ReviewLikeDTO dto) {

		return this.sqlSession.update("review_dislike", dto);
	}


	@Override
	public void minusLike(int no) {
		
		this.sqlSession.update("review_minuslike", no);
	}


	@Override
	public int commentCount(int no) {

		return this.sqlSession.update("review_commentCount", no);
	}

	

	@Override
	public int commentDown(int no) {

		return this.sqlSession.update("review_commentDown", no);
	}
	
	@Override
	public int replyUpdate(ReviewReplyDTO dto) {
		
		return this.sqlSession.update("review_commentUpdate", dto);
	}


}
