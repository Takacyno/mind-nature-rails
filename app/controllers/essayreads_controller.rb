class EssayreadsController < ApplicationController
    include SetAddicdatum
    before_action :set_addicdatum_addic 
    before_action :set_essayread, only: %i[ show edit update ]
    before_action :set_new_essayread, only: %i[ new create]
  
    # GET /diaries/1 or /diaries/1.json
    def index
        if @addicdatum.essayreads.where(created_at:Time.current.all_day).exists?
            redirect_to  patient_addicdatum_essayread_path(id:@addicdatum.essayreads.where(created_at:Time.current.all_day).first.id)
        else
            redirect_to  new_patient_addicdatum_essayread_path
        end
    end
    def show

    end

    def new
    end
  
    # GET /diaries/1/edit
    def edit
    end
    def create
        ActiveRecord::Base.transaction do
          logger.debug "Params received in essayread_params: #{params.inspect}"
    
          if @essayread.update(essayread_params)
            redirect_to patient_addicdatum_essayreads_path notice: '更新が完了しました'
          else
            flash.now[:alert]="更新に失敗しました"
            raise ActiveRecord::Rollback # ロールバック
            redirect_to new_patient_addicdatum_essayread_path
          end
        end    
      end
    
    def update
      ActiveRecord::Base.transaction do
        logger.debug "Params received in essay_params: #{params.inspect}"
  
        if @essayread.update(essayread_params)
          redirect_to patient_addicdatum_essayread_path notice: '更新が完了しました'
        else
          flash.now[:alert]="更新に失敗しました"
          raise ActiveRecord::Rollback # ロールバック
          redirect_to edit_patient_addicdatum_essayread_path
        end
      end    
    end
  
    private
      def set_new_essayread
        @essayread = @addicdatum.essayreads.build
      end
      def set_essayread
        @essayread = @addicdatum.essayreads.find(params[:id])
      end
      def essayread_params
        params.require(:essayread).permit(:addicdatum_id,:num)
      end
  end
  
  