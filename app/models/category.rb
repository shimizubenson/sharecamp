class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'テント' },
    { id: 3, name: 'テーブル' },
    { id: 4, name: 'チェア' },
    { id: 5, name: 'ランタン' },
    { id: 6, name: 'ライト・LEDランタン' },
    { id: 7, name: 'BBQ・グリル・焚き火' },
    { id: 8, name: 'スリーピングバッグ・寝袋' },
    { id: 9, name: 'アクセサリー' },
    { id: 10, name: '防災グッズ' },
    { id: 11, name: 'キャンプ用品・その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end