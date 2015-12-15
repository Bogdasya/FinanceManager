module HomeHelper

  def get_current_currency_privat
    ConnectToBank.connect_privat
  end

  def get_current_currency_nbu
    ConnectToBank.connect_nbu
  end

  def format_currency(number)
    number_to_currency(number.to_f, unit: "грн")
  end

  def group_by_date
    Hash[ExchangeRate.pluck(:date, :usd)]
  end

end
