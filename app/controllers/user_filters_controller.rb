class UserFiltersController < ApplicationController
  before_filter :require_user
  before_filter :set_current_tab

  # GET /filters
  # GET /filters.xml                                                   HTML
  #----------------------------------------------------------------------------
  def index
    @user_filters = UserFilter.find(:all, :conditions => { :user_id => @current_user.id })

    respond_to do |format|
      format.html # index.html.haml
      format.js   # index.js.rjs
      format.xml  { render :xml => @user_filters }
    end
  end

  # DELETE /filters/1
  # DELETE /filters/1.xml                                              AJAX
  #----------------------------------------------------------------------------
  def destroy
    @user_filter = UserFilter.find(params[:id])
    @user_filter.destroy if @user_filter

    respond_to do |format|
      format.html { respond_to_destroy(:html) }
      format.js   { respond_to_destroy(:ajax) }
      format.xml  { head :ok }
    end

  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:html, :js, :xml)
  end

  # GET /mailings/1/confirm                                             AJAX
  #----------------------------------------------------------------------------
  def confirm
    @user_filter = UserFilter.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:js, :xml)
  end

  private

  #----------------------------------------------------------------------------
  def respond_to_destroy(method)
    if method == :ajax
      @user_filter = UserFilter.find(:all, :conditions => { :user_id => @current_user.id })
    else # :html request
      flash[:notice] = "#{t(:asset_deleted, @user_filter.name)}"
      redirect_to(user_filters_path)
    end
  end

end