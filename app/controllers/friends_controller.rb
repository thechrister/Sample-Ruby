class FriendsController < ApplicationController
  before_action :set_friend, only: %i[show edit update destroy]
  include FriendsHelper

  # GET /friends or /friends.json
  def index 
    @friends = Friend.all
  end

  # GET /friends/1 or /friends/1.json
  def show
    if @friend.excel_file.attached?
      @excel_content = extract_excel_content(@friend.excel_file)
    end
  end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends or /friends.json
  def create
    @friend = Friend.new(friend_params)
    
    respond_to do |format|
      if @friend.save
        format.html { redirect_to friend_url(@friend), notice: "Friend was successfully created." }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to friend_url(@friend), notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: "Friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :email, :phone, :twitter, :photo, :excel_file)
    end

    def extract_excel_content(excel_blob)
      return [] unless excel_blob.attached?

      # Use the roo gem to parse the Excel file content
      excel_data = Roo::Excelx.new(excel_blob.download)

      # Extract data into an array
      excel_data.sheet(0).parse
    end

    def render_excel_content(excel_blob)
      content = extract_excel_content(excel_blob)
      render partial: 'excel_content', locals: { content: content }
    end
end
