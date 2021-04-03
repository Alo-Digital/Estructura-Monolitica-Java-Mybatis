package com.conmi.carta.administrador.domain.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClientesDto {
	
	Integer cliente_id;
	String ruc;
	String razon;
	String descripcion;
	String token;
	Date fecha_creacion;
	String rubro;
	Boolean activo;
	String databasename;
	String hostname;
	Integer plan_id;
	String nombre_plan;
	Boolean estado;

}
