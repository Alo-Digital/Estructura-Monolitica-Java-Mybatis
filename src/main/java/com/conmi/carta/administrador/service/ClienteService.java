package com.conmi.carta.administrador.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.conmi.carta.administrador.domain.Clientes;
import com.conmi.carta.administrador.domain.dto.ClientesDto;

public interface ClienteService {

	List<ClientesDto> getclientesDto(int activo,String rucOrazon);

	void registrarCliente(Clientes cliente);

	Boolean existeRuc(String ruc);

	Boolean existeRazon(String razon);
}
