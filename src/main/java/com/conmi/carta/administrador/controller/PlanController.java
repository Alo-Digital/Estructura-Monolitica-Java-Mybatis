package com.conmi.carta.administrador.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.conmi.carta.administrador.domain.Plan;
import com.conmi.carta.administrador.domain.Plan_detalle;
import com.conmi.carta.administrador.service.PlanService;
import com.conmi.carta.administrador.service.Plan_detalleService;
import com.conmi.carta.administrador.utils.ErrorHelp;
import com.conmi.carta.administrador.utils.Validator;
import com.conmi.carta.administrador.utils.ValidatorPadreController;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("planes")
@Slf4j
public class PlanController extends ValidatorPadreController{

	@Autowired
	PlanService planservice;

	@Autowired
	Plan_detalleService plandetalleservice;
 

	@GetMapping
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/pages/planes");
		return mav;
	}

	@GetMapping("/lista")
	@ResponseBody
	public ResponseEntity<?> getplanes() {
		log.trace("ENTRANDO A PLAN...............");
		return new ResponseEntity<>(planservice.getplanes(), HttpStatus.OK);
	}

	@GetMapping("/lista/{id}")
	@ResponseBody
	public ResponseEntity<?> getplan(@PathVariable("id") int id) {
		// log.trace("ENTRANDO A PLAN...............");
		return new ResponseEntity<>(planservice.getplanporId(id), HttpStatus.OK);
	}

	@PostMapping("/registrar")
	@ResponseBody
	public ResponseEntity<?> registrarplan(@RequestBody Plan plan) {

		log.trace("============REGISTRANDO A PLAN============");
		log.trace("==========================================");

		limpiarVariables();
		errores.addAll(validator.ValidarRegistroPlan(plan));

		if (!errores.isEmpty()) {
			rpta.put("errores", errores);
			return new ResponseEntity<Map<String, Object>>(rpta, HttpStatus.BAD_REQUEST);
		}

		rpta.put("insertId", planservice.registrarPlan(plan));
		rpta.put("plan", plan);

		return new ResponseEntity<>(rpta, HttpStatus.OK);
	}

	@GetMapping("/activar")
	@ResponseBody
	public ResponseEntity<?> activar(@RequestParam("estado") boolean estado, @RequestParam("plan_id") int plan_id) {
		log.trace("ENTRANDO A PLAN...............");
		Map<String, Object> rpta = new HashMap<>();
		rpta.put("plan_id", plan_id);
		rpta.put("estado", !estado);
		planservice.CambiarEstadoActivo(plan_id, !estado);
		return new ResponseEntity<Map<String, Object>>(rpta, HttpStatus.OK);

	}

	@GetMapping("/activarpromo")
	@ResponseBody
	public ResponseEntity<?> activarpromocion(@RequestParam("estado") boolean estado,
			@RequestParam("plan_id") int plan_id) {
		log.trace("ENTRANDO A PLAN...............");
		Map<String, Object> rpta = new HashMap<>();
		rpta.put("plan_id", plan_id);
		rpta.put("estado", !estado);
		planservice.CambiarEstadoActivoPromocion(plan_id, !estado);
		return new ResponseEntity<Map<String, Object>>(rpta, HttpStatus.OK);
	}

	// * DETALLES DE PLAN*//

	@GetMapping("/listadetalle/{id}")
	@ResponseBody
	public ResponseEntity<?> getDetalleplan(@PathVariable("id") int id) {
		// log.trace("ENTRANDO A PLAN...............");
		return new ResponseEntity<>(plandetalleservice.getDetallePlanporId(id), HttpStatus.OK);
	}

	@PostMapping("/registrardetalle")
	@ResponseBody
	public ResponseEntity<?> registrardetalle(@RequestBody Plan_detalle pland) {

		log.trace("============REGISTRANDO DETALLE DE PLAN============");
		log.trace("==========================================");

		limpiarVariables();
		errores.addAll(validator.ValidarRegistroDetallePlan(pland));

		if (!errores.isEmpty()) {
			rpta.put("errores", errores);
			return new ResponseEntity<Map<String, Object>>(rpta, HttpStatus.BAD_REQUEST);
		}
		
		if (pland.getOrden() >= 10000) {
			plandetalleservice.RegistrarDetallePlan(pland);
		} else {
			plandetalleservice.UpdateDetallePlan(pland);
		}
		rpta.put("insertId", pland.getOrden());
		
		return new ResponseEntity<>(rpta, HttpStatus.OK);
	}
	
	@DeleteMapping("/eliminardetalle/{orden}")
	@ResponseBody
	public ResponseEntity<?> eliminardetalle(@PathVariable("orden")int orden) {

		log.trace("============REGISTRANDO DETALLE DE PLAN============");
		log.trace("==========================================");
		limpiarVariables();
		

		if (!errores.isEmpty()) {
			rpta.put("errores", errores);
			return new ResponseEntity<Map<String, Object>>(rpta, HttpStatus.BAD_REQUEST);
		}
		
		plandetalleservice.EliminarDeleteDetallePlan(orden);		
		
		return new ResponseEntity<>(rpta, HttpStatus.OK);
	}
	 
}
