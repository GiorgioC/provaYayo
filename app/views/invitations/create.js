<% if @invitation.nil? or (@invitation && @invitation.errors.any?) %>
  $(".invite_error").replaceWith('<div class="invite_error message error"><%=j flash[:error]%> <%=j render 'shared/error_messages', :target=>@invitation %></div>')
  $("#invite").show("fadein");

<%else%>
    $("#invite").hide("fadeout");
    $("#invite_sent_ok").show('zoomin');
    $("#list_body").html('<%=j (render :partial=>'list',:locals=>{:invitations=>@invitations})%>');
<% end %>

