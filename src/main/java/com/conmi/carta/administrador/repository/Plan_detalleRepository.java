package com.conmi.carta.administrador.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.conmi.carta.administrador.domain.Plan_detalle;

@Repository
@Mapper
public interface Plan_detalleRepository {

	@Select("CALL USP_GETDetallePlanesPorPlan_id (#{plan_id})")
	List<Plan_detalle> getDetallePlanporId(int plan_id);
	
	@Insert("insert into plan_detalle(plan_id,detalle,descripcion) values (#{plan_id}, #{detalle}, #{descripcion})")
	@SelectKey(statement = "SELECT LAST_INSERT_ID()",keyColumn = "orden", keyProperty = "orden", before = false, resultType = int.class)
	void registrarplandetalle(Plan_detalle pland);
	
	@Update("update plan_detalle set detalle = #{detalle}, descripcion = #{descripcion} where orden = #{orden} and plan_id = #{plan_id}")
	void updatedetalleplan(Plan_detalle pland);
	
	@Delete("delete from plan_detalle where orden = #{orden}")
	void EliminarDeleteDetallePlan(int orden);
}
