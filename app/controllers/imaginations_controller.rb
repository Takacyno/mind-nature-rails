class ImaginationsController < ApplicationController
  include SetAddicdatum
  include SetImaginationtext
  before_action :set_addicdatum_addic 
  before_action :set_imaginationtext 
  before_action :set_imagination, only: %i[ edit update show]
  before_action :set_new_imagination, only: %i[ new create]
  # GET /imaginations or /imaginations.json
  def index
    @imaginations = @imaginationtext.imaginations.all
  end

  # GET /imaginations/1 or /imaginations/1.json
  def show
  end

  # GET /imaginations/new
  def new
  end

  # GET /imaginations/1/edit
  def edit
  end

  # POST /imaginations or /imaginations.json
  def create
    ActiveRecord::Base.transaction do
      logger.debug "Params received in addicdatum_params: #{params.inspect}"

      if @imagination.update(imagination_params)
        redirect_to patient_addicdatum_imaginationtext_imaginations_path, notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to new_patient_addicdatum_imaginationtext_imagination_path
      end
    end    
  end

  # PATCH/PUT /imaginations/1 or /imaginations/1.json
  def update
    ActiveRecord::Base.transaction do
      logger.debug "Params received in patient_params: #{params.inspect}"

      if @imagination.update(imagination_params)
        redirect_to patient_addicdatum_imaginationtext_imagination_path notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to edit_patient_addicdatum_imaginationtext_imagination_path
      end
    end    
  end

  # DELETE /imaginations/1 or /imaginations/1.json
  def destroy
    @imagination.destroy

    respond_to do |format|
      format.html { redirect_to imaginations_url, notice: "imagination was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_imagination
      @imagination = @imaginationtext.imaginations.build
    end
    def set_imagination
      @imagination = @imaginationtext.imaginations.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def imagination_params
      params.require(:imagination).permit(:addicdatum_id,
      :othertextafter,
      :othertextbefore,
      :drivingforcebefore,
      :drivingforceafter,
      :completion,
      :interruption,
      :interruptiontext,
      :post,
      :posttext,
      :people,
      :peopletext,
      :autonomicnervesbefore=>[],
      :feelingbefore=>[],
      :directionbefore=>[],
      :otherbefore=>[],
      :autonomicnervesafter=>[],
      :feelingafter=>[],
      :directionafter=>[],
      :otherafter=>[],
      :word=>[]
      )
    end

end

