package com.pj.pet.service;

import java.beans.PropertyEditorSupport;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.aop.ThrowsAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.pj.pet.util.MailService;
import com.pj.pet.util.Pager;
import com.pj.pet.util.ReservationMailService;

@Controller
@RequestMapping("service/*")
public class ServiceController {

	@Autowired
	private ServiceService serviceService;

	@Autowired
	private ReservationMailService reservationMailService;
	

	@ModelAttribute("service")
	public String getService() {
		return "service";
	}


	@GetMapping("completionCheck")
	public ModelAndView completionCheck()throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("service/completionCheck");
		return mv;
	}
	
	@PostMapping("sendEmail")
	public void sendEmail(ReservationVO reservationVO)throws Exception{
		UserVO userVO=serviceService.findEmail(reservationVO);
		
		reservationVO=serviceService.getMailData(reservationVO);
		
		//이메일주소, 내용 
		reservationMailService.sendReservationMail(userVO.getEmail(),"["+reservationVO.getSerName()+"]"+ reservationVO.getResDate()+" "+reservationVO.getResTime().substring(0,5)+"에 예약이 승인되었습니다.");
		
	}
	
	//예약세팅 업데이트 폼 
	@GetMapping("updateReservationSetting")
	public ModelAndView UpdateReservationSetting(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		UserVO userVO=(UserVO)session.getAttribute("user");
		ReservationSettingVO reservationSettingVO=serviceService.getReservationSetting(userVO);
		if(reservationSettingVO != null) {
			List<ReservationTimeVO> timeList=serviceService.getReservationTime(userVO);
			
			mv.addObject("setting", reservationSettingVO);
			mv.addObject("time", timeList);
			mv.setViewName("service/updateReservationSetting");
		}else {
			mv.setViewName("common/getResult");
			mv.addObject("msg", "예약시간 설정 페이지로 이동합니다.");
			mv.addObject("path", "./reservationSetting");
		}
		return mv;
	}

	@PostMapping("updateReservationSetting")
	public ModelAndView UpdateReservationSetting(HttpSession session, ReservationSettingVO reservationSettingVO,
			String[] times) throws Exception {
		ModelAndView mv = new ModelAndView();
		ServiceVO serviceVO = new ServiceVO();
		UserVO userVO = (UserVO) session.getAttribute("user");
		serviceVO.setId(userVO.getId());
		serviceVO = serviceService.getDetail(serviceVO);
		reservationSettingVO.setSerNum(serviceVO.getSerNum());
		int result = serviceService.updateReservationSetting(reservationSettingVO);

		ReservationTimeVO reservationTimeVO = new ReservationTimeVO();
		reservationTimeVO.setTimecase((long) 0);
		reservationTimeVO.setOpenTime(times[0]);
		reservationTimeVO.setCloseTime(times[1]);
		reservationTimeVO.setSerNum(serviceVO.getSerNum());
		int result2 = serviceService.updateReservationTime(reservationTimeVO);
		System.out.println("1:" + result2);

		ReservationTimeVO reservationTimeVO2 = new ReservationTimeVO();
		reservationTimeVO2.setTimecase((long) 1);
		reservationTimeVO2.setOpenTime(times[2]);
		reservationTimeVO2.setCloseTime(times[3]);
		reservationTimeVO2.setSerNum(serviceVO.getSerNum());
		int result3 = serviceService.updateReservationTime(reservationTimeVO2);
		System.out.println("2:" + result3);

		if (result > 0 && result2 > 0) {
			mv.setViewName("common/getResult");
			mv.addObject("msg", "저장되었습니다.");
			mv.addObject("path", "./mypage");
		} else {
			mv.setViewName("common/getResult");
			mv.addObject("msg", "실패했습니다.");
			mv.addObject("path", "#");
		}
		return mv;
	}

	// 예약세팅 등록 폼
	@GetMapping("reservationSetting")
	public ModelAndView setReservationSetting() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("service/reservationSetting");
		return mv;
	}

	// 예약세팅 DB에 전송
	@PostMapping("reservationSetting")
	public ModelAndView setReservationSetting(HttpSession session, ReservationSettingVO reservationSettingVO,
			String[] times) throws Exception {

		ModelAndView mv = new ModelAndView();
		ServiceVO serviceVO = new ServiceVO();
		UserVO userVO = (UserVO) session.getAttribute("user");
		serviceVO.setId(userVO.getId());
		serviceVO = serviceService.getDetail(serviceVO);
		System.out.println(serviceVO.getSerNum());// 서비스 넘 가져오기
		reservationSettingVO.setSerNum(serviceVO.getSerNum());

		int result = serviceService.setReservationSetting(reservationSettingVO);

		ReservationTimeVO reservationTimeVO = new ReservationTimeVO();
		reservationTimeVO.setTimecase((long) 0);
		reservationTimeVO.setOpenTime(times[0]);
		reservationTimeVO.setCloseTime(times[1]);
		reservationTimeVO.setSerNum(serviceVO.getSerNum()); // 지울지 말지 ?
		int result2 = serviceService.setReservationTime(reservationTimeVO);
		System.out.println("1:" + result2);

		ReservationTimeVO reservationTimeVO2 = new ReservationTimeVO();
		reservationTimeVO2.setTimecase((long) 1);
		reservationTimeVO2.setOpenTime(times[2]);
		reservationTimeVO2.setCloseTime(times[3]);
		reservationTimeVO2.setSerNum(serviceVO.getSerNum()); // 지울지 말지 ?
		int result3 = serviceService.setReservationTime(reservationTimeVO2);
		System.out.println("2:" + result3);

		if (result > 0 && result2 > 0) {
			mv.setViewName("common/getResult");
			mv.addObject("msg", "저장되었습니다.");
			mv.addObject("path", "./mypage");
		} else {
			mv.setViewName("common/getResult");
			mv.addObject("msg", "실패했습니다.");
			mv.addObject("path", "#");
		}
		return mv;

	}

	@GetMapping("reservationManage")
	public ModelAndView reservationManage() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("service/reservationManage");
		return mv;
	}

	// 서비스 등록 폼
	@GetMapping("registration")
	public ModelAndView setService() throws Exception {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("service/registration");
		return mv;
	}

	// 서비스 등록 DB 전송
	@PostMapping("registration")
	public ModelAndView setService(ServiceVO serviceVO,MultipartFile file)throws Exception{
		ModelAndView mv= new ModelAndView();
		int result=serviceService.setService(serviceVO,file);
		mv.setViewName("redirect:./mypage");
		return mv;
	}

	// service mypage
	@GetMapping("mypage")
	public ModelAndView getDetail(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		ServiceVO serviceVO = new ServiceVO();
		UserVO userVO = (UserVO) session.getAttribute("user");
		serviceVO.setId(userVO.getId());
		serviceVO = serviceService.getDetail(serviceVO);

		mv.addObject("vo", serviceVO);
		mv.setViewName("service/mypage");
		return mv;
	}

	// service mypage update form
	@GetMapping("update")
	public ModelAndView setUpate(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		ServiceVO serviceVO = new ServiceVO();
		UserVO userVO = (UserVO) session.getAttribute("user");
		serviceVO.setId(userVO.getId());
		serviceVO = serviceService.getDetail(serviceVO);

		mv.addObject("vo", serviceVO);
		mv.setViewName("service/update");
		return mv;
	}

	// service mypage update db전송
	@PostMapping("update")
	public ModelAndView setUpdate(ServiceVO serviceVO, MultipartFile file) throws Exception {
		ModelAndView mv = new ModelAndView();

		int result = serviceService.setUpdate(serviceVO, file);
		mv.setViewName("redirect:./mypage");
		return mv;
	}

	@GetMapping("delete")
	public ModelAndView setDelete(ServiceVO serviceVO) throws Exception {
		ModelAndView mv = new ModelAndView();

		int result = serviceService.setDelete(serviceVO);
		if (result > 0) {
			mv.setViewName("common/getResult");
			mv.addObject("msg", "삭제 완료되었습니다.");
			mv.addObject("path", "../");
		} else {
			mv.setViewName("common/getResult");
			mv.addObject("msg", "삭제 실패하였습니다..");
			mv.addObject("path", "#");
		}
		return mv;
	}

	// 예약리스트 월별 카운트
	@GetMapping("ajaxMonthCountList")
	public ModelAndView getAjaxMonthCountList(ReservationVO reservationVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		UserVO userVO = (UserVO) session.getAttribute("user");
		reservationVO.setId(userVO.getId());

		List<ReservationVO> ar = serviceService.getResStateCount(reservationVO);
		System.out.println(ar.size());
		mv.addObject("list", ar);
		mv.setViewName("common/resStateCount");
		return mv;
	}

	// 예약리스트 월별
	@GetMapping("ajaxMonthReservationList")
	public ModelAndView getAjaxMonthReservationList(Pager pager, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		UserVO userVO = (UserVO) session.getAttribute("user");
		pager.setId(userVO.getId());
		List<ReservationVO> ar = serviceService.getMonthReservationList(pager);

		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("common/reservationList");
		return mv;
	}

	@GetMapping("monthListPage")
	public ModelAndView monthListPage() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("service/monthListPage");
		return mv;
	}

	// 예약 현황 List보여주는 페이지로가
	@GetMapping("reservationList")
	public ModelAndView getList() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("service/reservationList");
		return mv;
	}

	// 대기중인 예약리스트 보여주는 페이지
	@GetMapping("resState0Page")
	public ModelAndView resState0Page() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("service/resState0Page");
		return mv;
	}

	// 예약리스트 날짜별
	@GetMapping("ajaxDayReservationList")
	public ModelAndView getAjaxDayReservationList(Pager pager, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		UserVO userVO = (UserVO) session.getAttribute("user");
		pager.setId(userVO.getId());
		List<ReservationVO> ar = serviceService.getDayReservationList(pager);

		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("common/reservationList");
		return mv;
	}

	// 예약리스트 날짜별 페이지 이동
	@GetMapping("getDayReservationList")
	public ModelAndView getDayReservationList(Pager pager, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("service/dayReservationList");
		return mv;
	}

	// 예약리스트 최신순
	@GetMapping("ajaxReservationList")
	public ModelAndView getAjaxReservationList(Pager pager, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		UserVO userVO = (UserVO) session.getAttribute("user");
		pager.setId(userVO.getId());
		List<ReservationVO> ar = serviceService.getReservationList(pager);

		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("common/reservationList");
		return mv;
	}

	// 대기중인 예약리스트 에이작스
	@GetMapping("ajaxgetResStateIs0List")
	public ModelAndView getResStateIs0List(Pager pager, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		UserVO userVO = (UserVO) session.getAttribute("user");
		pager.setId(userVO.getId());
		List<ReservationVO> ar = serviceService.getResStateIs0(pager);

		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("common/reservationList");
		return mv;
	}

	@GetMapping("manage")
	public ModelAndView manage() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("service/manage");
		return mv;
	}

	// 예약 시간 띄어주기 (서비스 상세 정보) + 파일정보
	@GetMapping("detail")
	public ModelAndView getAllReservationSetting(ServiceVO serviceVO) throws Exception {
		ModelAndView mv = new ModelAndView();

		serviceVO = serviceService.getService(serviceVO);
		ReservationSettingVO reservationSettingVO = serviceService.getAllReservationSetting(serviceVO);

		mv.addObject("seviceVO", serviceVO);
		mv.addObject("settingVO", reservationSettingVO);
		mv.setViewName("service/detail");
		return mv;
	}

	@PostMapping("setUpdateResState")
	public ModelAndView setUpdateResState(ReservationVO reservationVO) throws Exception {
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!");
		ModelAndView mv = new ModelAndView();
		int result = serviceService.setUpdateResState(reservationVO);

		mv.setViewName("common/result");
		mv.addObject("result", result); // 0or1 보내 에이작스에
		return mv;
	}

	// 서비스 목록 serKind 1 병원
	@GetMapping("hospitalList") 
	public ModelAndView getListc(Pager pager) throws Exception{
	  ModelAndView mv = new ModelAndView();
	  ServiceVO serviceVO = new ServiceVO();
	  List<ServiceVO> ar=serviceService.getServiceKind(serviceVO);
	  ar =serviceService.getListc(pager);
	  
	  for(ServiceVO serviceVOs : ar) {
		  if(serviceVOs.getSerKind()==1L) {
			  
			  mv.addObject("list",ar);
			  mv.setViewName("service/hospitalList"); 
			  return mv;
		  }
	  }
	  return null;
	  
	}
	 
	// 서비스 목록 serKind 1 병원/ 2 미용실 뿌려줄 때 필요
	public Model getServiceKind(ServiceVO serviceVO,Model model) throws Exception{
		  List<ServiceVO> ar = serviceService.getServiceKind(serviceVO);
		  model.addAttribute("vo",serviceVO);
		  return model;
	  }
	  
	// 서비스 목록 serKind 2 샵
	@GetMapping("shopList")
	public ModelAndView getListc(Pager pager,ModelAndView mv) throws Exception{
		
		ServiceVO serviceVO = new ServiceVO();
		  List<ServiceVO> ar=serviceService.getServiceKind(serviceVO);
		  ar =serviceService.getListc(pager);
		  
		  for(ServiceVO serviceVOs : ar) {
			  if(serviceVOs.getSerKind()==2L) {
				  
				  mv.addObject("list",ar);
				  mv.setViewName("service/shopList"); 
				  return mv;
			  }
		  }
		  return null;
		  
	}

}
