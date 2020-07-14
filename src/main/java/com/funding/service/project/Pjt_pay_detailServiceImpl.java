package com.funding.service.project;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.funding.dao.project.Pjt_pay_detailDAO;
import com.funding.dto.Pjt_pay_detailVO;
import com.funding.dto.ProjectVO;
import com.funding.request.MainPageMaker;
import com.funding.request.MypagePaylistRequest;
import com.funding.request.PageMaker;
import com.funding.request.PaylistPageMaker;
import com.funding.request.PaylistSearchCriteria;
import com.funding.request.ProjectPayRequest;
import com.funding.request.SearchCriteria;

public class Pjt_pay_detailServiceImpl implements Pjt_pay_detailService {
	
	@Autowired
	private Pjt_pay_detailDAO pjt_pay_detailDAO;
	public void setPjt_pay_detailDAO(Pjt_pay_detailDAO pjt_pay_detailDAO) {
		this.pjt_pay_detailDAO=pjt_pay_detailDAO;
	}

	@Override
	public int pjtSumPay(int pjt_num) throws SQLException {
		int sum = pjt_pay_detailDAO.selectPjtPaySum(pjt_num);
		return sum;
	}

	@Override
	public void pjtPay(Pjt_pay_detailVO pjt_pay_detail) throws SQLException {
		int num = pjt_pay_detailDAO.selectBoardSeqNext();
		pjt_pay_detail.setPjt_pay_num(num);
		
		pjt_pay_detailDAO.insertPjtPay(pjt_pay_detail);
		
	}

	@Override
	public Map<String, Object> getPjtPayTableList(SearchCriteria cri, int mem_num) throws SQLException {
		List<ProjectPayRequest> list = pjt_pay_detailDAO.selectPjtPayTableListByMemNum(cri, mem_num);
		
		for(ProjectPayRequest project : list) {
			int sum=pjt_pay_detailDAO.selectPjtPaySum(project.getPjt_num());
			project.setPjtPaySum(sum);
		}
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(pjt_pay_detailDAO.selectPjtPayTableListByMemNumCount(cri, mem_num));
		
		Map<String, Object> dataMap=new HashMap<String,Object>();
		dataMap.put("projectList", list);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public Map<String, Object> getPjtPayListByMemNum(SearchCriteria cri, int mem_num) throws SQLException {
		List<MypagePaylistRequest> paylist = pjt_pay_detailDAO.selectPjtPayListByMemNum(cri, mem_num);

		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(pjt_pay_detailDAO.selectPjtPayListByMemNumCount(cri, mem_num));
		
		Map<String, Object> dataMap=new HashMap<String,Object>();
		dataMap.put("paylist", paylist);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getPjtPayListForRefundByMemNum(SearchCriteria cri, int mem_num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getPjtRefundListByMemNum(PaylistSearchCriteria cri, int mem_num) throws SQLException {
		List<MypagePaylistRequest> refundList = pjt_pay_detailDAO.selectPjtRefundListByMemNum(cri, mem_num);

		PaylistPageMaker pageMaker=new PaylistPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(pjt_pay_detailDAO.selectPjtRefundListByMemNumCount(cri, mem_num));
		
		Map<String, Object> dataMap=new HashMap<String,Object>();
		dataMap.put("refundList", refundList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public Map<String, Object> getPjtAllPayListByMemNum(PaylistSearchCriteria cri, int mem_num) throws SQLException {
		List<MypagePaylistRequest> list = pjt_pay_detailDAO.selectPjtAllPayListByMemNum(cri, mem_num);

		PaylistPageMaker pageMaker = new PaylistPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(pjt_pay_detailDAO.selectPjtAllPayListByMemNumCount(cri, mem_num));
		
		Map<String, Object> dataMap=new HashMap<String,Object>();
		dataMap.put("list", list);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public Map<String, Object> getPjtPayTypePayListByMemNum(PaylistSearchCriteria cri, int mem_num) throws SQLException {
		List<MypagePaylistRequest> list = pjt_pay_detailDAO.selectSearchPjtAllPayListByMemNum(cri, mem_num);

		PaylistPageMaker pageMaker=new PaylistPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(pjt_pay_detailDAO.selectSearchPjtAllPayListByMemNumCount(cri, mem_num));
		
		Map<String, Object> dataMap=new HashMap<String,Object>();
		dataMap.put("list", list);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public void updateAskRefundStateToOne(int pjt_pay_num) throws SQLException {
		pjt_pay_detailDAO.updateAskRefundStateToOne(pjt_pay_num);
	}



}