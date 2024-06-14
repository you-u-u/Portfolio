class DiariesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_pose, only: %i[new]
  before_action :check_register_diary, only: %i[new create]

  def new
    #binding.pry
    @diary = Diary.new(pose_id: @pose.id, date:Date.today)
  end

  def create
    
    @diary = current_user.diaries.build(diary_params)
        
    if @diary.save
      redirect_to diaries_path, success: "記録しました"
    else
      flash.now[:danger] = "記録できませんでした"
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
      redirect_to diaries_path, notice:"今日の頑張りは登録してあります！また明日も頑張りましょう！"
    end
  end

  def diary_params
    params.require(:diary).permit(:date, :compatibility, :condition, :feeling, :sleep, :memo, :weight, :user_id, :pose_id)
    # ここに:user_id, :pose_idを追加

  end

end
