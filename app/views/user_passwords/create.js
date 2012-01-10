<% if @user.nil? or (@user && @user.errors.any?) %>
  $(".request_password_error").replaceWith('<div class="request_password_error message error"><%=j flash[:error]%></div>')
  $("#passbar").show("fadein");
<%else%>
    $("#password_sent_ok").show('zoomin');
<% end %>

