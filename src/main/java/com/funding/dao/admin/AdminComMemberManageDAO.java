package com.funding.dao.admin;

import java.sql.SQLException;
import java.util.List;

import com.funding.dto.ComMemberVO;
import com.funding.dto.ComMember_State_CodeVO;
import com.funding.dto.MemberVO;
import com.funding.request.AdminComMemberDetailRequest;
import com.funding.request.AdminDetailForProjectPageMaker;
import com.funding.request.AdminDetailPageMaker;
import com.funding.request.AdminMemberSearchCriteria;

public interface AdminComMemberManageDAO {

	//소상공인 회원 목록 + 검색
	List<AdminComMemberDetailRequest> selectSearchComMemberList(AdminMemberSearchCriteria cri) throws SQLException;

	//소상공인 회원 목록 다운로드
	List<AdminComMemberDetailRequest> selectSearchComMemberListForDownload(AdminMemberSearchCriteria cri) throws SQLException;

	//소상공인 회원  + 검색 후 총 개수
	int selectSearchComMemberListTotalCount(AdminMemberSearchCriteria cri) throws SQLException;
	
	//소상공인 회원 가입 신청 수
	int selectRoleComHoldTotalCount() throws SQLException;
	
	//소상공인 회원 상세 정보
	AdminComMemberDetailRequest selectComMemberByMemNum(int mem_num) throws SQLException;
	
	//소상공인 회원 프로젝트 등록 내역
	List<AdminComMemberDetailRequest> selectMemberDetailForProject(AdminDetailForProjectPageMaker detailForProjectPageMaker, int mem_num) throws SQLException;
	
	//소상공인 회원 프로젝트 등록 내역 총 개수
	int selectMemberDetailForProjectTotalCount(int mem_num) throws Exception;
	
	//소상공인 회원 가입 상태 코드 조회
	List<ComMember_State_CodeVO> selectComStateCode() throws SQLException;
	
	//소상공인 회원 가입 상태 변경
	void modifyComStateCode(ComMemberVO comMember) throws SQLException;
	
	void modifyMemStateCodeForComMem(MemberVO member) throws SQLException;
	
}
