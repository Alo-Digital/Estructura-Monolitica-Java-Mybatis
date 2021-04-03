package com.conmi.carta.administrador.service;

import java.util.List;

import com.conmi.carta.administrador.domain.Plan;
import com.conmi.carta.administrador.domain.Plan_detalle;

public interface Plan_detalleService {

	List<Plan_detalle> getDetallePlanporId(int plan_id);

	void RegistrarDetallePlan(Plan_detalle pland);

	void UpdateDetallePlan(Plan_detalle pland);

	void EliminarDeleteDetallePlan(int orden);
}
