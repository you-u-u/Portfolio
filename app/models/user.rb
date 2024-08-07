class User < ApplicationRecord
  has_many :diaries, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_poses, through: :bookmarks, source: :pose

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]

  def social_profile(provider)
    social_profiles.find { |sp| sp.provider == provider.to_s }
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth['provider'].to_s || uid != omniauth['uid']

    credentials = omniauth['credentials']
    info = omniauth['info']
    access_token = credentials['refresh_token']
    access_secret = credentials['secret']
    credentials = credentials.to_json
    name = info['name']
    # self.set_values_by_raw_info(omniauth['extra']['raw_info'])
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    save!
  end

  def bookmark(pose)
    bookmark_poses << pose
  end

  def unbookmark(pose)
    bookmark_poses.destroy(pose)
  end

  def bookmark?(pose)
    bookmark_poses.include?(pose)
  end
end
