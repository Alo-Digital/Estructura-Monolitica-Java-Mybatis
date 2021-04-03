package com.conmi.carta.administrador.service;

import java.util.List;

import com.conmi.carta.administrador.domain.ComboBox;
import com.conmi.carta.administrador.domain.Plan;
import com.conmi.carta.administrador.domain.Plan_detalle;

public interface PlanService {

	List<ComboBox> getcboplanes();
	
	List<Plan> getplanes();

	Plan getplanporId(int id);

	void CambiarEstadoActivo(int plan_id, boolean estado);

	void CambiarEstadoActivoPromocion(int plan_id, boolean estado); 

	Integer registrarPlan(Plan plan);
	
	
}
