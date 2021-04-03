package com.conmi.carta.administrador.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.conmi.carta.administrador.domain.ComboBox;
import com.conmi.carta.administrador.domain.Plan;
import com.conmi.carta.administrador.domain.Plan_detalle;

@Repository
@Mapper
public interface PlanRepository {
	
	@Select("CALL USP_GETPlanes")
	List<Plan> getPlanes();
	
	@Select("CALL USP_GETPlan (#{id})")
	Plan getplanporId(int id);
	
	@Update("CALL USP_UPDATEEstadoPlan (#{plan_id},#{estado})")
	void CambiarEstadoActivo(int plan_id,boolean estado);
	
	@Update("CALL USP_UPDATEEstadoPlanPromocion (#{plan_id},#{estado})")
	void CambiarEstadoActivoPromocion(int plan_id, boolean estado);

	@Insert("CALL USP_RegistrarPlan (#{nombre_plan},#{precio},#{precio_descuento},#{estado_descuento})")
	@SelectKey(statement = "SELECT LAST_INSERT_ID()",keyColumn = "plan_id", keyProperty = "plan_id", before = false, resultType = int.class)
	Integer registrarPlan(Plan plan);

	@Select("select plan_id value,concat(nombre_plan,' | ',precio ) text from plan where activo = 1")
	List<ComboBox> getcboplanes();
}
