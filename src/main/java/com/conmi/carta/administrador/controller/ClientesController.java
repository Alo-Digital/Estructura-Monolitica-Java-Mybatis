package com.conmi.carta.administrador.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.conmi.carta.administrador.domain.Clientes;
import com.conmi.carta.administrador.domain.dto.ClientesDto;
import com.conmi.carta.administrador.service.ClienteService;
import com.conmi.carta.administrador.service.PlanService;
import com.conmi.carta.administrador.utils.ValidatorPadreController;

import lombok.experimental.var;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("clientes")
@Slf4j
public class ClientesController extends ValidatorPadreController{

	@Autowired
	ClienteService clienteservice;

	@GetMapping
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/pages/clientes");
		return mav;
	}

	@GetMapping("/lista")
	@ResponseBody
	public ResponseEntity<?> getClientes(@RequestParam("activo") int activo,@RequestParam("ruc") String ruc) {
		log.trace("=================== LISTA DE CLIENTES==========================");
		log.trace("===============================================================");
		List<ClientesDto> clientes = clienteservice.getclientesDto(activo,ruc);
		return new ResponseEntity<List<ClientesDto>>(clientes, HttpStatus.OK);
	}

	@PostMapping("/registrar")
	@ResponseBody
	public ResponseEntity<?> registrarCliente(@RequestBody Clientes cliente) {
		log.trace("================== REGISTRO DE CLIENTES =======================");
		log.trace("===============================================================");
		
		limpiarVariables();
		
		errores = validator.ValidarRegistroCliente(cliente);
		if(!errores.isEmpty()) {
			rpta.put("errores", errores);
			return new ResponseEntity<Map<String,Object>>(rpta, HttpStatus.BAD_REQUEST); 
		}
		 
		clienteservice.registrarCliente(cliente);

		return new ResponseEntity<Clientes>(cliente, HttpStatus.OK);
	}

}
