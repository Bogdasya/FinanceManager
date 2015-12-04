module HomeService

  def connect_privat(params)
    if ( currency = Faraday.get(params) ).status == 200
      JSON.parse(currency.body)
    else
      "unknown"
    end
  end

  def connect_nbu(params)
    if ( currency = Faraday.get(params) ).status == 200
      unless ExchangeRate.where(date: Date.today).exists?
        eur = JSON.parse(currency.body)[0]["buy"].to_d
        usd = JSON.parse(currency.body)[2]["buy"].to_d
        ExchangeRate.create(usd: usd, eur: eur, date: Date.today)
      end
      JSON.parse(currency.body)
    else
      "unknown"
    end
  end

end