package kr.co.mcall.customer.controller;

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
public class CustomerController {
	@RequestMapping(value = "/page/customer/customer")
	 public String customer_customer(){
	  return "page/customer/customer";
	 }
	
	@RequestMapping(value = "/page/customer/A")
	 public String customer_A(){
	  return "page/customer/A";
	 }
	
	
}
