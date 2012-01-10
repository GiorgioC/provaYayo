
function preview(){
    var p = window.open("/welcome/preview");
    if(!p)
        $("<div><iframe scrolling='false' width='550px' height='750px' src='/welcome/preview'/></div>").dialog({title:"Preview",height:800,width:600})
}

$(document).ready(function(){

    $(".tabs").hide();

  $("a.ajax-claim").bind("ajax:loading",function(){alert("l")}).bind("ajax:success", function(et, e){
        debugger;
  })

})