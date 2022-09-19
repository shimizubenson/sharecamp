test_user_1 = User.create(
  nickname: "ENV['SECRET_NICKNAME']",
  first_name: '山田',
  last_name: '太郎',
  first_name_kana: 'ヤマダ',
  last_name_kana: 'タロウ',
  email: "ENV['SECRET_EMAIL']",
  password: "ENV['SECRET_PASSWORD']",
  password_confirmation: "ENV['SECRET_PASSWORD_CONFIRMATION']",
  birthday: '1986-03-05',
  admin: true
)

