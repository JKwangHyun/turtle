package com.ncs.green.util;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.ncs.green.vo.InquiryVO;
import com.ncs.green.vo.PageVO2;
import com.ncs.green.vo.TmemberVO;

@Service
public class adminServiceImple implements adminService {

	@Inject
	private SqlSession mDAO ;
	
	private static final String ns ="banana.apple.mapper.adminMapper";
	
	@Override
	public List<TmemberVO> TAList(PageVO2 pvo) {
		return mDAO.selectList(ns+".tAllList", pvo);
	}
	
	@Override
	public int tmDelete(TmemberVO vo) {
		return mDAO.delete(ns+".deleteTmember",vo) ;
	}
	
	@Override
	public List<InquiryVO> TIList(PageVO2 pvo) {
		return mDAO.selectList(ns+".tIList", pvo);
	}
	
	@Override
	public List<Map<Integer,Object>> HMList(Map<String,Object> map) {
		return mDAO.selectList(ns+".HMList", map);
	}
	
	@Override
	public List<Map<Integer,Object>> SList(Map<String,Object> map) {
		return mDAO.selectList(ns+".SearchList", map);
	}
	
	@Override
	public int totalCount() {
		return mDAO.selectOne(ns+".totalCount") ;
	}
	
	@Override
	public int totalCount1() {
		return mDAO.selectOne(ns+".totalCount1") ;
	}
	
	@Override
	public int totalCount2(String s) {
		return mDAO.selectOne(ns+".totalCount2",s) ;
	}
	
	@Override
	public InquiryVO inquiryDetail(InquiryVO vo) {
		return mDAO.selectOne(ns+".detailInquiry", vo) ;
	}
	
	@Override
	public int ireplyi(InquiryVO ivo) {
		return mDAO.insert(ns+".insertReply",ivo);
	}
	
	@Override
	public int replyUpdate(InquiryVO vo) {
		return mDAO.update(ns+".updateReply",vo) ;
	}
} // class
