package com.ncs.green.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.green.util.TMemberService;
import com.ncs.green.vo.BodyVO;
import com.ncs.green.vo.InquiryVO;
import com.ncs.green.vo.PageVO;
import com.ncs.green.vo.TmemberVO;
import com.ncs.green.vo.UserVO;

@Controller
public class TMemberController {
	@Autowired
	private TMemberService mDao ;
	
	@RequestMapping(value="/")
	public String home() {
		return "indexA";
	}
	
	@RequestMapping(value="/tJoinForm")
	public String tJoin() {
		return "tmember/tJoinForm";
	}
	
	@RequestMapping(value="/checkForm")
	public String checkform() {
		return "tmember/checkForm";
	}
	
	@RequestMapping(value="/tloginForm")
	public String tloginform() {
		return "tmember/tloginForm";
	}
	
	@RequestMapping(value="/inquiryGo")
	public String inquiryGo() {
		return "tmember/inquiryGo";
	}
	@RequestMapping(value="/admin")
	public String admin() {
		return "admin/adminHome";
	}
	@RequestMapping(value="/tHome")
	public ModelAndView tHome(HttpServletRequest request,ModelAndView mav,TmemberVO mvo) {
		
		HttpSession session = request.getSession(false);
		mvo = (TmemberVO)session.getAttribute("Lemon");
		
		if(mvo==null)
			mav.setViewName("indexA");
		else if(mvo!=null)
			mav.setViewName("indexB");
		return mav;
	}
	
	@RequestMapping(value="/tjoin")
	public ModelAndView tmemberJoin(HttpServletRequest request, 
			HttpServletResponse response, ModelAndView mav, TmemberVO mvo)
					throws ServletException, IOException {
		mDao.tInsert(mvo) ;
		mav.setViewName("tmember/tmemberS");
		return mav;
		
	} 
	@RequestMapping(value="/tbjoin")
	public ModelAndView tBodyInsert(HttpServletRequest request, 
			HttpServletResponse response, ModelAndView mav, TmemberVO mvo, BodyVO bvo)
					throws ServletException, IOException {
		if (mvo.getId()==null) {
			HttpSession  session = request.getSession(false);
			mvo = (TmemberVO)session.getAttribute("Lemon");
			bvo.setId(mvo.getId());
		}
		mDao.tbInsert(bvo);
		HttpSession session = request.getSession() ;
		session.setAttribute("body", bvo);
		mav.setViewName("redirect:tHome");
		return mav;
		
	} 
	
	@RequestMapping(value="/tbupdate")
	public ModelAndView tbUpdate
	(HttpServletRequest request,ModelAndView mav, TmemberVO mvo, BodyVO bvo) 
			throws ServletException, IOException {
		
		if (mvo.getId()==null) {
			HttpSession  session = request.getSession(false);
			mvo = (TmemberVO)session.getAttribute("Lemon");
			bvo.setId(mvo.getId());
		}
		
		mDao.tbUpdate(bvo) ;
		HttpSession session = request.getSession() ;
		session.setAttribute("body", bvo);
		mav.setViewName("indexB");
		return mav;
	}
	
	@RequestMapping(value="/joincheck")
	public ModelAndView joinCheck(HttpServletRequest request, 
			ModelAndView mav, TmemberVO mvo, UserVO uvo)  
					throws ServletException, IOException {
		mvo = null ;
		mvo = mDao.tDetailJ(uvo) ;
		int idresult = 0 ;
		if ( mvo!=null )  idresult = 1 ;
		mav.addObject("userid",uvo.getId()) ;
		mav.addObject("idresult",idresult) ;
		mav.setViewName("tmember/joincheck1");
		
		return mav;
	} // idDupCheck
	
	@RequestMapping(value="/tlogin")
	public ModelAndView tlogin
	(HttpServletRequest request, ModelAndView mav, UserVO uvo, TmemberVO mvo,BodyVO bvo)  
			throws ServletException, IOException {
		mvo = null ;
		mvo = mDao.tDetail(uvo) ;
		bvo = mDao.tbDetail(bvo);
		
		HttpSession session = request.getSession() ;
		session.setAttribute("Lemon", mvo);
		session.setAttribute("body", bvo);
		
		mav.addObject("idcheck", mvo);
		mav.setViewName("tmember/tlogincheck");
		
		return mav;
	}
	
	@RequestMapping(value="/tlogout")
	public ModelAndView tlogout
	(HttpServletRequest request, ModelAndView mav, UserVO uvo, TmemberVO mvo,BodyVO bvo)  
			throws ServletException, IOException {
		HttpSession session = request.getSession() ;
		session.invalidate();
		mav.setViewName("indexA");
		
		return mav;
	} // tlogin
	
	@RequestMapping(value="/tupdate")
	public ModelAndView tUpdate
	(HttpServletRequest request,ModelAndView mav, TmemberVO vo) 
			throws ServletException, IOException {
		mDao.tUpdate(vo) ;
		mav.setViewName("indexB");
		HttpSession session = request.getSession() ;
		session.setAttribute("Lemon", vo);
		return mav;
	} 
	
	@RequestMapping(value="/tdelete")
	public ModelAndView tDelete(HttpServletRequest request, 
			HttpServletResponse response, ModelAndView mav, TmemberVO vo, BodyVO bvo)
					throws ServletException, IOException {

		if (vo.getId()==null) {
			HttpSession  session = request.getSession(false) ;
			vo = (TmemberVO)session.getAttribute("Lemon") ;
			bvo = (BodyVO)session.getAttribute("body") ;
		}
		int cnt = mDao.tDelete(vo) ;
		mDao.tbDelete(bvo);
		if(cnt>0) {
			mav.setViewName("indexA");
		}
		return mav;
	} 
	
	@RequestMapping(value="/inquiry")
	public ModelAndView pageList(HttpServletRequest request,
			ModelAndView mav, TmemberVO vo, PageVO pvo, InquiryVO ivo)
					throws ServletException, IOException {
					
					HttpSession  session = request.getSession() ;
					vo = (TmemberVO)session.getAttribute("Lemon") ;
					int totalCount = mDao.totalCount(vo) ;
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
					pvo.setWid(vo.getId());
					List<InquiryVO> bList =  mDao.inquiryList(pvo);
					
					int totalPage = totalCount / perPage ;
					if (totalCount % perPage !=0) totalPage++ ;
					
					mav.addObject("inquiry", bList);
					mav.addObject("totalPage", totalPage);
					mav.addObject("currPage", cPage);
					mav.setViewName("tmember/inquiryList");
					return mav ;
	}
	
	@RequestMapping(value="/inquiryInsert")
	public ModelAndView inquiryInsert(HttpServletRequest request,ModelAndView mav, TmemberVO mvo,InquiryVO vo)
			throws ServletException, IOException {

		HttpSession  session = request.getSession();
		mvo = (TmemberVO)session.getAttribute("Lemon");
		vo.setWid(mvo.getId());
		session.setAttribute("iqList", vo);
		mDao.inquiryInsert(vo) ;
		System.out.println(mvo.getId());
		mav.setViewName("redirect:inquiry");
		
		return mav;
	}
	
	@RequestMapping(value="/inquiryDetail")
	public ModelAndView boardDetail
	(HttpServletRequest request, ModelAndView mav, TmemberVO mvo,InquiryVO vo) 
			throws ServletException, IOException {
		
		vo = mDao.inquiryDetail(vo);
		String title = vo.getTitle();
		int index = title.indexOf(']');
		String ext = title.substring(index+1);
		vo.setTitle(ext);
		
		mav.addObject("Inquiry", vo);
		if(vo.getIndent()>0)
			mav.setViewName("tmember/replyDetail");
		else
			mav.setViewName("tmember/inquiryDetail");
		return mav;
	}
	
	@RequestMapping(value="/inquiryUpdate")
	public ModelAndView inquiryUpdate
	(ModelAndView mav, InquiryVO vo) 
			throws ServletException, IOException {
		mDao.inquiryUpdate(vo) ;
		mav.setViewName("redirect:inquiry");
		return mav;
	}
	
	@RequestMapping(value="/inquiryDelete")
	public ModelAndView bDelete
	(HttpServletRequest request, ModelAndView mav,InquiryVO vo) 
					throws ServletException, IOException {
		mDao.inquiryDelete(vo) ;
		mav.setViewName("redirect:inquiry");
		return mav;
	}

}