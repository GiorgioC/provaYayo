
class PagesController     < Spree::BaseController
  respond_to :json,:html
  # To change this template use File | Settings | File Templates.
  def show

    @page =  Page.search( :name_or_id_equals=> params[:id]).first
    raise ActionController::RoutingError.new('Non autorizzato!') if (current_user.nil? or !current_user.has_role?:admin)
    if (@page.nil? and current_user and current_user.has_role?:admin)
        @page = Page.new :name=> params[:id] || "Titolo"
        @page.save!
    end
  end

  def mercury_update
    page =  Page.search( :name_or_id_equals=> params[:id]).first
    page = Page.new  if page.nil?
      #raise ActionController::RoutingError.new('Non trovato!') if page.nil?
    data = JSON.parse params[:content]
    page.name = data["page_name"]["value"]
    logger.debug ("INSERISCO #{page.name}" )
    logger.debug ("INSERISCO #{data["page_content"]["value"]}" )
    page.content = data["page_content"]["value"]
     logger.debug ("content #{page.content}" )

    page.element_order = Page.count    if page.id.nil?
    page.save!
    logger.debug page.errors.inspect
    render text: ""
  end
end