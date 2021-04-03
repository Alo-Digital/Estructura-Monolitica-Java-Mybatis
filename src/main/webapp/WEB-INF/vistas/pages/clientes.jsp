<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="js/bootstrap-table.min.js"></script>

<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="card-header">
				<h6 class="text-uppercase mb-0">Clientes</h6>
				<div class="row mt-4">
					<div class="col-lg-6 col-md-12 pt-2 pb-2">
						<div class="row">
							<div class="col-md-6 pt-2">
								<input class="form-control" type="text" id="rucorazon" placeholder="Ingrese ruc o razón social">
							</div>
							<div class="col-md-6 pt-2">
								<select class="custom-select " id="activo">
									<option value="-1" selected>Elija tipo de cliente</option>
									<option value="-1">Todos</option>
									<option value="0">Solicitantes</option>
									<option value="1">Registrados</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-12  pt-2 pb-2">
						<div class="row">
							<div class="col-md-6 pt-2 "></div>
							<div class="col-md-6 pt-2 ">
								<button class="btn btn-primary float-right" data-toggle="modal" data-target="#modalnuevocliente">Nuevo</button>
							</div>
						</div>
					</div>

				</div>
				<!--button class="btn btn-primary " data-toggle="modal" data-target="#modalplan">Nuevo</button-->
			</div>
			<div class="card-body">

				<table id="table" class="table table-hover" data-toggle="table" data-pagination="true" data-height="460" data-data-type="text"
					data-response-handler="responseHandler" data-url="clientes/lista?activo=-1&ruc=">
					<thead class="thead-dark">
						<tr>
							<th data-field="cliente_id">#</th>
							<th data-field="ruc">Ruc</th>
							<th data-field="razon">Razon</th>
							<th data-field="descripcion">Descripcion</th>
							<th data-field="token">Token</th>
							<th data-field="fecha_creacion">Fecha Creación</th>
							<th data-field="rubro">Rubro</th>
							<th data-field="activo" data-formatter="formatteractivo">Activo</th>
							<th data-field="databasename">Database</th>
							<!--th data-field="estado_descuento" data-formatter="formatpromocion">¿En Promoción?</th>
                            <th data-field="activo" data-formatter="formatdescuento">Activo</th>
                            <th data-field="fecha_creacion">Fecha Creación</th-->
							<th data-formatter="formatacciones">Acciones</th>
						</tr>
					</thead>

				</table>
			</div>
		</div>
	</div>
</div>

<div class="modal" id="modaledit" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Editar Cliente</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="alert alert-success" role="alert" id="alertactualizado" style="display: none">PLAN ACTUALIZADO CON ÉXITO</div>
				<form>
					<input type="hidden" id="edplan_id">
					<div class="form-group">
						<label for="ednombre" class="col-form-label">Nombre:</label> <input type="text" class="form-control" id="ednombre"> <small
							style="display: none" class="text-danger errorhelp" id="ednombrehelp">error nombre</small>
					</div>
					<div class="form-group">
						<label for="edprecio" class="col-form-label">Precio:</label> <input type="number" min="1" value="1" step="0.01" class="form-control"
							id="edprecio"> <small style="display: none" class="text-danger errorhelp" id="edpreciohelp">error nombre</small>
					</div>
					<div class="form-group">
						<label for="edcheckpromo" class=" col-form-label">Poner en promoción:<input class="ml-2" type="checkbox" id="edcheckpromo">
						</label>
					</div>
					<div class="form-group" id="eddivpreciodesc" style="display: none">
						<label for="message-text" for="preciodesc" class="col-form-label">Precio descuento:</label> <input type="number" min="1" value="1" step="0.01"
							class="form-control" id="edpreciodesc"> <small style="display: none" class="text-danger errorhelp" id="edpreciodeschelp">error
							nombre</small>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="actualizar()">Actualizar</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>


<div class="modal" id="modalnuevocliente" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Nuevo Cliente</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="alert alert-success" role="alert" id="alertactualizado" style="display: none">ACCIÓN REALIZADA</div>
				<form id="formnuevocliente">
					<div class="form-group">
						<label for="ruc">Ruc</label> <input type="text" maxlength="11" class="form-control" id="ruc" placeholder="ingrese ruc"
							onkeypress="return IsNumeric(event)"> <small class="text-danger" style="display: none" id="rucerror"></small>
					</div>
					<div class="form-group">
						<label for="razon">Razón Social</label> <input type="text" class="form-control" id="razon" placeholder="ingrese razón"> <small
							class="text-danger" style="display: none" id="razonerror"></small>
					</div>
					<div class="form-group">
						<label for="descripcion">Descripción</label>
						<textarea class="form-control" id="descripcion" placeholder="ingrese descripción" rows="2"></textarea>
						<small class="text-danger" style="display: none" id="descripcionerror"></small>
					</div>
					<div class="form-group">
						<label for="rubro">Rubro</label> <input type="text" class="form-control" id="rubro" placeholder="ingrese rubro"> <small
							class="text-danger" style="display: none" id="rubroerror"></small>
					</div>

					<div class="form-group">
						<label for="database">Database</label> <input type="text" class="form-control" id="databasename" placeholder="ingrese database"> <small
							class="text-danger" style="display: none" id="databasenameerror"></small>
					</div>

					<div class="form-group">
						<label for="hostname">Hostname</label> <input type="text" class="form-control" id="hostname" placeholder="ingrese hostname"> <small
							class="text-danger" style="display: none" id="hostnameerror"></small>
					</div>
					<div class="form-group">
						<label for="plan_id">Planes</label> <select id="plan_id" class="custom-select">
							<option disabled selected value="-1">Elige tu Plan</option>

						</select> <small class="text-danger" style="display: none" id="plan_iderror"></small>
					</div>


				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="guardarcliente()">Guardar</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>


<script>
	llenarCombo("reutilizable/comboplanes", "plan_id");

	function guardarcliente() {
		var data = {
			ruc : $("#ruc").val(),
			razon : $("#razon").val(),
			descripcion : $("#descripcion").val(),
			rubro : $("#rubro").val(),
			databasename : $("#databasename").val(),
			hostname : $("#hostname").val(),
			plan_id : $("#plan_id").val(),
		};

		RequestPost("clientes/registrar", data, "formnuevocliente",
				pintarrespuesta);
	}

	function pintarrespuesta(res) {
		//console.log(res);
		$("#table").bootstrapTable('refresh', {
			url : 'clientes/lista?activo=-1&ruc=',
			locale : 'es-PE'
		});
	}
	function responseHandler(res) {
		return JSON.parse(res)
	}
	function formatteractivo(estado) {
		return estado == 1 ? '<span class="label label-success">SI</span>'
				: '<span class="label label-danger">NO</span>';
	}
	function formatacciones() {
		return ``;
	}
	$("#activo").on("change", function() {
		Busqueda();
	})
	$("#rucorazon").on("keyup", function() {
		Busqueda();
	});

	var Busqueda = function() {
		$("#table").bootstrapTable(
				'refresh',
				{
					url : 'clientes/lista?activo=' + $("#activo").val()
							+ '&ruc=' + $("#rucorazon").val() + '',
					locale : 'es-PE'
				});
	}
</script>