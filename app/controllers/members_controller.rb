class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def create
    @group = Group.find(params[:group_id])
    @member = @group.members.new(member_params)
    @member.user = current_user

    respond_to do |format|
      if @member.save
        format.html { redirect_to @group, notice: 'You have joined.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json


  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:group_id, :rsvp, :user_id)
    end
end
