package com.conmi.carta.administrador.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conmi.carta.administrador.domain.Clientes;
import com.conmi.carta.administrador.domain.dto.ClientesDto;
import com.conmi.carta.administrador.repository.ClienteRepository;
import com.conmi.carta.administrador.service.ClienteService;

@Service
public class ClienteServiceImpl implements ClienteService {

	@Autowired
	ClienteRepository clienterepo;

	 

	@Override
	public void registrarCliente(Clientes cliente) {
		// TODO Auto-generated method stub
		clienterepo.registrarCliente(cliente);
	}

	@Override
	public Boolean existeRuc(String ruc) {
		// TODO Auto-generated method stub
		return clienterepo.existeRuc(ruc);
	}

	@Override
	public Boolean existeRazon(String razon) {
		// TODO Auto-generated method stub
		return clienterepo.existeRazon(razon);
	}

	@Override
	public List<ClientesDto> getclientesDto(int activo, String rucOrazon) {
		// TODO Auto-generated method stub
		return clienterepo.getclientesDto(activo,rucOrazon);
	}

}
