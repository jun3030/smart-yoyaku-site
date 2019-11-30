# require 'payjp'
class MyPayjp

  def self.create_token(number, cvc, exp_month, exp_year)
    Payjp::api_key = ENV['PAYJP_PUBLIC_KEY']
    token = Payjp::Token.create(
      card: {
        number:    number,
        cvc:       cvc,
        exp_year:  exp_year,
        exp_month: exp_month,
      }
    )
    return token.id
  end

  def self.create_charge_by_token(token, amount)
    Payjp::api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount:   amount,
      card:     token,
      currency: 'jpy'
    )
  end

  #
  # 顧客を登録する
  #
  def self.create_customer(token, user)
    Payjp::api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Customer.create(
      card: token,
      email: user.email,
      description: user.email
    )
  end

  #
  # 顧客を用いて支払いを作成する
  #
  def self.create_charge_by_customer(customer, amount)
    Payjp::api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount:   amount,
      customer: customer,
      currency: 'jpy'
    )
  end

  #
  # プランを作成する
  #
  def self.create_plan(amount, interval = 'month')
    Payjp::api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Plan.create(
      amount:   amount,
      interval: interval,
      currency: 'jpy'
    )
  end

  #
  # 定額課金を作成する
  #
  def self.create_subscription(customer, plan)
    Payjp::api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Subscription.create(
      customer: customer,
      plan:     plan,
    )
  end

  # 定期課金の削除（解約）
  def self.destroy_subscription(order)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    subscription = Payjp::Subscription.retrieve(order.order_id)
    subscription.delete
  end

end