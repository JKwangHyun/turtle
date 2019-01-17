package com.ncs.green.util;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.ncs.green.vo.BodyVO;
import com.ncs.green.vo.InquiryVO;
import com.ncs.green.vo.PageVO;
import com.ncs.green.vo.TmemberVO;
import com.ncs.green.vo.UserVO;

@Service
public class TMemberServiceImple implements TMemberService {

	@Inject
	private SqlSession mDAO ;
	
	private static final String ns ="banana.apple.mapper.tmemberMapper";
	
	@Override
	public int tInsert(TmemberVO tvo) {
		return mDAO.insert(ns+".tinsertMember",tvo) ;
	}
	@Override
	public TmemberVO tDetail(UserVO vo) {
		return mDAO.selectOne(ns+".tdetailMember", vo) ;
	}
	@Override
	public TmemberVO tDetailJ(UserVO vo) {
		return mDAO.selectOne(ns+".tdetailJoin", vo) ;
	}
	@Override
	public int tUpdate(TmemberVO vo) {
		return mDAO.update(ns+".tupdateMember",vo) ;
	}
	@Override
	public int tDelete(TmemberVO vo) {
		return mDAO.delete(ns+".tdeleteMember",vo) ;
	}
	@Override
	public int tbInsert(BodyVO vo) {
		return mDAO.insert(ns+".tbinsertMember",vo);
	}
	@Override
	public BodyVO tbDetail(BodyVO vo) {
		return mDAO.selectOne(ns+".tbdetailMember", vo) ;
	}
	@Override
	public int tbUpdate(BodyVO vo) {
		return mDAO.update(ns+".tbupdateMember",vo) ;
	}
	@Override
	public int tbDelete(BodyVO vo) {
		return mDAO.delete(ns+".tbdeleteMember",vo) ;
	}
	@Override
	public List<InquiryVO> inquiryList(PageVO pvo) {
		return mDAO.selectList(ns+".inquiryList", pvo);
	}
	@Override
	public int totalCount(TmemberVO pvo) {
		return mDAO.selectOne(ns+".totalCount",pvo) ;
	}
	@Override
	public int inquiryInsert(InquiryVO vo) {
		return mDAO.insert(ns+".insertInquiry",vo) ;
	}
	@Override
	public InquiryVO inquiryDetail(InquiryVO vo) {
		return mDAO.selectOne(ns+".detailInquiry", vo) ;
	}
	@Override
	public int inquiryUpdate(InquiryVO vo) {
		return mDAO.update(ns+".updateInquiry",vo) ;
	}
	@Override
	public int inquiryDelete(InquiryVO vo) {
		return mDAO.delete(ns+".deleteInquiry",vo) ;
	}
} // class
