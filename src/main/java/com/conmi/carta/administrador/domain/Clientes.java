package com.conmi.carta.administrador.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Clientes {

	public Integer cliente_id;
	public String ruc;
	public String razon;
	public String descripcion;
	public String rubro;
	public String databasename;
	public String hostname;
	public Integer plan_id;
}
