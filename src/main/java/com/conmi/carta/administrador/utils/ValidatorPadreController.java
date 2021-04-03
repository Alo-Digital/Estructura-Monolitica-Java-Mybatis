package com.conmi.carta.administrador.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

public class ValidatorPadreController {

	protected Map<String, Object> rpta = new HashMap<String, Object>();
	protected List<ErrorHelp> errores = new ArrayList<ErrorHelp>();

	@Autowired
	protected Validator validator;

	protected void limpiarVariables() {
		rpta.clear();
		errores.clear();
	}
	
}
