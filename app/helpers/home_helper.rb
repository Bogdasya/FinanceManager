module HomeHelper

  def get_current_currency_privat
    ConnectToBank.currency_from_privat
  end

  def get_current_currency_nbu
    ConnectToBank.currency_from_from_nbu
  end

  def format_currency(number)
    number_to_currency(number.to_f, unit: "грн")
  end

  def group_by_date
    Hash[ExchangeRate.pluck(:date, :usd)]
  end

end
