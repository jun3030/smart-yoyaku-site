namespace :task_reminder do
  desc 'リマインダー配信'
  task push: :environment do
    # 翌日のタスクを検索して、リマインド通知
    Task.only_valid.tomorrow_tasks.each do |task|
      member = task.store_member
      if member.line_user_id
        LineBot.new.push_message_with_reminder(task, member.line_user_id)
        puts "line送信（ユーザー:#{member.name}, タスクID:#{task.id}）"
      end
      puts 'メール送信完了' if NotificationMailer.send_remind_task_to_user(task, task.calendar.user, task.calendar).deliver
      puts Time.current
    end
  end

  desc 'リマインダー配信test'
  task test: :environment do
    LineBot.new.push_test("テストrakeタスク送信")
    puts 'テストrakeタスク送信'
    puts Time.current
  end
end
