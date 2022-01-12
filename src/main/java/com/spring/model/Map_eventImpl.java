package com.spring.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Map_eventImpl implements Map_eventDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getEventListCount() {
		
		return this.sqlSession.selectOne("event_count");
	}

	@Override
	public List<Map_eventDTO> getEventList(PageDTO dto) {
		
		return this.sqlSession.selectList("event_list", dto);
	}

	@Override
	public int endEventListCount() {
		
		return this.sqlSession.selectOne("event_endcount");
	}

	@Override
	public List<Map_eventDTO> endEventList(PageDTO dto) {
		
		return this.sqlSession.selectList("event_endList", dto);
	}

	@Override
	public Map_eventDTO eventCont(int bno) {
		
		return this.sqlSession.selectOne("event_content", bno);
	}

	@Override
	public void hitCount(int bno) {
		
		this.sqlSession.update("event_hit", bno);
	}

	@Override
	public int allEventListCount() {
		
		return this.sqlSession.selectOne("event_allcount");
	}

	@Override
	public List<Map_eventDTO> allEventList(PageDTO dto) {
		
		return this.sqlSession.selectList("event_allList", dto);
	}

	@Override
	public int insertEvent(Map_eventDTO dto) {
		
		return this.sqlSession.insert("event_addEvent", dto);
	}

	@Override
	public int updateEvent(Map_eventDTO dto) {
		
		return this.sqlSession.update("event_editEvent", dto);
	}

	@Override
	public int deleteEvent(int bno) {
		
		return this.sqlSession.delete("event_del", bno);
	}

	@Override
	public void updateSequence(int bno) {
		
		this.sqlSession.update("event_Seq", bno);
	}

	@Override
	public int updateFileEvent(Map_eventDTO dto) {
		
		return this.sqlSession.update("event_fileedit", dto);
	}

}
