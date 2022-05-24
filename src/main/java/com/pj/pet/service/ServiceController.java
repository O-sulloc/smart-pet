package com.pj.pet.service;


import java.beans.PropertyEditorSupport;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pj.pet.reservation.ReservationVO;
import com.pj.pet.user.UserVO;
import com.pj.pet.util.CalendarTest;
import com.pj.pet.util.Pager;



@Controller
@RequestMapping("service/*")
public class ServiceController {

	@Autowired
	private ServiceService serviceService;
	
	@ModelAttribute("service")
	public String getService() {
		return "service";
	}
	
	//String to Date 
	@InitBinder // 이렇게 표시를 해야만 프론트 컨트롤러가 요청 핸들러를 호출하기 전에 먼저 이 메서드를호출한다.
	  	public void initBinder(WebDataBinder binder) {

		// 이 메서드는 요청이 들어올 때 마다 파라미터 값을 준비하기 위해 
		// 파라미터의 개수 만큼 호출된다.
		System.out.println("파라미터 개수 만큼 호출됨");

		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");
		binder.registerCustomEditor(
				java.sql.Date.class, 
				
				
				new CustomDateEditor(dateFormat, false)
				
				);
		
		
//		// java.lang.String ===> java.sql.Date 변환시켜주는 프로퍼티 에디터 등록
//		binder.registerCustomEditor(
//				java.util.Date.class, /* 요청 핸들러의 파라미터 타입 */ 
//				new PropertyEditorSupport() {
//						@Override
//						public void setAsText(String text) throws IllegalArgumentException {
//							System.out.println(text); //14:00
//							SimpleDateFormat format = new SimpleDateFormat("HH:mm");
//							Date date=null;
//							try {
//								date= format.parse(text);
//								System.out.println();
//								setValue(date);
//							} catch (ParseException e) {
//								format = new SimpleDateFormat("HH:mm");
//								try {
//									date = format.parse(text);
//								} catch (ParseException e1) {
//									e1.printStackTrace();
//								}
//							}
//							
//							
//							setValue(date);
//							System.out.println(date); //Thu Jan 01 14:00:00 KST 1970
//							// "text" 파라미터는 클라이언트가 보낸 데이터이다.
//							// 이렇게 문자열로 보낸 데이터는 java.sql.Date 객체로 바꿔야 한다.
////							DateTimeFormatter formatDateTime = DateTimeFormatter.ofPattern("HH:mm");
//        	 
//            
//         }
//     });
	}
	
	
	
	//예약세팅 등록 폼 
	@GetMapping("reservationSetting")
	public ModelAndView setReservationSetting()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("service/reservationSetting");
		return mv;
	}
	
	
	
	//예약세팅 DB에 전송 
	@PostMapping("reservationSetting")
	public ModelAndView setReservationSetting(HttpSession session,ReservationSettingVO reservationSettingVO,String[] times)throws Exception{

		ModelAndView mv= new ModelAndView();
		ServiceVO serviceVO=new ServiceVO();
		UserVO userVO=(UserVO) session.getAttribute("user");
		serviceVO.setId(userVO.getId());
		serviceVO=serviceService.getDetail(serviceVO);
		System.out.println(serviceVO.getSerNum());//서비스 넘 가져오기 
		reservationSettingVO.setSerNum(serviceVO.getSerNum());
		
		int result=serviceService.setReservationSetting(reservationSettingVO);
		
		ReservationTimeVO reservationTimeVO= new ReservationTimeVO();
		reservationTimeVO.setTimecase((long)0);
		reservationTimeVO.setOpenTime(times[0]);
		reservationTimeVO.setCloseTime(times[1]);
		reservationTimeVO.setSerNum(serviceVO.getSerNum()); //지울지 말지 ?
		int result2= serviceService.setReservationTime(reservationTimeVO);
		System.out.println("1:"+result2);
		
		ReservationTimeVO reservationTimeVO2= new ReservationTimeVO();
		reservationTimeVO2.setTimecase((long)1);
		reservationTimeVO2.setOpenTime(times[2]);
		reservationTimeVO2.setCloseTime(times[3]);
		reservationTimeVO2.setSerNum(serviceVO.getSerNum()); //지울지 말지 ?
		int result3= serviceService.setReservationTime(reservationTimeVO2);
		System.out.println("2:"+result3);
		return mv;
	}
	
	@GetMapping("reservationManage")
	public ModelAndView reservationManage()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("service/reservationManage");
		return mv;
	}
	
	//서비스 등록 폼 
	@GetMapping("registration")
	public ModelAndView setService()throws Exception{
		ModelAndView mv= new ModelAndView();
		
		mv.setViewName("service/registration");
		return mv;
	}
	
	//서비스 등록 DB 전송  
	@PostMapping("registration")
	public ModelAndView setService(ServiceVO serviceVO,MultipartFile file)throws Exception{
		ModelAndView mv= new ModelAndView();
		int result=serviceService.setService(serviceVO,file);
		mv.setViewName("service/mypage");
		return mv;
	}
	//service mypage 
	@GetMapping("mypage")
	public ModelAndView getDetail(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		ServiceVO serviceVO=new ServiceVO();
		UserVO userVO=(UserVO) session.getAttribute("user");
		serviceVO.setId(userVO.getId());
		serviceVO= serviceService.getDetail(serviceVO);
		
		mv.addObject("vo",serviceVO);
		mv.setViewName("service/mypage");
		return mv;
	}
	//service mypage update form 
	@GetMapping("update")
	public ModelAndView setUpate(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		ServiceVO serviceVO= new ServiceVO();
		UserVO userVO=(UserVO) session.getAttribute("user");
		serviceVO.setId(userVO.getId());
		serviceVO= serviceService.getDetail(serviceVO);
		
		mv.addObject("vo",serviceVO);
		mv.setViewName("service/update");
		return mv;
	}
	//service mypage update db전송 
	@PostMapping("update")
	public ModelAndView setUpdate(ServiceVO serviceVO,MultipartFile file)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result=serviceService.setUpdate(serviceVO,file);
		mv.setViewName("redirect:./mypage");
		return mv;
	}
	
	@GetMapping("delete")
	public ModelAndView setDelete(ServiceVO serviceVO)throws Exception{
		ModelAndView mv= new ModelAndView();
		
		int result=serviceService.setDelete(serviceVO);
		if(result>0) {
			mv.setViewName("common/getResult");
			mv.addObject("msg", "삭제 완료되었습니다.");
			mv.addObject("path", "../");
		}else {
			mv.setViewName("common/getResult");
			mv.addObject("msg", "삭제 실패하였습니다..");
			mv.addObject("path", "#");
		}
		return mv;
	}
	
	
	//예약 현황 List
	@GetMapping("reservationList")
	public ModelAndView getList(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		ServiceVO serviceVO= new ServiceVO();
		UserVO userVO=(UserVO) session.getAttribute("user");
		List<ReservationVO> ar=serviceService.getList(userVO);
		
		mv.addObject("list", ar);
		mv.setViewName("service/reservationList");
		return mv;
	}
	
	@GetMapping("manage")
	public ModelAndView manage()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("service/manage");
		return mv;
	}
	
	// 예약 시간 띄어주기 (서비스 상세 정보)
	@GetMapping("detail")
	   public ModelAndView getAllReservationSetting(ServiceVO serviceVO) throws Exception{
	      ModelAndView mv = new ModelAndView();
	      
	      serviceVO= serviceService.getService(serviceVO);
	      ReservationSettingVO reservationSettingVO=serviceService.getAllReservationSetting(serviceVO);
	      
		  mv.addObject("seviceVO",serviceVO);
	      mv.addObject("settingVO",reservationSettingVO);
	      mv.setViewName("service/detail");
	      return mv;
	   }
	
	//서비스 목록
	@GetMapping("list")
	public ModelAndView getList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ServiceVO> ar = serviceService.getListc(pager);
		mv.addObject("list",ar);
		mv.setViewName("service/list");
		
		return mv;
	
	}
//	@GetMapping("detail")
//	public ModelAndView getDetail(ServiceVO serviceVO) throws Exception{
//		ModelAndView mv = new ModelAndView();
//		serviceVO=serviceService.getDetail(serviceVO);
//		mv.addObject("vo",serviceVO);
//		mv.setViewName("service/detail");
//		return mv;
//	}
	

	

}
