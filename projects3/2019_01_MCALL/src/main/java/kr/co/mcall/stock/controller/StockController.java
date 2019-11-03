package kr.co.mcall.stock.controller;

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
public class StockController {
	@RequestMapping(value = "/page/stock/stock")
	 public String stock_stock(){
	  return "page/stock/stock";
	 }
	
	@RequestMapping(value = "/page/stock/return")
	 public String stock_return(){
	  return "page/stock/return";
	 }
	
	@RequestMapping(value = "/page/stock/out")
	 public String stock_out(){
	  return "page/stock/out";
	 }
	
	@RequestMapping(value = "/page/stock/lose")
	 public String stock_lose(){
	  return "page/stock/lose";
	 }
	
	@RequestMapping(value = "/page/stock/enter")
	 public String stock_enter(){
	  return "page/stock/enter";
	 }
	


}
