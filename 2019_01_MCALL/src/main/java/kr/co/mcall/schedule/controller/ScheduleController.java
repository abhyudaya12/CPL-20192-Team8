package kr.co.mcall.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ScheduleController {
	@RequestMapping(value = "/page/schedule/schedule")
	 public String schedule_schedule(){
	  return "page/schedule/schedule";
	 }
	
	@RequestMapping(value = "/page/schedule/A")
	 public String schedule_A(){
	  return "page/schedule/A";
	 }
}
