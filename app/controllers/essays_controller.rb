class EssaysController < ApplicationController
    include SetAddicdatum
    before_action :set_addicdatum_addic 
  
    # GET /diaries/1 or /diaries/1.json
    def show
    end
  
    # GET /diaries/1/edit
    def edit
    end
    def update
      ActiveRecord::Base.transaction do
        logger.debug "Params received in essay_params: #{params.inspect}"
  
        if @addicdatum.update(essay_params)
          redirect_to patient_addicdatum_essay_path notice: '更新が完了しました'
        else
          flash.now[:alert]="更新に失敗しました"
          raise ActiveRecord::Rollback # ロールバック
          redirect_to edit_patient_addicdatum_essay_path
        end
      end    
    end
  
    private
      def essay_params
          params.require(:addicdatum).permit(:essay)
      end
  end
  
  