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

    respond_to do |format|
      if @user_filter.destroy
        format.js   # destroy.js.rjs
        format.xml  { head :ok }
      else
        flash[:warning] = t(:msg_cant_delete_user_filter, @user_filter.name)
        format.js   # destroy.js.rjs
        format.xml  { render :xml => @user_filter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /mailings/1/confirm                                             AJAX
  #----------------------------------------------------------------------------
  def confirm
    @user_filter = UserFilter.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:js, :xml)
  end

end