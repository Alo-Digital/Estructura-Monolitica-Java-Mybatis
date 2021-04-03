package com.conmi.carta.administrador.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.springframework.stereotype.Repository;

import com.conmi.carta.administrador.domain.Clientes;
import com.conmi.carta.administrador.domain.dto.ClientesDto;

@Mapper
@Repository
public interface ClienteRepository {

	@Select("select exists(SELECT 1 FROM clientes c where ruc = #{ruc})")
	Boolean existeRuc(String ruc);
	
	@Select("select exists(SELECT 1 FROM clientes c where ruc = #{razon})")
	Boolean existeRazon(String razon);
	
	@Select("CALL USP_GETClientes (#{activo},#{rucorazon})")
	List<ClientesDto> getclientesDto(int activo,String rucorazon);

	@Insert("INSERT INTO clientes(ruc,razon,descripcion,rubro,databasename,hostname,plan_id) values (#{ruc},#{razon},#{descripcion},#{rubro},#{databasename},#{hostname},#{plan_id})")
	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyColumn = "cliente_id", keyProperty = "cliente_id", before = false, resultType = int.class)
	void registrarCliente(Clientes cliente);

}
