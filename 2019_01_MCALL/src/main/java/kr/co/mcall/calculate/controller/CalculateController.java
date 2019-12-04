package kr.co.mcall.calculate.controller;

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
public class CalculateController {
	@RequestMapping(value = "/page/calculate/calculate")
	 public String calculate_calculate(){
	  return "page/calculate/calculate";
	 }
	
	@RequestMapping(value = "/page/calculate/A")
	 public String calculate_A(){
	  return "page/calculate/A";
	 }
	
	@RequestMapping(value = "/page/calculate/B")
	 public String calculate_B(){
	  return "page/calculate/B";
	 }
	
	@RequestMapping(value = "/page/calculate/C")
	 public String calculate_C(){
	  return "page/calculate/C";
	 }
	
	/*
	@RequestMapping(value = "/page/stock/stock_have_move_ajax")
	 public String stock_stock_have_move(){
	  return "page/stock/stock_have_move_ajax";
	 }
	
	@RequestMapping(value = "/page/stock/stock_goods_modify_ajax")
	 public String stock_stock_goods_modify(){
	  return "page/stock/stock_goods_modify_ajax";
	 }
	@RequestMapping(value = "/page/stock/stock_goods_history_ajax")
	 public String stock_stock_goods_history_ajax(){
	  return "page/stock/stock_goods_history_ajax";
	 }
	
	@RequestMapping(value = "/page/stock/out_input_ajax")
	 public String stock_out_input_ajax(){
	  return "page/stock/out_input_ajax";
	 }
	
	@RequestMapping(value = "/page/stock/enter_iframe1")
	 public String stock_enter_iframe1(){
	  return "page/stock/enter_iframe1";
	 }
	
	@RequestMapping(value = "/page/stock/stock_detail_list_ajax")
	 public String stock_stock_detail_list_ajax(){
	  return "page/stock/stock_detail_list_ajax";
	 }
	
	@RequestMapping(value = "/page/stock/stock_detail_info_ajax")
	 public String stock_stock_detail_info_ajax(){
	  return "page/stock/stock_detail_info_ajax";
	 }
	*/
}
