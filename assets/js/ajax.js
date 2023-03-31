function loadData(idfilm){
    $.ajax({
        url: "/Plan/getData",
        type: "GET",
        dataType: "json",
        data: {
            selectedValue: idfilm
        },
        success: function(data){
            $("#table").empty();
            for(var i=0; i<data.length; i++){
                var row = $("<tr>");
                row.append($("<td>").text(data[i].scenelabel));
                row.append($("<td>").text(data[i].auteur));
                row.append($("<td>").text(data[i].duree));
                row.append($("<td>").text(data[i].etat));
                $("#table").append(row);
            }
        },
        error: function (jqXHR, textStatus, errorThrown){
            console.log(idfilm);
            console.log("AJAX error: "+textStatus+" - "+errorThrown);
        }
    });
}