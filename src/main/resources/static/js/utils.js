function llenarCombo(url, id) {
  $.ajax({
    method: "GET",
    url: url,
  }).done(function (res) {
    var html = "";
    res.forEach((data) => {
      html += `<option value="${data.value}">${data.text}</option>`;
    });
    $("#" + id).html(html);
  });
}

function RequestPost(url,data,formulario,callback) {
    $.ajax({
		type: "POST",
		url: url,   
		contentType: "application/json",
		data: JSON.stringify(data),
		beforeSend:function(){
			$(`#${formulario} small`).css("display","none");
		},
		success: function (result) { 
			$("#"+formulario).trigger("reset");
            callback(result);
		}, error: function (err) {
			console.log(err);
			for( var e of err.responseJSON.errores){
				$("#"+e.param+"error").text(e.msg);
				$("#"+e.param+"error").css("display","block");
			}
		},
	}); 
}

function IsNumeric(e) {
	var validkeys = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
    if (validkeys.indexOf(e.key) < 0)
        return false;
}

