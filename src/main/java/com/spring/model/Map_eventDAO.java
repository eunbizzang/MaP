package com.spring.model;

import java.util.List;

public interface Map_eventDAO {

	int getEventListCount();
	
	List<Map_eventDTO> getEventList(PageDTO dto);
	
	int endEventListCount();
	
	List<Map_eventDTO> endEventList(PageDTO dto);
	
	Map_eventDTO eventCont(int bno);
	
	void hitCount(int bno);
	
	int allEventListCount();
	
	List<Map_eventDTO> allEventList(PageDTO dto);
	
	int insertEvent(Map_eventDTO dto);
	
	int updateEvent(Map_eventDTO dto);
	
	int updateFileEvent(Map_eventDTO dto);
	
	int deleteEvent(int bno);
	
	void updateSequence(int bno);
}
