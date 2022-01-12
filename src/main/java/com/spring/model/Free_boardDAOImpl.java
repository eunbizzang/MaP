package com.spring.model;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.PageDTO;

@Repository
public class Free_boardDAOImpl implements Free_boardDAO {
	
	
		@Override
		public int getListCount() {
			return this.sqlSession.selectOne("free_count");
		}	
		
		@Autowired
		private SqlSessionTemplate sqlSession;
		
		@Override
		public List<Free_boardDTO> getFree_boardList(PageDTO dto) {
			
			return this.sqlSession.selectList("free_list", dto);
		}
		
		@Override
		public int insertFree_board(Free_boardDTO dto) {
			return this.sqlSession.insert("free_add", dto);
		}


		@Override
		public Free_boardDTO Free_boardCont(int no) {
			return this.sqlSession.selectOne("free_content", no);
		}

		@Override
		public void readCount(int no) {
			this.sqlSession.update("free_read", no);
			
		}

		@Override
		public int updateFree_board(Free_boardDTO dto) {
			return this.sqlSession.update("free_edit", dto);
		}

		@Override
		public int deleteFree_board(int no) {
			return this.sqlSession.delete("free_del", no);
		}

		@Override
		public void updateSequence(int no) {
			this.sqlSession.update("free_seq", no);
			
		}

		@Override
		public int searchBoardCount(String field, String keyword) {
			return this.sqlSession.selectOne(field, keyword);
		}

		@Override
		public List<Free_boardDTO> searchBoardList(PageDTO dto) {
			
			if(dto.getField().equals("title")) {
				return this.sqlSession.selectList("free_titleList", dto);
			}else if(dto.getField().equals("cont")) {
				return this.sqlSession.selectList("free_contList", dto);
			}else {
				return this.sqlSession.selectList("free_writerList", dto);
			}
	
		
		}

		@Override
		public List<FreeReplyDTO> getReplyList(int no)  {
			return this.sqlSession.selectList("free_readReply", no);
		}

		@Override
		public int insertReply(FreeReplyDTO dto) {
			return this.sqlSession.insert("free_reply_add", dto);
		}

		@Override
		public int updateReply(FreeReplyDTO dto) {
			return this.sqlSession.update("free_reply_edit", dto);
		}

		@Override
		public int deleteReply(int no) {
			return this.sqlSession.delete("free_reply_del", no);
		}

		@Override
		public void updateReplySequence(int no) {
			this.sqlSession.update("free_reply_seq", no);
		}

		@Override
		public FreeReplyDTO Free_replyCont(int no) {
			return this.sqlSession.selectOne("free_reply_content", no);
		}
}
