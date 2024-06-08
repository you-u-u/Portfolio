class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pose, only: %i[new create]
  before_action :check_register_diary, only: %i[new create]

  def new
    @diary = Diary.new(pose_id: @pose.id, date:Time.zone.today)
  end

  def create
    @diary = current_user.diaries.build(diary_params)
    @diary.pose = @pose
    @diary.date = Time.zone.today
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

  private

  def set_pose
    @pose = Pose.find(params[:pose_id])
  end

  def check_register_diary
    if diary.where(user:current_user, date:Time.zone.today).exists?
      redirect_to diaries_path, notice:"今日の頑張りは登録してあります！また明日も頑張りましょう！"
    end
  end

  def diary_params
    params.require(:diary).permit(:compatibility, :condition, :feeling, :sleep, :memo, :weight)
  end

end
