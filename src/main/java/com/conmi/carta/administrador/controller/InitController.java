package com.conmi.carta.administrador.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class InitController {

	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/tablero")
	public ModelAndView tablero() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/pages/tablero");
		return mav;
	}
}
