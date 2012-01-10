var current_request;
$(document).ready(function(){

  $(".popup").ajaxSend(function(e,x,s){

      $(".popup").hide("fadeout");
      var msg =  "Registrazione in corso";

      if(s.url=="/user/password"){
        msg =  "Richiesta password in corso";
      }
      $.blockUI({
                message:"<img src='/assets/icons/ajax-loader.gif'><br>" + msg,
                css:{"z-Index":1000000,
                border: 'none',
                padding: '15px',
                backgroundColor: '#000',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                opacity: .8,
                color: '#fff'
                }
                });

  }).ajaxComplete(function(e,x,s){
      $.unblockUI();

      if(s.url=="/user/password"){
       // $("#passbar").show("fadein");

      }else
      {
        //$("#reg").show("fadein");
      }

      $(document).scrollTop(0);
   });

  $(".popup").hide();
  $(".register").click(function(){
    $("#reg").show();
  }) ;
   $(".close_popup").click(function() {
        $(".popup").hide();
    });
})