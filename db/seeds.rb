# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

poses = [
  { japanese_name:'木のポーズ', description:'足を腰幅程度に開いて立つ<br>右足を曲げて足裏を左うちももにつける<br>胸の前で両手を合わせる。余裕があれば合掌したまま腕を上げて3〜5呼吸キープ!', benefit:'集中力アップ 体幹強化', tip:'目線を一点集中に', image:'tree.jpg'},
  { japanese_name:'立位前屈のポーズ', description:'足全体で床を踏み背筋を伸ばす<br>足の付け根から上半身を前に倒して5回深呼吸', benefit:'内蔵機能の向上があるといわれている', tip:'おしりがかかとより後ろにいかないように！きつければひさを軽く曲げましょう', image:'forward_bend.jpg'},
  { japanese_name:'椅子のポーズ', description:'かかとをそろえてまっすぐ立つ<br>息を吐きながらおしりを後ろに引いてひざを曲げる<br>息を吸いながら両手を頭上へ!目線をあげて5呼吸キープ!', benefit:'下半身の筋力強化', tip:'ひざが足先よりも前に出ないように、重心をかかとに', image:'chair.jpg'}
]

poses.each do |pose|
  Pose.create!(pose)
end
