package com.funding.dao.admin;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.funding.dto.PopupVO;
import com.funding.request.SearchCriteria;

public class PopupDAOImpl implements PopupDAO{
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<PopupVO> selectPopupList(SearchCriteria cri) throws SQLException {
		int offset=cri.getPageStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds= new RowBounds(offset,limit);
		List<PopupVO> list = sqlSession.selectList("Popup-Mapper.selectPopupList",cri,rowBounds);
		return list;
	}

	@Override
	public void registPopup(PopupVO popup) throws SQLException {
		sqlSession.update("Popup-Mapper.registPopup",popup);
	}

	@Override
	public int selectPopupListCount(SearchCriteria cri) throws SQLException {
		int count = sqlSession.selectOne("Popup-Mapper.selectPopupListCount",cri);
		return count;
	}

	@Override
	public int selectPopupSeqNext() throws SQLException {
		int num = sqlSession.selectOne("Popup-Mapper.selectPopupSeqNext");
		return num;
	}

	@Override
	public void deletePopup(int p_num) throws SQLException {
		sqlSession.update("Popup-Mapper.deletePopup",p_num);
		
	}

	@Override
	public void popupDisabled(int p_num) throws SQLException {
		sqlSession.update("Popup-Mapper.popupDisabled",p_num);
		
	}

	@Override
	public void popupEnabled(int p_num) throws SQLException {
		sqlSession.update("Popup-Mapper.popupEnabled",p_num);
		
	}

	@Override
	public PopupVO selectPopupListByNum(int p_num) throws SQLException {
		PopupVO popup = sqlSession.selectOne("Popup-Mapper.selectPopupListByNum",p_num);
		return popup;
	}

	@Override
	public void modifyPopup(PopupVO popup) throws SQLException {
		sqlSession.update("Popup-Mapper.modifyPopup",popup);
		
	}

	@Override
	public List<PopupVO> selectActivePopup() throws SQLException {
		List<PopupVO> popupList = sqlSession.selectList("Popup-Mapper.selectActivePopup");
		return popupList;
	}

}
