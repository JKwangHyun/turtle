package com.ncs.green.util;

import java.util.List;

import com.ncs.green.vo.BodyVO;
import com.ncs.green.vo.InquiryVO;
import com.ncs.green.vo.PageVO;
import com.ncs.green.vo.TmemberVO;
import com.ncs.green.vo.UserVO;

public interface TMemberService {

	int tInsert(TmemberVO tvo);

	TmemberVO tDetail(UserVO vo);

	int tUpdate(TmemberVO vo);

	int tDelete(TmemberVO vo);
	
	int tbDelete(BodyVO vo);

	int tbInsert(BodyVO vo);
	
	BodyVO tbDetail(BodyVO vo);
	
	int tbUpdate(BodyVO vo);
	
	TmemberVO tDetailJ(UserVO vo);
	
	List<InquiryVO> inquiryList(PageVO pvo);
	
	int totalCount(TmemberVO pvo);
	
	int inquiryInsert(InquiryVO vo);
	
	InquiryVO inquiryDetail(InquiryVO vo);
	
	int inquiryUpdate(InquiryVO vo);
	
	int inquiryDelete(InquiryVO vo);
}