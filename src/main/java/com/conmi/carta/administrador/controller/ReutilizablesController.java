package com.conmi.carta.administrador.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.conmi.carta.administrador.domain.ComboBox;
import com.conmi.carta.administrador.domain.Plan;
import com.conmi.carta.administrador.service.PlanService;

@RequestMapping("reutilizable")
@Controller
public class ReutilizablesController {

	@Autowired
	PlanService planservice;
	
	@GetMapping("/comboplanes")
	public @ResponseBody ResponseEntity<?> getComboPlanes(){
		
		List<ComboBox> planes =planservice.getcboplanes(); 
				
		return new ResponseEntity<List<ComboBox>>(planes,HttpStatus.OK);
	}
}
