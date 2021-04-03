package com.conmi.carta.administrador.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Plan_detalle {
	
	Integer plan_id;
	String detalle;
	String descripcion;
	Integer orden;
	
}
