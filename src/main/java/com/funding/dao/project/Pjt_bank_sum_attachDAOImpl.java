package com.funding.dao.project;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.funding.dto.Pjt_bank_sum_attachVO;

public class Pjt_bank_sum_attachDAOImpl implements Pjt_bank_sum_attachDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertPjtBankSumAttach(Pjt_bank_sum_attachVO pjt_bank_sum_attach) throws SQLException {
		sqlSession.update("Pjt_bank_sum_attach-Mapper.insertPjtBankSumAttach",pjt_bank_sum_attach);
	}

	@Override
	public String selectSumNameByPjtNum(int pjt_num) throws SQLException {
		String sumNail = sqlSession.selectOne("Pjt_bank_sum_attach-Mapper.selectSumNameByPjtNum",pjt_num);
		return sumNail;
	}

	@Override
	public Pjt_bank_sum_attachVO selectPjtBankSumAttachByPjtNum(int pjt_num) throws SQLException {
		Pjt_bank_sum_attachVO pjtBankSumAttach = sqlSession.selectOne("Pjt_bank_sum_attach-Mapper.selectPjtBankSumAttachByPjtNum",pjt_num);
		return pjtBankSumAttach;
	}

	@Override
	public void updatePjtBankSumAttach(Pjt_bank_sum_attachVO pjt_bank_sum_attach) throws SQLException {
		sqlSession.update("Pjt_bank_sum_attach-Mapper.updatePjtBankSumAttach",pjt_bank_sum_attach);
	}

}
