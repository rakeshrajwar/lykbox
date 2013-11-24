class UpdatesController < ApplicationController

 before_filter :authenticate_user! #, :except => [:some_action_without_auth]	
	
def index
  @update = Update.new
  @updates = Update.order("created_at DESC")
end

 # POST /updates.json
  def create
    @update = Update.new(:text =>params[:update][:text], :sender_id => current_user.id)

    respond_to do |format|
      if @update.save
        flash[:notice] = "Update was successfully created"
        format.html { redirect_to updates_path, notice: "Update was successfully created"  }
        format.json { render json: @update, status: :created, location: @updates }
      else
        format.html { redirect_to updates_path, notice: "Oops! Sorry, it looks like blank post!"  }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /updates/1
  # DELETE /updates/1.json
  def destroy
    @update = Update.find(params[:id])
    @update.destroy

    respond_to do |format|
      format.html { redirect_to updates_path, notice: "Update was successfully deleted"  }
      format.json { head :no_content }
    end
  end
end
