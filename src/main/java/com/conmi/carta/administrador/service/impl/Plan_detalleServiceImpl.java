package com.conmi.carta.administrador.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conmi.carta.administrador.domain.Plan;
import com.conmi.carta.administrador.domain.Plan_detalle;
import com.conmi.carta.administrador.repository.PlanRepository;
import com.conmi.carta.administrador.repository.Plan_detalleRepository;
import com.conmi.carta.administrador.service.PlanService;
import com.conmi.carta.administrador.service.Plan_detalleService;

@Service
public class Plan_detalleServiceImpl implements Plan_detalleService {

	@Autowired
	Plan_detalleRepository plandetallerepo;

	@Override
	public List<Plan_detalle> getDetallePlanporId(int plan_id) {
		// TODO Auto-generated method stub
		return plandetallerepo.getDetallePlanporId(plan_id);
	}

	@Override
	public void RegistrarDetallePlan(Plan_detalle pland) {
		// TODO Auto-generated method stub
		plandetallerepo.registrarplandetalle(pland);
	}

	@Override
	public void UpdateDetallePlan(Plan_detalle pland) {
		// TODO Auto-generated method stub
		plandetallerepo.updatedetalleplan(pland);
	}

	@Override
	public void EliminarDeleteDetallePlan(int orden) {
		// TODO Auto-generated method stub
		plandetallerepo.EliminarDeleteDetallePlan(  orden);
	}

}
