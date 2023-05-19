# object_ruby
##クラスの設定
#class Dog
  def eat
  end
end

pochi = Dog.new

実行
pochi.shake_tail
=> "tail shaking"


##スコープ
グローバル変数	どこからでも参照できる	＄data	$を付加
クラス変数	設定したクラス内及びそれを継承するサブクラス、インスタンス内で参照できる	@@data	@@を付加
インスタンス変数	同じインスタンス内でのみ参照できる	@data	@を付加
ローカル変数	同じメソッド内でのみ参照できる	data	英小文字または_で始まるスネークケースで表記
定数	設定したクラス内及びそれを継承するサブクラス、インスタンス内で参照できる	DATA	英大文字で表記

##インスタンス変数に値を入れる
#name= メソッド
#name メソッド
class Dog
  def name=(arg)
    @name = arg
  end
  def name
    @name
  end
end

pochi = Dog.new
hachi = Dog.new
pochi.name=("pochi") >書き換え pochi.name = "pochi"
hachi.name=("hachi") > 書き換え hachi.name = "hachi"
pochi.name => "pochi"
hachi.name => "hachi"

##attr_accessor :name nameメソッド短縮
class Dog
  attr_accessor :name
  def eat
    "eating"
  end
end

attr_reader(writter) :name ※片方だけ指定する場合

##instance_variables インスタンス変数の確認

##
* class Book
*   @title = "Book title"
*   def get_title
*     @title
*   end
*   def set_title
*     @title = "Study of Ruby"
*   end
> end
=> :set_title
----------------------------------
class Title
  TITLE_WORD = "Ruby on Rails"
  def main
    "Book title is #{TITLE_WORD}"
  end
end
> t = Title.new
> t.main
=> "Book title is Ruby on Rails"
----------------------------------
class Theme
  def title
    "My book title is #{Book::TITLE_WORD}"
  end
end
> theme = Theme.new
> theme.title
=> "My book title is Ruby on Rails"

##initializeメソッド（初期化メソッド）※インスタンス時に引数で設定
class Dog
  attr_reader :name
　def initialize(arg)
    @name = arg
  end
end
pochi = Dog.new("pochi")
pochi.name
=> "pochi"

##methodsメソッド
インスタンスが保有しているメソッドの確認

##クラスメソッド　selfをつける
---------------------------
class Cafe
  def self.drink
    "drinking"
  end
end
Cafe.drink
=> "drinking"
---------------------------
または下記　※self配下に定義したメソッドはすべてクラスメソッド
---------------------------
class Cafe
  class << self
    def drink
      "drinking"
    end
  end
end
Cafe.drink
=> "drinking"
---------------------------
self.class→クラスの参照

##プライベートメソッド private宣言子をつける。つけなければデフォルトのpublic
オブジェクト内部で、あるまとまったロジックを一つのメソッドの形にして利用するもの。
----------------------------
class Cafe
  def drink(kind)
    "#{kind}は、#{coffee(kind)}です。"
  end

  private
  def coffee(kind)
    if kind == "モカ"
      "フルーツのような酸味と甘み"
    elsif kind == "キリマンジャロ"
      "野性味あふれる味"
    elsif kind == "ブルーマウンテン"
      "コーヒーの王様"
    end
  end
end
> cafe = Cafe.new
> cafe.drink("モカ")
=> "モカは、フルーツのような酸味と甘みです。"
> cafe.drink("ブルーマウンテン")
=> "ブルーマウンテンは、コーヒーの王様です。"
----------------------------

##継承
class クラス名 < 継承元（親）のクラス名
end
----------------------------
class Animal
  attr_reader :name

  def initialize(arg)
    @name = arg
  end

  def eat
    "食べる"
  end

  def move
    "自由に移動する"
  end

　def voice
    @voice = "声を出す"
  end
end#animalクラスを継承するCatクラス
class Cat < Animal
#親クラスのオーバーライド→動作の中身を変える（各インスタンスで振る舞いを変える）
    def voice
        super
        "#{@voice}: ニャーゴ"
    end

    def voice(arg1="ウォー", arg2="声を出す")
    "#{name}が#{arg1}と#{arg2}"
  end
end

   def scratch
    "ひっかく"
  end
end
> mike.scratch
=> "ひっかく"
> mike.methods
[:scratch, :name, :move, :eat,省略 ]
親クラスを参照※親クラスはObjectクラスを継承
> Cat.superclass
=> Animal
-----------------------------
##モジュール
インスタンス不可、メソッドを共通利用できるライブラリのような役割
全く異なる機能を従来のクラスに付加※ミックスイン
>定義
module モジュール名
処理
end
>使用
include モジュール名
又はextend
-----------------------------
#定義
module Pet
  attr_accessor :owner

  def look(arg=nil)
    if owner == arg
      "甘える"
    else
      "警戒する"
    end
  end
end
#使用
class Dog < Animal
  include Pet
end

pochi = Dog.new("ポチ")
pochi.owner = "山田太郎"
> pochi.look("山田太郎")
=> "甘える"
> pochi.look("田中花子")
=> "警戒する"
------------------------------
##グループ化
一つのモジュールの中にさまざまな関係するクラスやモジュールを定義していくことで、共通の名前で修飾されるクラスやモジュールを構成
------------------------------
module Cooking
  class Base #調理工程メソッド
    def bake(arg)
      "#{arg}を焼く"
    end
    def stir_fry(arg)
      "#{arg}を炒める"
    end
    def boil(arg)
      "#{arg}を煮る"
    end
  end

  class Ingredients　#材料
    def meats
      "肉"
    end
    def vegetables
      "野菜"
    end
  end

  class Recipe
  end
end
#インスタンス化およびメソッドの実施
> cook = Cooking::Base.new
> ingredients = Cooking::Ingredients.new
> cook.bake(ingredients.meats)
=> "肉を焼く"
> cook.boil(ingredients.vegetables)
=> "野菜を煮る"
------------------------------
継承は「is-a」の関係 「BはAの一つである」
「has-a」の関係 オブジェクト内部に直接含んで扱う





