package com.funding.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.funding.dto.NoticeVO;
import com.funding.dto.Notice_atcVO;
import com.funding.request.SearchCriteria;

public interface NoticeService {
	
	public Map<String, Object> getNoticeList(SearchCriteria cri)throws SQLException;
	public List<NoticeVO> getPointNoticeList(SearchCriteria cri)throws SQLException;
	
	
	public NoticeVO getNotice(int notice_num)throws SQLException;
	
	public void regist(NoticeVO notice)throws SQLException;
	public void modify(NoticeVO notice)throws SQLException;
	public void remove(int notice_num) throws SQLException;
	
	public NoticeVO readAttach(int notice_num) throws SQLException;
	
	public Map<String, Object> getNoticeListAll()throws SQLException;
	
	public void updatePoint(NoticeVO notice)throws SQLException;
	
	
}
