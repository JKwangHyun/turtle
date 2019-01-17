package com.ncs.green.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.green.util.TMemberService;
import com.ncs.green.util.adminService;
import com.ncs.green.vo.InquiryVO;
import com.ncs.green.vo.PageVO2;
import com.ncs.green.vo.TmemberVO;

@Controller
public class adminController {
	
	@Autowired
	private adminService mDao ;
	@Autowired
	private TMemberService tDao;
	
	@RequestMapping(value="TAList")
	public ModelAndView TAList(HttpServletRequest request,
			ModelAndView mav, Map<Integer,Object> map, TmemberVO vo, PageVO2 pvo)
					throws ServletException, IOException {
		int totalCount = mDao.totalCount() ;
		int cPage=1 ;
		if (request.getParameter("currPage")!=null) {
			cPage=Integer.parseInt(request.getParameter("currPage"));    
		}
		pvo.setCurrPage(cPage);	
		
		
		int perPage = pvo.getPerPage() ;
		
		int skip = 0 ;
		if (cPage>1) {
			skip = (cPage-1)*perPage ;
		}
		int fno = skip+1 ;        
		int lno = skip+perPage ;  
		
		pvo.setFno(fno);
		pvo.setLno(lno);
		List<TmemberVO> TAList =  mDao.TAList(pvo);
		
		int totalPage = totalCount / perPage ;
		if (totalCount % perPage !=0) totalPage++ ;
		
		mav.addObject("Tmember", TAList);
		mav.addObject("totalPage", totalPage);
		mav.addObject("currPage", cPage);
		mav.setViewName("admin/memberList");
		return mav ;
	}
	
	@RequestMapping(value="/TDelte")
	public ModelAndView memberDelete(ModelAndView mav, TmemberVO tvo)
					throws ServletException, IOException {
		
		mDao.tmDelete(tvo);
		mav.setViewName("redirect:TAList");
		
		return mav;
	} // delete

	@RequestMapping(value="/TIList")
	public ModelAndView TIList(HttpServletRequest request,
			ModelAndView mav, InquiryVO ivo, PageVO2 pvo)
					throws ServletException, IOException {
		int totalCount = mDao.totalCount1() ;
		int cPage=1 ;
		if (request.getParameter("currPage")!=null) {
			cPage=Integer.parseInt(request.getParameter("currPage"));    
		}
		pvo.setCurrPage(cPage);	
		
		int perPage = pvo.getPerPage() ;
		
		int skip = 0 ;
		if (cPage>1) {
			skip = (cPage-1)*perPage ;
		}
		int fno = skip+1 ;        
		int lno = skip+perPage ;  
		
		pvo.setFno(fno);
		pvo.setLno(lno);
		List<InquiryVO> TIList =  mDao.TIList(pvo);
		
		int totalPage = totalCount / perPage ;
		if (totalCount % perPage !=0) totalPage++ ;
		
		mav.addObject("Tinquiry", TIList);
		mav.addObject("totalPage", totalPage);
		mav.addObject("currPage", cPage);
		mav.setViewName("admin/inquiryList");
		return mav ;
	}
	
	// 해쉬맵 게시판 리스트
	@RequestMapping(value="/HashMapList")
	public ModelAndView HashMapList(HttpServletRequest request,
			ModelAndView mav, Map<String,Object> map, InquiryVO ivo, PageVO2 pvo)
					throws ServletException, IOException {
		int totalCount = mDao.totalCount1() ;
		int cPage=1 ;
		if (request.getParameter("currPage")!=null) {
			cPage=Integer.parseInt(request.getParameter("currPage"));    
		}
		
		int perPage = 15;
		
		int skip = 0 ;
		if (cPage>1) {
			skip = (cPage-1)*perPage ;
		}
		int fno = skip+1 ;        
		int lno = skip+perPage ;  
		
		map.put("fno", fno);
		map.put("lno", lno);
		List<Map<Integer,Object>> TIList =  mDao.HMList(map);
		
		int totalPage = totalCount / perPage ;
		if (totalCount % perPage !=0) totalPage++ ;
		
		mav.addObject("Tinquiry", TIList);
		mav.addObject("totalPage", totalPage);
		mav.addObject("currPage", cPage);
		mav.setViewName("admin/HMList");
		return mav ;
	}
	
	// 검색 리스트
	@RequestMapping(value="/SearchList")
	public ModelAndView SearchList(HttpServletRequest request,
			ModelAndView mav, @RequestParam Map<String,Object> map, InquiryVO ivo, PageVO2 pvo)
					throws ServletException, IOException {
		String ss= request.getParameter("keyword");
		System.out.println(request.getParameter("st"));
		int totalCount = mDao.totalCount2(ss);
		int cPage=1 ;
		if (request.getParameter("currPage")!=null) {
			cPage=Integer.parseInt(request.getParameter("currPage"));    
		}
		
		int perPage = 15;
			
		int skip = 0 ;
		if (cPage>1) {
			skip = (cPage-1)*perPage ;
		}
		int fno = skip+1 ;        
		int lno = skip+perPage ;  

		map.put("fno", fno);
		map.put("lno", lno);
		map.put("keyword",request.getParameter("keyword"));
		map.put("st", request.getParameter("st"));
		List<Map<Integer,Object>> TIList =  mDao.SList(map);
			
		int totalPage = totalCount / perPage ;
		if (totalCount % perPage !=0) totalPage++ ;
			
		mav.addObject("Tinquiry", TIList);
		mav.addObject("totalPage", totalPage);
		mav.addObject("currPage", cPage);
		mav.setViewName("admin/HMList");
		return mav ;
	}
	
	@RequestMapping(value="/IDetail")
	public ModelAndView boardDetail
	(HttpServletRequest request, ModelAndView mav, TmemberVO mvo,InquiryVO vo) 
			throws ServletException, IOException {
		
		vo = mDao.inquiryDetail(vo);
		System.out.println(vo);
		String title = vo.getTitle();
		int index = title.indexOf(']');
		String ext = title.substring(index+1);
		vo.setTitle(ext);
		System.out.println(vo.getRoot());
		HttpSession session = request.getSession();
		session.setAttribute("iroot", vo.getRoot());
		session.setAttribute("istep", vo.getStep());
		session.setAttribute("iindent", vo.getIndent());
		
		mav.addObject("Inquiry", vo);
		if(vo.getIndent()>0)
			mav.setViewName("admin/replyDetail");
		else 
			mav.setViewName("admin/inquiryDetail");
		return mav;
	}
	@RequestMapping(value="/IDelete")
	public ModelAndView bDelete
	(HttpServletRequest request, ModelAndView mav,InquiryVO vo) 
					throws ServletException, IOException {
		tDao.inquiryDelete(vo) ;
		mav.setViewName("redirect:TIList");
		return mav;
	}
	@RequestMapping(value="/Ireply")
	public ModelAndView Ireply
	(HttpServletRequest request, ModelAndView mav,InquiryVO vo) 
					throws ServletException, IOException {
		System.out.println(vo);
		mav.addObject("adminID",vo);
		mav.setViewName("admin/inquiryReply");
		return mav;
	}
	@RequestMapping(value="/Ireplyinsert")
	public ModelAndView Ireplyinsert
	(HttpServletRequest request, ModelAndView mav,InquiryVO vo) 
					throws ServletException, IOException {
		int iroot=0;
		int istep=0;
		int iindent=0;
		
		HttpSession session = request.getSession();
		iroot=(Integer)session.getAttribute("iroot");
		istep=(Integer)session.getAttribute("istep");
		iindent=(Integer)session.getAttribute("iindent");
		
		vo.setRoot(iroot);
		vo.setStep(++istep);
		vo.setIndent(++iindent);
		
		mDao.ireplyi(vo);
		
		mav.setViewName("redirect:TIList");
		return mav;
	}
	@RequestMapping(value="/replyUpdate")
	public ModelAndView inquiryUpdate
	(ModelAndView mav, InquiryVO vo) 
			throws ServletException, IOException {
		mDao.replyUpdate(vo) ;
		mav.setViewName("redirect:TIList");
		return mav;
	}
}