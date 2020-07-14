package com.funding.dao;

import java.sql.SQLException;
import java.util.List;

import com.funding.dto.Notice_atcVO;

public interface Notice_atcDAO {
	
	public List<Notice_atcVO> selectAttachByNotice_num(int notice_num) throws SQLException;
	
	public Notice_atcVO selectAttachByNtc_atc_num(int ntc_atc_num) throws SQLException;
	
	public void insertAttach(Notice_atcVO attach) throws SQLException;
	
	public void deleteAttach(int ntc_atc_num) throws SQLException;
	
	
	public void deleteAllAttach(int notice_num) throws SQLException;

}    
