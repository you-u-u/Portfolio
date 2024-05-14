
# yoga Diary
## ■サービス概要
毎日ユーザーが決めた時間にヨガ(運動)をする習慣をサポートするアプリです。  
朝目覚めたとき、デスクワーク中、または夜寝る前に１日１つのポーズを実践し、毎日の運動習慣を記録します。

## ■ このサービスへの思い・作りたい理由
運動を日常に取り入れたいと思いながらも、忙しさにかまけてなかなか実行できない自身の経験から、このサービスを考案しました。  
決まった時間に短時間でも体を動かす習慣が、運動への第一歩になると思っています。また、ヨガのポーズは、朝の代謝アップや夜の安眠を促進するものとして知られており、自身もyogaを以前習っていた経験から、手軽に始めれる運動習慣にふさわしいと感じております。

## ■ ユーザー層について
1. 運動習慣のきっかけを作りたい人
2. 朝起きが苦手な人
3. 夜熟睡したい人

## ■サービスの利用イメージ
会員登録後、ユーザーは自分が決めた時間に通知を受け取り、提供される1つのヨガのポーズを実践します。また、自身の行ったポーズ、気分やポーズができたかどうかをセレクト式に選んでカレンダーに保存することが可能です。ユーザーは自身の体調等を記録することを通して、毎日の運動習慣を視覚的に確認し、継続するモチベーションを得ることができます。  
また、ゲストユーザーにはヨガポーズの提供を行います。

## ■ ユーザーの獲得について
- SNSを利用したユーザー獲得

## ■ サービスの差別化ポイント・推しポイント  
多くのヨガアプリがありますが、当サービスは毎日１つのポーズを提供し、カレンダーに記録して習慣化をサポートする点が差別化ポイントと考えております。この機能により、ユーザーはポーズを取るだけでなく、その瞬間を記録し、振り返ることができます。これがモチベーション維持に繋がり、習慣化への大きな一歩となります。

## ■ 機能候補

### MVPリリース
- ユーザー登録機能
- LINE通知
- yogaポーズ提供機能
- 記録用カレンダー
- X投稿 (実践したyogaポーズをシェアする)

### 本リリース
- コミュニティ機能
  (実践ポーズの投稿機能・いいねおよびコメント機能)

### 技術スタック
- Ruby 
- Ruby on Rails
- Tailwind CSS
- JavaScript
- PostgreSQL
- Heroku
- LINE ログイン
- LINE messenger API

## 機能の実装方針予定
- LINE通知機能: LINE Messaging APIを使用して、ユーザーにヨガポーズの通知を送信します。
- yogaポーズ提供機能: 商用可能イラスト及びポーズの解説をあらかじめデータベースに登録し、毎日ランダムで提供を行います


## 画面遷移図URL
https://www.figma.com/file/DF340NoUitwUeCkYEH9NuY/PF-%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=0%3A1&mode=design&t=xYQpW5CKyAZ9OS4m-1

## ER図
[![Image from Gyazo](https://i.gyazo.com/51685edd9a2242d2fdd8d1ad536c608d.png)](https://gyazo.com/51685edd9a2242d2fdd8d1ad536c608d)