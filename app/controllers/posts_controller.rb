class PostsController < Spree::BaseController
  before_filter :tags
  resource_controller
  actions :show, :index

   index.response do |wants|
    wants.html
    wants.rss
  end

  #prokeraround attivo
  # solo per la fase attuale, in attesa di capirnee il comportamento
  def unauthorized
    collection
    @posts=@collection
    render :index
  end

  def tag
    collection
    @posts=@collection
    render :index
  end

private
  def tags
    @tags = Tag.all
  end

  def collection

       debugger
    if params[:tag_name]
             coll  = Post.publish.joins(:tags).where(:tags=>{:name=>params[:tag_name]})
             @total = coll.count
             @collection ||= coll.page(params[:page])
    else
             @total  = Post.publish.count
             @collection ||= Post.publish.page(params[:page])
        end


  end


end 