package kr.co.mcall.setting.controller;

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
public class SettingController {
	@RequestMapping(value = "/page/setting/setting")
	 public String setting_setting(){
	  return "page/setting/setting";
	 }
	
	@RequestMapping(value = "/page/setting/A")
	 public String setting_A(){
	  return "page/setting/A";
	 }
	
	@RequestMapping(value = "/page/setting/B")
	 public String setting_B(){
	  return "page/setting/B";
	 }
	
	@RequestMapping(value = "/page/setting/C")
	 public String setting_C(){
	  return "page/setting/C";
	 }
	
	@RequestMapping(value = "/page/setting/D")
	 public String setting_D(){
	  return "page/setting/D";
	 }
	
	@RequestMapping(value = "/page/setting/E")
	 public String setting_E(){
	  return "page/setting/E";
	 }
	
	@RequestMapping(value = "/page/setting/F")
	 public String setting_F(){
	  return "page/setting/F";
	 }
}
