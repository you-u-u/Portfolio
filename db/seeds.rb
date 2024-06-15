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
  { japanese_name:'木のポーズ', description:'1.足を腰幅程度に開いて立つ<br>2.右足を曲げて足裏を左うちももにつける<br>3.胸の前で両手を合わせる。合掌したまま腕を頭上に上げて5呼吸キープ!<br>反対も同様に行いましょう', benefit:'集中力アップ 体幹強化', tip:'目線を一点集中に', image:'tree.jpg'},
  { japanese_name:'立位前屈のポーズ', description:'1.足全体で床を踏み背筋を伸ばす<br>2.足の付け根から上半身を前に倒して5回深呼吸', benefit:'柔軟性アップ　リフレッシュ効果', tip:'おしりがかかとより後ろにいかないように！<br>きつければひざを軽く曲げましょう', image:'forward_bend.jpg'},
  { japanese_name:'椅子のポーズ', description:'1.かかとをそろえてまっすぐ立つ<br>2.息を吐きながらおしりを後ろに引いてひざを曲げる<br>3.息を吸いながら両手を頭上へ!目線をあげて5呼吸キープ!', benefit:'下半身の筋力強化', tip:'ひざが足先よりも前に出ないように!<br>重心をかかとに', image:'chair.jpg'},
  { japanese_name:'戦士のポーズⅠ', description:'1.まっすぐ立ったら、右足を大きく前に踏み出し、左足のつま先を45度外側に向ける<br>2.息を吐きながら右ひざを90度に曲げる<br>3.息を吸いながら手のひらを内側に向け両手を天井へ！<br>4.そのまま5呼吸！反対側も同様に！', benefit:'脚の強化', tip:'重心は左右均等に<br>骨盤は正面に向けましょう！', image:'warrior1.jpg'},
  { japanese_name:'戦士のポーズⅡ', description:'1.まっすぐ立ったら、右足を大きく前に踏み出す<br>2.左足のつま先を90度外側に抜け、骨盤と胸を左に向ける<br>3.息を吐きながら右ひざを90度に曲げ、両手を肩の高さで横に開く<br>4.目線は右手へ！そのまま5呼吸キープ！<br>反対側も同様に！', benefit:'脚の強化', tip:'重心は低く！', image:'warrior2.jpg'},
  { japanese_name:'戦士のポーズⅢ', description:'1.両足で地面を踏みしめたら、右足を前に出す<br>2.両手を頭上に上げ、手のひらを合わせる<br>3.右足に体重を乗せ上半身を前に倒し、左足は後ろへ上げてTの姿勢に<br>4.そのまま5呼吸！反対側も同じように！', benefit:'バランス感覚アップ', tip:'バランスが取れない場合は無理せず！ちょっとずつ☆', image:'warrior3.jpg'},
  { japanese_name:'戦闘をやめた戦士のポーズ', description:'1.両足を左右に大きく開く<br>2.右のつま先を右側へ、左のつま先を正面に向ける<br>3.右ひざを90度に曲げ、両手は肩の高さで左右に広げる<br>4.左手は左足に添わせるようにし、右手を天井へと伸ばし体を側屈させる<br>5.姿勢を保ったまま5回深呼吸！<br>反対側も同様に行う', benefit:'体幹の強化', tip:'首の力を抜きましょう', image:'reverse_warrior.jpg'},
  { japanese_name:'ダンサーのポーズ', description:'1.両足をそろえて立つ<br>2.左足を後ろへ曲げ、左手で足の甲をつかむ<br>3.右手は肩の高さで顔の前に伸ばす<br>4.息を吐きながら足をあげ、状態を前に倒す<br>5.5呼吸キープしたら反対側も同じよう行う', benefit:'柔軟性アップ', tip:'これで私もダンサー☆', image:'dancer.jpg'},
  { japanese_name:'プランクポーズ', description:'1.よつんばいになり、肩の真下に手首を置く<br>2.お腹を引き込みながら、片足ずつまっすぐ後ろに伸ばす<br>3.頭からかかとまでが一直線になるように意識して、気が向くままキープ！', benefit:'おなかぺったんこ', tip:'お腹は常に引きこんで！呼吸は大きく！<br>やればやるだけおなかがえぐれる！かも', image:'plank.jpg'},
  { japanese_name:'牛の顔のポーズ', description:'1.両足を前に伸ばし、右足を立てて左足の外側に置く<br>2.左膝を曲げて両膝を重ね、かかとをお尻に近づける<br>3.左手を上から、右手は下から回して背中で両手をつなぐ<br>4.頭で上の腕を後ろに押して、前を向いて5呼吸キープ！反対側も行いましょう！', benefit:'肩こり解消', tip:'手が組めない場合はタオルを使ってみても◎', image:'cow_face.jpg'},
  { japanese_name:'三角のポーズ', description:'1.両足を大きく開いて立ち、左足を左、右足を正面に向ける<br>2.両手を肩の高さで横に開く<br>3.息を吐きながら上半身を左に倒す！左手は左足、右手は天井に伸ばし、目線も右手へ！<br>4.5呼吸キープしたら反対もチャレンジ！', benefit:'脚強化', tip:'肩の力を抜きましょう', image:'triangle.jpg'},
  { japanese_name:'門のポーズ', description:'1.腰幅の立ちひざになり、右足を真横に伸ばす<br>2.右手を右太ももの上に置き、左手は頭上へ<br>3.体全体を右へ倒し5呼吸したら、反対側も行いましょう', benefit:'歪み改善', tip:'体の全面が伸びる感覚を感じましょう', image:'gate.jpg'},
  { japanese_name:'橋のポーズ', description:'1.仰向けになり両膝を立てる。かかとはお尻の近くにする<br>2.お尻を少し浮かせて、お尻の下で両手を組む<br>3.肩を寄せ、ひざが開かないように気を付けながらお尻を持ち上げキープ', benefit:'ヒップアップ', tip:'きれいなアーチがかかりましたか？<br>体を戻すときに負担がかかるので、ゆっくりおろしましょう', image:'bridge.jpg'},
  { japanese_name:'下向き犬のポーズ', description:'1.四つん這いになりつま先を立てる<br>2.両手で床を押しお尻を持ち上げ「く」の字を作る<br>3.その場で数回足踏みし、かかとを下したら10回深呼吸をしましょう', benefit:'血流促進', tip:'背中が丸くならないように気を付けましょう', image:'down_dog.jpg'}
]

poses.each do |pose_date|
  pose=Pose.find_or_initialize_by(japanese_name: pose_date[:japanese_name])
  pose.update!(pose_date)
end
