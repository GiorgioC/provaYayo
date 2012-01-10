
class Admin::HomeResourcesController <  Admin::ResourceController
  resource_controller

  def index
    @object = HomeResource.where(:preview=>true).first
    @object  = HomeResource.new if @object.nil?
    @object.preview=true

    @object.save if HomeResource.where(:preview=>true).empty?
    HomeResource.create :preview=>false if HomeResource.where(:preview=>false).empty?

    render :edit
    #redirect_to :action=>:edit
  end

  def show
    render :edit
  end
  #def edit
  #  @hr = HomeResource.first
  #  @hr  = HomeResource.new if @hr.nil?
  #end



  def clearimage
        @object = HomeResource.where(:id=>params[:home_resource_id]).first
        @object.send(params[:scope]).clear
        @object.send(params[:scope]).destroy
        @object.send(params[:scope],nil)
        @object.save
        @scope = params[:scope]
        respond_with(@scope) do |format|
          format.js  {render :layout => false}
        end
  end

  def publish
      expire_fragment :header
      expire_fragment :home
      expire_fragment :promo_top

      @object = HomeResource.where(:id=>params[:home_resource_id]).first
      published = HomeResource.where(:preview=>false).first
      published.destroy  unless published.nil?
      nuovo = HomeResource.new :title=>@object.title,:iconic=>@object.iconic,:background=>@object.background,  :logo=>@object.logo,
                                :leaderboard=>@object.leaderboard, :head_background=>@object.head_background,
                                :claim=>@object.claim,:preview=>false



      if (nuovo.save)
        flash[:notice] =flash_message_for(@object, :wp_online)
        respond_with(@object) do |format|
          format.html { redirect_to location_after_save }
          format.js   { render :layout => false }
        end
      else

        redirect_to location_after_save
      end

  end



end
