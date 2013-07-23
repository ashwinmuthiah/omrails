class PinsController < ApplicationController
  # A method from devise that makes you sign in before performing this action.
  before_filter :authenticate_user!, except: [:index]

  # GET /pins
  # GET /pins.json
  def index
    # Replace Pin.all with Pin.order to display in a certain order
    # In this case, descending by created_at
    # .page.... pagination. displays 20 per page. Look at index to see rest
    @pins = Pin.order("created_at desc").page(params[:page]).per_page(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pins }
    end
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
    @pin = Pin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pin }
    end
  end

  # GET /pins/new
  # GET /pins/new.json
  def new
    #Saves user_id when creating a pin
    @pin = current_user.pins.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pin }
    end
  end

  # GET /pins/1/edit
  def edit
    # Only lets the current user to edit pins
    @pin = current_user.pins.find(params[:id])
  end

  # POST /pins
  # POST /pins.json
  def create
    #Saves user_id when creating a pin
    @pin = current_user.pins.new(params[:pin])

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render json: @pin, status: :created, location: @pin }
      else
        format.html { render action: "new" }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pins/1
  # PUT /pins/1.json
  def update
    # Only lets the current user to edit pins
    @pin = current_user.pins.find(params[:id])

    respond_to do |format|
      if @pin.update_attributes(params[:pin])
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    # Only lets the current user to edit pins
    @pin = current_user.pins.find(params[:id])
    @pin.destroy

    respond_to do |format|
      format.html { redirect_to pins_url }
      format.json { head :no_content }
    end
  end
end
