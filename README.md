# JMSDFMeguri

アプリ名：海自めぐり

海上自衛隊に所属する護衛艦を図鑑化したアプリです。

機能1：
名前、艦番号検索機能：検索欄に名前の一部を入れるだけで候補が出るような、インクリメンタルサーチが可能です。

機能2：
母港、艦種フィルター機能：護衛艦の母港や艦種によってDBでフィルターをかけることにより、よりユーザーが検索しやすくなるようにしました。

機能3：
画面サイズに合わせたレイアウト：collectionViewCellも含め、全てのパーツはユーザーの使用する機種によって可変するのでレイアウトが崩れないようにしています。

機能4：
画像読み込み処理速度向上：FireStoreに格納してある各護衛艦データの中にFireStorageのストレージURLも格納しており、画像DL時になるべく負荷を抑えることでDL速度向上に繋げました


・アーキテクチャ：MVC 

・インフラ構成：図鑑データはCloudFirestore、画像データはFireStorageに格納しています。
　　　　　　　　　　　　　　　　　　　　　　図鑑のシードデータはGoogleスプレッドシートで管理し、CSV→JSON形式にしてJavaScriptで書いたプログラムでFireStoreへ一括アップデートしております。
                      
・アプリ制作で苦労した点：インクリメンタルサーチ機能、collectionViewCellのUI調整、画像の読込速度向上

・今後実装したい機能：基地周辺のお店をマップ表示、艦艇の識別番号を画像認識して詳細画面に遷移する 、図鑑データの追加・更新

・今後使用したい技術：Google Maps SDK for iOS、CoreML、Realm、RxSwift   
