package com.conmi.carta.administrador.domain;

import java.sql.Date;
import java.util.Calendar;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Plan {	
	
	Integer plan_id;
	String nombre_plan;
	Date fecha_creacion;
	Boolean estado_descuento;
	Boolean activo;
	Double precio;
	Double precio_descuento;
	
}
