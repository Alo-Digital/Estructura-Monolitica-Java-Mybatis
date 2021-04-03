package com.conmi.carta.administrador.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conmi.carta.administrador.domain.ComboBox;
import com.conmi.carta.administrador.domain.Plan;
import com.conmi.carta.administrador.domain.Plan_detalle;
import com.conmi.carta.administrador.repository.PlanRepository;
import com.conmi.carta.administrador.service.PlanService;

@Service
public class PlanServiceImpl implements PlanService {

	@Autowired
	PlanRepository planrepo;

	@Override
	public List<Plan> getplanes() {
		// TODO Auto-generated method stub
		return planrepo.getPlanes();
	}

	@Override
	public Plan getplanporId(int id) {
		// TODO Auto-generated method stub
		return planrepo.getplanporId(id);
	}

	@Override
	public void CambiarEstadoActivo(int plan_id, boolean estado) {
		// TODO Auto-generated method stub
		planrepo.CambiarEstadoActivo(plan_id, estado);
	}

	@Override
	public void CambiarEstadoActivoPromocion(int plan_id, boolean estado) {
		// TODO Auto-generated method stub
		planrepo.CambiarEstadoActivoPromocion(plan_id, estado);
	}
 

	@Override
	public Integer registrarPlan(Plan plan) {
		// TODO Auto-generated method stub
		return planrepo.registrarPlan(plan);
	}

	@Override
	public List<ComboBox> getcboplanes() {
		// TODO Auto-generated method stub
		return planrepo.getcboplanes();
	}
 

}
