package com.conmi.carta.administrador.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.conmi.carta.administrador.service.PlanService;
import com.conmi.carta.administrador.utils.ValidatorPadreController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LetrasController extends ValidatorPadreController{

	@Autowired
	PlanService planservice;

	@GetMapping("/letras")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/pages/letras");
		return mav;
	}
}
