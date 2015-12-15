class ConnectToBank

  def self.connect_privat
    if ( currency = Faraday.get("https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5") ).status == 200
      JSON.parse(currency.body)
    else
      "unknown"
    end
  end

  def self.connect_nbu
    if ( currency = Faraday.get("https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=3") ).status == 200
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