class DiariesController < ApplicationController
  include SetAddicdatum
  before_action :set_addicdatum_addic 
  before_action :set_diary, only: %i[ edit update show]
  before_action :set_new_diary, only: %i[ new create]
  helper_method :generate_alcohol_string
  # GET /diaries or /diaries.json
  def index
    @diaries = @addicdatum.diaries.all
  end

  # GET /diaries/1 or /diaries/1.json
  def show
  end

  # GET /diaries/new
  def new
    alcohol_array
  end

  # GET /diaries/1/edit
  def edit
    alcohol_array
  end

  # POST /diaries or /diaries.json
  def create
    # respond_to do |format|
    #  if @diary.update(diary_params)
    #    format.html { redirect_to diary_url(@diary), notice: "Diary was successfully created." }
    #    format.json { render :show, status: :created, location: @diary }
    #  else
    #    format.html { render :new, status: :unprocessable_entity }
    #    format.json { render json: @diary.errors, status: :unprocessable_entity }
    #  end
    # end
    ActiveRecord::Base.transaction do
      logger.debug "Params received in addicdatum_params: #{params.inspect}"

      if @diary.update(diary_params)
        redirect_to patient_addicdatum_diaries_path, notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to new_patient_addicdatum_diary_path
      end
    end    
  end

  # PATCH/PUT /diaries/1 or /diaries/1.json
  def update
    # respond_to do |format|
    #   if @diary.update(diary_params)
    #     format.html { redirect_to diary_url(@diary), notice: "Diary was successfully updated." }
    #     format.json { render :show, status: :ok, location: @diary }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @diary.errors, status: :unprocessable_entity }
    #   end
    # end
    ActiveRecord::Base.transaction do
      logger.debug "Params received in patient_params: #{params.inspect}"

      if @diary.update(diary_params)
        redirect_to patient_addicdatum_diary_path notice: '更新が完了しました'
      else
        flash.now[:alert]="更新に失敗しました"
        raise ActiveRecord::Rollback # ロールバック
        redirect_to edit_patient_addicdatum_diary_path
      end
    end    
  end

  # DELETE /diaries/1 or /diaries/1.json
  def destroy
    @diary.destroy

    respond_to do |format|
      format.html { redirect_to diaries_url, notice: "Diary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def generate_alcohol_string(diary)
    result = ""
    #diary=Diary.find(diary_id)
    diary.alcoholdiary.attributes.each_with_index do |(attribute, value), index|
      if (1..Alcohol.count).include?(index) 
        if value.include?(0)
          result+=I18n.t("alcohol.name.#{index}")+" "
          value.each do |param|
            if param>0
              result+=I18n.t("alcohol.amount.#{param}").to_s
              break
            end
          end
          value.each do |param|
            if param<0
              result+=I18n.t("alcohol.unit.#{-param}").to_s
              break
            end
          end
        end
      end
      result +=" "
    end
    return result
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_diary
      @diary = @addicdatum.diaries.build
      case @addicdatum.what
      when 1
        @diary.build_alcoholdiary
      end
    end
    def set_diary
      @diary = @addicdatum.diaries.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def diary_params
      case @addicdatum.what
      when 1
        params.require(:diary).permit(:starttime, :endtime, :place, :people, :impetus, :addicdatum_id,alcoholdiary_attributes: [:other,:diary_id,:beer=>[],:strong=>[],:jpricewine=>[],:wine=>[],:shochu=>[],:whisky=>[],:highball=>[]])
      end
    end

    def alcohol_array
      @alcohol_amount=[0]
      @alcohol_unit=[0]
      @diary.alcoholdiary.attributes.each_with_index do |(attribute, value), index|
        if (1..Alcohol.count).include?(index) 
          if value.include?(0)
            value.each do |param|
              if param>0
                @alcohol_amount.push(param)
                break
              end
            end
            value.each do |param|
              if param<0
                @alcohol_unit.push(param)
                break
              end
            end
          else
            @alcohol_amount.push(1)
            @alcohol_unit.push(1)
          end
        end
      end
    end
end

