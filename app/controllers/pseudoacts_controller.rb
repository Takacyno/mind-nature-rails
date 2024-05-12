class PseudoactsController < ApplicationController
  include SetAddicdatum
  before_action :set_addicdatum_addic 
  before_action :set_pseudoact, only: %i[ edit update show]
  before_action :set_new_pseudoact, only: %i[ new create]
  # GET /pseudoacts or /pseudoacts.json
  def index
    @pseudoacts = @addicdatum.pseudoacts.all
  end

  # GET /pseudoacts/1 or /pseudoacts/1.json
  def show
  end

  # GET /pseudoacts/new
  def new
  end

  # GET /pseudoacts/1/edit
  def edit
  end

  # POST /pseudoacts or /pseudoacts.json
  def create
    ActiveRecord::Base.transaction do
      logger.debug "Params received in addicdatum_params: #{params.inspect}"

      if @pseudoact.update(pseudoact_params)
        redirect_to patient_addicdatum_pseudoacts_path, notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to new_patient_addicdatum_pseudoact_path
      end
    end    
  end

  # PATCH/PUT /pseudoacts/1 or /pseudoacts/1.json
  def update
    ActiveRecord::Base.transaction do
      logger.debug "Params received in patient_params: #{params.inspect}"

      if @pseudoact.update(pseudoact_params)
        redirect_to patient_addicdatum_pseudoact_path notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to edit_patient_addicdatum_pseudoact_path
      end
    end    
  end

  # DELETE /pseudoacts/1 or /pseudoacts/1.json
  def destroy
    @pseudoact.destroy

    respond_to do |format|
      format.html { redirect_to pseudoacts_url, notice: "pseudoact was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_pseudoact
      @pseudoact = @addicdatum.pseudoacts.build
    end
    def set_pseudoact
      @pseudoact = @addicdatum.pseudoacts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pseudoact_params
      params.require(:pseudoact).permit(:addicdatum_id,
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
      :timezone,
      :autonomicnervesbefore=>[],
      :feelingbefore=>[],
      :directionbefore=>[],
      :otherbefore=>[],
      :autonomicnervesafter=>[],
      :feelingafter=>[],
      :directionafter=>[],
      :otherafter=>[]
      )
    end

end

