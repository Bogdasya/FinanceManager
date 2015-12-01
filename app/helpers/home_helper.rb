module HomeHelper

  def get_current_currency_privat
    if ( currency = Faraday.get('https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5') ).status == 200
      JSON.parse(currency.body)[2]
    else
      "unknown"
    end
  end

  def get_current_currency_nbu
    if ( currency = Faraday.get('https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=3') ).status == 200
      JSON.parse(currency.body)[2]
    else
      "unknown"
    end
  end

end
