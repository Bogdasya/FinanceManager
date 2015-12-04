module HomeHelper
  include HomeService

  def get_current_currency_privat
    connect_privat('https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5')
  end

  def get_current_currency_nbu
    connect_nbu('https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=3')
  end

  def format_currency(number)
    number_to_currency(number.to_f, unit: "грн")
  end

  def group_by_date
    hash = {}
    ExchangeRate.pluck(:usd, :date).each do |data|
     hash.merge!(Hash[*data])
    end
    hash.invert
  end

end
