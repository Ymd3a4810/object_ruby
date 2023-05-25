# CSSを設計する

CSSを設計する必要性
→しっかり設計されたCSSは、記述の方法がルール化され、「良いCSS」にできるのです。

「良いCSS」とはどのようなもの？
→再利用性があり、保守・拡張しやすい

# リファクタリング前
/* CONCEPTセクション */
.concept_title {
  font-family: 'Noto Serif JP', serif;
  text-align: center;
  margin-bottom: 50px;
}
.concept_inner {
  padding: 50px 10% 30px;
}
/* ACCESSセクション */
.access_title {
  font-family: 'Noto Serif JP', serif;
  text-align: center;
  margin-bottom: 50px;
}
.access_inner {
  padding: 50px 10% 30px;
  background: rgba(83,71,65,.3)
}

# リファクタリング後
/* セクション共通 */
.section_title {
  font-family: 'Noto Serif JP', serif;
  text-align: center;
  margin-bottom: 50px;
}
.section_inner {
  padding: 50px 10% 30px;
}
/* ACCESSセクション */
.access_section_inner {
  background: rgba(83,71,65,.3)
}

classの数は3つになり、これから新たにセクションを追加する際も、同じclassを使いながら必要な分だけstyleを追加できるようになる
class名やCSSファイル名を見ただけで影響範囲が予測しやすい、記述方法に規則性があるCSS設計をすることが重要です。

あるコンポーネントのバリエーション違いを、ベースとなるclass、それ以外のclassに分けて設計していく手法を マルチクラス設計 という
修正前の状態のように、バリエーション違いもひとつの独立したコンポーネントとして捉え、1つのコンポーネントに1つのclassを定義する手法を シングルクラス設計 という

# OOCSS（オーオーシーエスエス）はObject-Oriented CSS
プロジェクトで拡張性を高く維持できるようなストラクチャ・スキン設計
コンテナとは<section>要素や<article>要素で作られるような大きなセクションを指します。コンテンツはその中に入るパーツ

# SMACCS（スマックス）はJonathan Snook氏によって提唱されました。”Scalable and Modular Architecture for CSS”の略
1. ベース
 ベースカテゴリのCSSにはWebページに共通・標準となるstyleを定義します。
2. レイアウト
 レイアウトカテゴリのCSSには、コンポーネントの中でもヘッダーやフッター、サイドバーなどのような大きなセクションを構成するコンポーネントに対するstyleを定義
 ”l-“というprefixをつけることが推奨
3. モジュール
 モジュールカテゴリのCSSには、レイアウトカテゴリに定義されるエリアの中に配置されるようなコンポーネント（ボタンやナビゲーションなど）に対するstyle
4. ステート
 ステートカテゴリのCSSには、状態が変化する要素に対するstyle
 主にJavaScriptなどで制御されることを想定したカテゴリ
5. テーマ
 ユーザがテーマカラーを切り替えられるようなWebサイトの場合、既存のベースカラーをすべて変更する必要があります。その際に、ベースとなるstyleを記述しておくカテゴリです。

 # BEM（ベム）はYandex社によって提唱された、OOCSSやSMACSSに比べてルールが厳格な設計手法
 Blockは、配置される場所に関わらず、ページ内のどこでも使用できる独立したBEMエンティティです。
 Elementは、Blockを構成するBEMエンティティであり、Blockの外では独立して使用できないもの
 Modidierは、BlockやElementの状態や装飾を定義するBEMエンティティ

 BEMにおけるclassの命名規則
 基本ルールは、各BEMエンティティをハイフンやアンダースコアで繋げた形
 Block-Modifier間は アンダースコア2つ で、Element-Modifier間は アンダースコア1つ でつなぐ

 # Mix
Mixは、一つの要素に複数の異なるBEMエンティティを設定することで、コードを複製することなくstyleを組み合わせるという考え方
レイアウトされるBlockとの位置関係のようなstyleの場合
親要素であるBlockの性質に応じてstyleが決まる場合

# CSSのライブラリとは
CSSライブラリを使用するという手段もあります。すでに設計されたCSSがライブラリとしてまとめられて公開され、多くの開発者に利用されている

# Bootstrap
Bootstrap（ブートストラップ）は、Twitter社が開発した、利用者が多いライブラリ
JavaScriptを使用した動きのあるコンポーネント

# Foundation
Bootstrapに比べてカスタマイズ性の高さが特徴

# Bulma
シンプルにCSSのみを使用したライブラリ、自分でJavaScriptを記述する必要。
