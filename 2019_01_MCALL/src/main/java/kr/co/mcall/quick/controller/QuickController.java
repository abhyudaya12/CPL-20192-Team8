package kr.co.mcall.quick.controller;

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
public class QuickController {

	@RequestMapping(value = "/page/quick/stockAG")
	 public String quick_stockAG(){
	  return "page/quick/stockAG";
	 }
	
	@RequestMapping(value = "/page/quick/record")
	 public String quick_record(){
	  return "page/quick/record";
	 }
	
	@RequestMapping(value = "/page/quick/quick")
	 public String quick_quick(){
	  return "page/quick/quick";
	 }
	
	@RequestMapping(value = "/page/quick/manageAG")
	 public String quick_manageAG(){
	  return "page/quick/manageAG";
	 }
	
}
