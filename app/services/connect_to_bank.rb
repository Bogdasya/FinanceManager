class ConnectToBank

  def self.currency_from_privat
    if ( currency = connect_to_privat_bank ).status == 200
      JSON.parse(currency.body)
    else
      "unknown"
    end
  end


  def self.currency_from_from_nbu
    if ( currency = connect_to_nbu ).status == 200
      unless ExchangeRate.where(date: Date.today).exists?
        save_to_exchange_rate(currency)
      end
      JSON.parse(currency.body)
    else
      "unknown"
    end
  end

  private
  def self.connect_to_privat_bank
    Faraday.get("#{Rails.application.secrets.privat_bank}")
  end

  def self.connect_to_nbu
    Faraday.get("#{Rails.application.secrets.national_bank}")
  end

  def self.save_to_exchange_rate(currency)
    eur = JSON.parse(currency.body)[0]["buy"].to_d
    usd = JSON.parse(currency.body)[2]["buy"].to_d
    ExchangeRate.create(usd: usd, eur: eur, date: Date.today)
  end

end