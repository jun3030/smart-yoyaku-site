# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# email = "changemymind6@gmail.com"
# pass = "shotaimai6"
# channel_id = "1603141730"
# channel_secret = "a59f370b529454e32f779071d9b50454"

# admin = Admin.new(email: email, password: pass, encrypted_password: pass)
# admin.build_line_bot(channel_id: channel_id, channel_secret: channel_secret)
# admin.save!


User.create!(name: "テスト管理者", email:"changemymind6@gmail.com", password:"password", password_confirmation:"password")
Calendar.create!(user_id: 1, calendar_name: "ひまわりマッサージ", address:"東京都渋谷区１１１１１", phone:"09057975695")
Staff.create!(calendar_id: 1, name:"スタッフA", email:"changemymind6@gmail.com", password:"password", password_confirmation:"password", description: "元気いっぱいです！")
TaskCourse.create!(calendar_id: 1, title:"60分コース", description:"ノーマルマッサージ+オイルヘッドマッサージ", course_time: 60, charge: "5000")
index = 1
20.times do
  StoreMember.create!(calendar_id: 1, name:"test#{index}", email:"test#{index}@email.com", phone:"0000000000#{index}", is_allow_notice: true)
  index += 1
end

Plan.create!(title: "パーソナルプラン(トライアル)", plan_id: "5000T30D1", charge: 5000, description: "30日のトライアルプランです。３0日後に課金されます。", trial_days: 30, billing_day: 1)
Plan.create!(title: "プロプラン(トライアル)", plan_id: "10000T30D1", charge: 10000, description: "30日のトライアルプランです。３0日後に課金されます。", trial_days: 30, billing_day: 1)
Plan.create!(title: "パーソナルプラン", plan_id: "5000D1", charge: 5000, description: "30日のトライアルプランです。３0日後に課金されます。", billing_day: 1)
Plan.create!(title: "プロプラン", plan_id: "10000D1", charge: 10000, description: "30日のトライアルプランです。３0日後に課金されます。", billing_day: 1)
Plan.create!(title: "スペシャルプラン", plan_id: "special", charge: 0, description: "期限なしの無料プラン。")

User.create!(name: "sample1", email: "sample1@email.com", line_token: nil, client_id: nil, client_secret: nil, google_api_token: {}, member_id: nil, password: "password", password_confirmation:"password")
User.create!(name: "sample2", email: "sample2@email.com", line_token: nil, client_id: nil, client_secret: nil, google_api_token: {}, member_id: nil, password: "password", password_confirmation:"password")
Calendar.create!(calendar_name: "sample1の店舗", start_date: 1, end_date: 7, display_week_term: 3, start_time: 9, end_time: 18, is_released: true, display_time: 5, user_id: 2, calendar_id: nil, address: "京都府京都市中京区", phone: "09012345678", public_uid: "fe525971", display_interval_time: 10, picture: nil, message: nil)
Calendar.create!(calendar_name: "sample2の店舗", start_date: 1, end_date: 7, display_week_term: 3, start_time: 9, end_time: 18, is_released: true, display_time: 5, user_id: 3, calendar_id: nil, address: "京都府京都市中京区", phone: "09012345678", public_uid: "8285c85d", display_interval_time: 10, picture: nil, message: nil)
Staff.create!(name: "sample1", deleted_at: nil, calendar_id: 2, description: nil, email: "sample1@email.com", line_user_id: nil, client_secret: nil, client_id: nil, google_api_token: nil, google_calendar_id: nil, refresh_token: nil, picture: nil, password: "password", password_confirmation:"password")
Staff.create!(name: "sample2", deleted_at: nil, calendar_id: 3, description: nil, email: "sample2@email.com", line_user_id: nil, client_secret: nil, client_id: nil, google_api_token: nil, google_calendar_id: nil, refresh_token: nil, picture: nil, password: "password", password_confirmation:"password")
TaskCourse.create!(title: "プラン１", description: "肩こり改善", course_time: 60, calendar_id: 2, charge: "10000", is_tax_included: true, is_more_than: false, picture: nil)
TaskCourse.create!(title: "プラン１", description: "肩たたき", course_time: 60, calendar_id: 3)