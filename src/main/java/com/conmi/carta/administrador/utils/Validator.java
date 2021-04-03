package com.conmi.carta.administrador.utils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.conmi.carta.administrador.domain.Clientes;
import com.conmi.carta.administrador.domain.ComboBox;
import com.conmi.carta.administrador.domain.Plan;
import com.conmi.carta.administrador.domain.Plan_detalle;
import com.conmi.carta.administrador.service.ClienteService;
import com.conmi.carta.administrador.service.PlanService;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class Validator {

	List<ErrorHelp> ERRORES = new ArrayList<ErrorHelp>();

	@Autowired
	ClienteService clienteservice;

	@Autowired
	PlanService planservice;

	@Autowired
	private Helper help;

	public List<ErrorHelp> ValidarRegistroPlan(Plan plan) {
		limpiarERRORES();
		log.trace("============= VALIDANDO REGISTRO PLAN =============");
		log.trace("===================================================");

		if (help.isText(plan.getNombre_plan().trim())) {
			log.error("ERROR EN CAMPO NOMBRE_PLAN");
			ERRORES.add(new ErrorHelp("nombre_plan", "Este campo solo acepta caracteres"));
		}

		if (help.ValidadorSiNumero(plan.getPrecio().toString())) {
			log.error("ERROR EN CAMPO PRECIO" + plan.getPrecio().toString());
			ERRORES.add(new ErrorHelp("precio", "Debe ser de tipo numérico decimal"));
		}

		if (plan.getEstado_descuento()) {
			log.trace("INGRESÓ DESCUENTO");
			if (help.ValidadorSiNumero(plan.getPrecio_descuento().toString())) {
				log.error("ERROR EN PRECIO DESCUENTO" + plan.getPrecio_descuento().toString());
				ERRORES.add(new ErrorHelp("precio_descuento", "Debe ser de tipo numérico decimal"));
			}
		}

		return ERRORES;
	}

	ComboBox comboencontrado = null;

	public List<ErrorHelp> ValidarRegistroCliente(Clientes cliente) {
		limpiarERRORES();
		log.trace("============= VALIDANDO REGISTRO CLIENTE =============");
		log.trace("======================================================");

		if (help.ValidadorSiNumero(cliente.getRuc().trim())) {
			ERRORES.add(new ErrorHelp("ruc", "Solo caracteres numéricos"));
		}

		if (clienteservice.existeRuc(cliente.getRuc().trim())) {
			ERRORES.add(new ErrorHelp("ruc", "Este Ruc ya fue registrado"));
		}

		if (clienteservice.existeRazon(cliente.getRazon().trim())) {
			ERRORES.add(new ErrorHelp("razon", "Ya tienes registrado esta razón social"));
		}

		if (help.isText(cliente.getRazon().trim())) {
			ERRORES.add(new ErrorHelp("razon", "Este campo solo acepta caracteres y mas de 2 caracteres"));
		}
		if (help.isText(cliente.getDescripcion().trim())) {
			ERRORES.add(new ErrorHelp("descripcion", "Este campo solo acepta caracteres y mas de 2 caracteres"));
		}
		if (help.isText(cliente.getRubro().trim())) {
			ERRORES.add(new ErrorHelp("rubro", "Este campo solo acepta caracteres y mas de 2 caracteres"));
		}

		if (help.isText(cliente.getDatabasename().trim())) {
			ERRORES.add(new ErrorHelp("databasename", "Este campo solo acepta caracteres y mas de 2 caracteres"));
		}

		if (help.isText(cliente.getHostname().trim())) {
			ERRORES.add(new ErrorHelp("hostname", "Este campo solo acepta caracteres y mas de 2 caracteres"));
		}

		planservice.getcboplanes().forEach(combo -> {
			if (combo.getValue() == cliente.getPlan_id()) {
				comboencontrado = combo;
			}
		});
		
		if (comboencontrado == null) {
			ERRORES.add(new ErrorHelp("plan_id", "Este plan no existe"));
		}

		ERRORES.addAll(validarCamposVacio(cliente, "cliente_id"));
		return ERRORES;
	}

	public List<ErrorHelp> validarCamposVacio(Object obj, String nombredecampo) {

		log.debug("getSimpleName " + obj.getClass().getSimpleName());
		Field[] campos = obj.getClass().getFields();
		for (Field atributo : campos) {
			Object value;
			try {
				if (!atributo.getName().equals(nombredecampo)) {
					value = atributo.get(obj);
					if (value == null || value.toString().trim().isEmpty()) {
						ERRORES.add(new ErrorHelp(atributo.getName(), "Este campo no debe estar vacío"));
					}
				}

			} catch (IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}

		return ERRORES;

	}

	public List<ErrorHelp> ValidarRegistroDetallePlan(Plan_detalle pland) {
		limpiarERRORES();

		log.trace("============= VALIDANDO REGISTRO DETALLE PLAN =============");
		log.trace("===================================================");

		if (help.isText(pland.getDetalle().toString().trim())) {
			log.error("ERROR CAMPO " + pland.getDetalle());
			ERRORES.add(new ErrorHelp("detalle", "Este campo solo acepta caracteres y mas de 2 caracteres"));
		}
		if (help.isText(pland.getDescripcion().toString().trim())) {
			log.error("ERROR CAMPO " + pland.getDescripcion());
			ERRORES.add(new ErrorHelp("descripcion", "Este campo solo acepta caracteres"));
		}

		return ERRORES;
	}

	void limpiarERRORES() {
		ERRORES.clear();
	}
}
