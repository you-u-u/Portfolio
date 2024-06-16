class DiariesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_pose, only: %i[new]
  before_action :check_register_diary, only: %i[new create]

  def new
    #binding.pry
    @diary = Diary.new(pose_id: @pose.id, date:Date.today)
    #@pose = Pose.find(params[:pose_id])
  end

  def create
    
    @diary = current_user.diaries.build(diary_params)
    @pose = Pose.find_by(id: diary_params[:pose_id])
        
    if @diary.save
      redirect_to diaries_path, notice: "記録しました"
    else
      flash.now[:alert] = "記録できませんでした"
      
      Rails.logger.debug(@diary.errors.full_messages.join(", "))
      render :new
    end
  end

  def index
    @diaries = current_user.diaries
  end

  def show
    @diary = Diary.find(params[:id])
  end
  
  private

  def set_pose
    @pose = Pose.find(params[:pose_id])
  end

  def check_register_diary
    if Diary.where(user:current_user, date:Time.zone.today).exists?
      flash[:notice] = "今日のDiaryは登録してあります！また明日も頑張りましょう！"
      redirect_to diaries_path
    end
  end

  def diary_params
    params.require(:diary).permit(:date, :compatibility, :condition, :feeling, :sleep, :memo, :weight, :user_id, :pose_id)
    # ここに:user_id, :pose_idを追加

  end

end
