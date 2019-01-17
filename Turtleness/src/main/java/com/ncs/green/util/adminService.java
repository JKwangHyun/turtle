package com.ncs.green.util;

import java.util.List;
import java.util.Map;

import com.ncs.green.vo.InquiryVO;
import com.ncs.green.vo.PageVO2;
import com.ncs.green.vo.TmemberVO;

public interface adminService {
	List<TmemberVO> TAList(PageVO2 pvo);
	
	List<InquiryVO> TIList(PageVO2 pvo);
	
	List<Map<Integer,Object>> HMList(Map<String,Object> map);
	
	List<Map<Integer,Object>> SList(Map<String,Object> map);
	
	int totalCount();
	
	int totalCount1();
	
	int totalCount2(String s);
	
	int tmDelete(TmemberVO vo);
	
	InquiryVO inquiryDetail(InquiryVO vo);
	
	int ireplyi(InquiryVO ivo);
	
	int replyUpdate(InquiryVO vo);
}