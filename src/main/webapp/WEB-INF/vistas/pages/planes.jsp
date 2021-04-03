<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="js/bootstrap-table.min.js"></script>
<!--button onclick='$("#example").modal("show");'>btn</button-->
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h6 class="text-uppercase mb-0">Planes</h6>
                <button class="btn btn-primary float-right" data-toggle="modal" data-target="#modalplan">Nuevo</button>
            </div>
            <div class="card-body">

                <table id="tableplan" class="table table-hover" data-toggle="table" data-pagination="true" data-height="600"
                    data-data-type="text" data-response-handler="responseHandler" data-url="planes/lista">
                    <thead class="thead-dark">
                        <tr>
                            <th data-field="plan_id">#</th>
                            <th data-field="nombre_plan">Nombre</th>
                            <th data-field="precio">Precio</th>
                            <th data-field="precio_descuento">Precio Descuento</th>
                            <th data-field="estado_descuento" data-formatter="formatpromocion">¿En Promoción?</th>
                            <th data-field="activo" data-formatter="formatdescuento">Activo</th>
                            <th data-field="fecha_creacion">Fecha Creación</th>
                            <th data-formatter="formatacciones">Acciones</th>
                        </tr>
                    </thead>

                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="modaldetalle" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Detalle del <span id="detplan"></span></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <button class="float-right btn btn-primary " onclick="addnuevodetalle()">Nuevo</button>
                <hr class="mt-5">
                <input type="hidden" id="detplan_id">
                <div id="detallecontainer">
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="modaledit" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Editar Plan</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="alert alert-success" role="alert" id="alertactualizado" style="display: none">
                    ACCIÓN REALIZADA
                </div>
                <form>
                    <input type="hidden" id="edplan_id">
                    <div class="form-group">
                        <label for="ednombre" class="col-form-label">Nombre:</label>
                        <input type="text" class="form-control" id="ednombre">
                        <small style="display:none" class="text-danger errorhelp" id="ednombrehelp">error nombre</small>
                    </div>
                    <div class="form-group">
                        <label for="edprecio" class="col-form-label">Precio:</label>
                        <input type="number" min="1" value="1" step="0.01" class="form-control" id="edprecio">
                        <small style="display:none" class="text-danger errorhelp" id="edpreciohelp">error nombre</small>
                    </div>
                    <div class="form-group">
                        <label for="edcheckpromo" class="float-right col-form-label">Poner en promoción:<input
                                class="ml-2" type="checkbox" id="edcheckpromo"></label>
                    </div>
                    <div class="form-group" id="eddivpreciodesc" style="display: none">
                        <label for="message-text" for="preciodesc" class="col-form-label">Precio descuento:</label>
                        <input type="number" min="1" value="1" step="0.01" class="form-control" id="edpreciodesc">
                        <small style="display:none" class="text-danger errorhelp" id="edpreciodeschelp">error
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


<div class="modal" id="modalplan" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Nuevo Plan</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="alert alert-success" role="alert" id="alertregistrado" style="display: none">
                    PLAN REGISTRADO CON ÉXITO
                </div>
                <form>
                    <div class="form-nombre_plan">
                        <label for="nombre" class="col-form-label">Nombre:</label>
                        <input type="text" class="form-control" id="nombre_plan">
                        <small style="display:none" class="text-danger errorhelp" id="nombre_planhelp">error
                        </small>
                    </div>
                    <div class="form-group">
                        <label for="precio" class="col-form-label">Precio:</label>
                        <input type="number" min="1" value="1" step="0.01" class="form-control" id="precio">
                        <small style="display:none" class="text-danger errorhelp" id="preciohelp">error </small>
                    </div>
                    <div class="form-group">
                        <label for="checkpromo" class="float-right col-form-label">Poner en promoción:
                            <input class="ml-2" type="checkbox" id="checkpromo"></label>
                    </div>
                    <div class="form-group" id="divpreciodesc" style="display: none">
                        <label for="precio_descuento" class="col-form-label">Precio descuento:</label>
                        <input type="number" min="1" value="1" step="0.01" class="form-control" id="precio_descuento">
                        <small style="display:none" class="text-danger errorhelp" id="precio_descuentohelp">error
                        </small>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="guardar()">Guardar</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div> 
<script>

    $(document).ready(function () {
        $("#tableplan").bootstrapTable('refresh', {
            url: 'planes/lista',
            locale: 'es-PE'
        });
    })

    detalle_de_complemento = function (plan_o_iterador) {
        return '<div id="item'+plan_o_iterador+'" class="p-2">'+
                    '<div class="alert alert-success" role="alert" id="altermensaje'+plan_o_iterador+'" style="display: none">'+
                        'DETALLE DE PLAN ACTUALIZADO CON ÉXITO'+
                    '</div>'+
                    '<div class="form-group">'+
                        '<input type="text" class="form-control" id="detdetalle'+plan_o_iterador+'" placeholder="Ingrese detalle">'+
                        '<small class="text-danger" id="detdetalle'+plan_o_iterador+'help" style="display: none">Error</small>'+
                    '</div>'+
                    '<div class="form-group">'+
                        '<textarea class="form-control" id="detdescripcion'+plan_o_iterador+'" placeholder="Ingrese descripcion"'+
                            'rows="3"></textarea>'+
                        '<small class="text-danger" id="detdescripcion'+plan_o_iterador+'help" style="display: none">Error</small>'+
                    '</div>'+
                    
                    '<div class="form-group">'+
                        '<div class="  ">'+
                            '<a class="btn btn-success mr-2" href="javascript:void(0)" onclick="guardardetalle('+plan_o_iterador+')">'+
                                '<i class="fas fa-save"></i>'+
                            '</a>'+
                            '<a class="btn btn-danger" href="javascript:void(0)" onclick="eliminardetalle('+plan_o_iterador+')">'+
                                '<i class="fas fa-trash"></i>'+
                            '</a>'+
                        '</div>'+
                    '</div><hr>'+
                '</div>';
    }

    var iterador = 10000;

    function addnuevodetalle() {
        $("#detallecontainer").append(detalle_de_complemento(iterador++));
    }

    var inter = {
        nombre_plan: 'PLAN NUEVO',
        precio: 2.0,
        precio_descuento: 0,
        estado_descuento: 0,
        activo: 1,
        plan_id: 0,
    }

    var detalle_plan = {
        detalle: "",
        descripcion: "",
        plan_id: 0,
        order: 0
    }

    $('#edcheckpromo').on('click', function () {
        if ($(this).is(':checked')) {
            inter.estado_descuento = 1;
            inter.precio_descuento = $("#preciodesc").val("");
            $("#eddivpreciodesc").css("display", "block");
        } else {
            inter.estado_descuento = 0;
            inter.precio_descuento = $("#preciodesc").val("");
            $("#eddivpreciodesc").css("display", "none");
        }
    });

    $('#checkpromo').on('click', function () {
        if ($(this).is(':checked')) {
            inter.estado_descuento = 1;
            inter.precio_descuento = $("#preciodesc").val("");
            $("#divpreciodesc").css("display", "block");
        } else {
            inter.estado_descuento = 0;
            inter.precio_descuento = $("#preciodesc").val("");
            $("#divpreciodesc").css("display", "none");
        }
    });

    function responseHandler(res) {
        var rpta = [];
        JSON.parse(res).forEach((x) => {
            x.fecha_creacion = new Date(x.fecha_creacion).toLocaleDateString('en-GB');
            rpta.push(x);
        })
        return rpta;
    }

    function eliminardetalle(plan_id_o_iterador) {

        if (plan_id_o_iterador < 10000) {
            $.ajax({
                method: 'DELETE',
                url: "planes/eliminardetalle/" + plan_id_o_iterador,
                contentType: "application/json",
                success: function (res) {
                    //$("#altermensaje"+plan_id_o_iterador).css("display", "block");
                    console.log(res)
                }
            });
        }
        $("#item" + plan_id_o_iterador).replaceWith("");

    }

    function guardardetalle(plan_id_o_iterador) {
        //if (plan_id_o_iterador >= 10000) {
        detalle_plan.detalle = $("#detdetalle" + plan_id_o_iterador).val();
        detalle_plan.descripcion = $("#detdescripcion" + plan_id_o_iterador).val();
        detalle_plan.plan_id = $("#detplan_id").val();
        detalle_plan.orden = plan_id_o_iterador;
        
        /*RequestPost("planes/registrardetalle",detalle_plan,"form",function(res){
        	console.log(res);
        	 $("#item" + plan_id_o_iterador).replaceWith(detalle_de_complemento(res.insertId));
             $("#detdetalle" + res.insertId).val(detalle_plan.detalle);
             $("#detdescripcion" + res.insertId).val(detalle_plan.descripcion);
             $("#altermensaje" + res.insertId).css("display", "block");
        })*/
        
        $.ajax({
            method: 'POST',
            url: "planes/registrardetalle",
            contentType: "application/json",
    		data: JSON.stringify(detalle_plan),
            beforeSend: function () {
            	$("#item"+ plan_id_o_iterador+" small").css("display", "none");
                $("#altermensaje" + plan_id_o_iterador).css("display", "none");
                $(".errorhelp").css("display", "none");
            },
            success: function (res) { 
                console.log(res)
                $("#item" + plan_id_o_iterador).replaceWith(detalle_de_complemento(res.insertId));
                $("#detdetalle" + res.insertId).val(detalle_plan.detalle);
                $("#detdescripcion" + res.insertId).val(detalle_plan.descripcion);
                $("#altermensaje" + res.insertId).css("display", "block");
            },
            error: function (err) {
                console.log(err)
                console.log(err.responseJSON.errores)
                
                err.responseJSON.errores.forEach(err => {
                    $("#det" + err.param + plan_id_o_iterador + "help").css("display", "block");
                    $("#det" + err.param + plan_id_o_iterador + "help").text(err.msg);
                })
            }
        });
        //}
    }

    function formatacciones(row, value, x) {
        var rpta = '<a data-toggle="tooltip" data-placement="top" title="Activar Plan" class="m-1 btn btn-'+(value.activo == 1 ? 'danger' : 'success')+'" onclick="activar('+value.plan_id+','+value.activo+')" ><i class="text-white fas fa-power-off"></i></a>';
        rpta += '<a data-toggle="tooltip" data-placement="top" title="Activar Promoción" class="m-1 btn btn-'+(value.estado_descuento == 1 ? 'danger' : 'success')+'" onclick="activarpromo('+value.plan_id+','+value.estado_descuento+')" ><i class="text-white fas fa-comment-dollar"></i></a>';
        rpta += '<a data-toggle="tooltip" data-placement="top" title="Editar" class="m-1 btn btn-info" onclick="editarmodal('+value.plan_id+')" ><i class="text-white fas fa-edit"></i></a>';
        rpta += '<a data-toggle="tooltip" data-placement="top" title="Detalles" class="m-1 btn btn-info" onclick="opendetalle('+value.plan_id+',\''+value.nombre_plan+'\')" ><i class="text-white fas fa-list"></i></a>';
        return rpta;
    }

    function activarpromo(plan_id, activar) {
        $.ajax({
            method: 'GET',
            url: "planes/activarpromo?estado=" + activar + "&plan_id=" + plan_id,
        }).done(function () {
            $("#tableplan").bootstrapTable('refresh', {
                url: 'planes/lista',
                locale: 'es-PE'
            });
        });
    }

    function actualizar() {
        inter.plan_id = $("#edplan_id").val();
        inter.nombre_plan = $("#ednombre").val();
        inter.precio = $("#edprecio").val();
        inter.estado_descuento = $("#edcheckpromo").is(":checked") ? 1 : 0;
        inter.precio_descuento = $("#edpreciodesc").val();

        $.ajax({
            method: 'PUT',
            url: "planes/actualizar/" + $("#edplan_id").val(),
            data: inter,
            beforeSend: function () {
                $("#alertactualizado").css("display", "none");
                $(".errorhelp").css("display", "none");
                
            },
            success: function (res) {
                $("#alertactualizado").css("display", "block");
                $("#table").bootstrapTable('refresh', {
                    url: 'planes/lista',
                    locale: 'es-PE'
                });
            },
            error: function (err) {
                console.log(err)
                console.log(err.responseJSON.errores)
                err.responseJSON.errores.forEach(err => {
                    $("#ed" + err.param + "help").css("display", "block");
                    $("#ed" + err.param + "help").text(err.msg);
                })
            }
        });
    }

    function editarmodal(plan_id) {
        $("#alertactualizado").css("display", "none");
        $.ajax({
            method: 'GET',
            url: "planes/lista/" + plan_id,
            success: function (res) {
                var inter = res;

                if (inter.estado_descuento === 1) {
                    $("#edcheckpromo").prop("checked", false);
                } else {
                    $("#edcheckpromo").prop("checked", true);
                }
                $("#edcheckpromo").trigger("click");

                $("#edplan_id").val(inter.plan_id)
                $("#ednombre").val(inter.nombre_plan)
                $("#edprecio").val(inter.precio)
                $("#edpreciodesc").val(inter.precio_descuento)
                $("#modaledit").modal("show");
            }
        });

    }

    function opendetalle(plan_id, plan_nombre) {

        $("#detallecontainer").html("")
        $("#detplan_id").val(plan_id);
        $("#detplan").text(plan_nombre)
        //$("#alertactualizado").css("display", "none");
        $.ajax({
            method: 'GET',
            url: "planes/listadetalle/" + plan_id,
            success: function (res) {
                var inter = res[0];
                res.forEach(x => {
                    $("#detallecontainer").append(detalle_de_complemento(x.orden));
                    $("#detdetalle" + x.orden).val(x.detalle);
                    $("#detdescripcion" + x.orden).val(x.descripcion);
                })
                $("#modaldetalle").modal("show");

            }
        });
    }

    function guardar() {
        $(".errorhelp").css("display", "none");
        inter.nombre_plan = $("#nombre_plan").val();
        inter.precio = $("#precio").val();
        inter.precio_descuento = $("#precio_descuento").val();

        $.ajax({
            method: 'POST',
            url: "planes/registrar",
            data:  JSON.stringify(inter),
        	contentType: "application/json",
            beforeSend: function () {
                $("#alertregistrado").css("display", "none");
                $(".errorhelp").css("display", "none");
            },
            success: function (res) {
                $("#alertregistrado").css("display", "block");
                $("#tableplan").bootstrapTable('refresh', {
                    url: 'planes/lista',
                    locale: 'es-PE'
                });
            },
            error: function (err) {
                console.log(err)
                console.log(err.responseJSON.errores)
                err.responseJSON.errores.forEach(err => {
                //	for(const err of err.responseJSON.errores)
                    $("#" + err.param + "help").css("display", "block");
                    $("#" + err.param + "help").text(err.msg);
                    
                })
            }
        });
    }

    function activar(plan_id, activar) {
        $.ajax({
            method: 'GET',
            url: "planes/activar?estado=" + activar + "&plan_id=" + plan_id,
        }).done(function () {
            $("#tableplan").bootstrapTable('refresh', {
                url: 'planes/lista'
            });
        });
    }

    function formatdescuento(estado) {
        return estado == 1 ? '<span class="label label-success">SI</span>' : '<span class="label label-danger">NO</span>';
    }

    function formatpromocion(estado) {
        return estado == 1 ? '<span class="label label-success">SI</span>' : '<span class="label label-danger">NO</span>';
    }

</script>