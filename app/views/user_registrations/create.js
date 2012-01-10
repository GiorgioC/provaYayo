/**
 * Created by JetBrains RubyMine.
 * User: andreab
 * Date: 11/23/11
 * Time: 8:42 PM
 * To change this template use File | Settings | File Templates.
 */



<% if @user && @user.errors.any? %>
  $(".login_error").replaceWith('<div class="login_error message error"><%=j render 'shared/error_messages', :target=>@user %></div>')
  $("#reg").show("fadein");
<%else%>
     $(".popup").hide();
     $("#confirmation_sent_ok").show('zoomin');
<% end %>

