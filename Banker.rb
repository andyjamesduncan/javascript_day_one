class Banker

  TO_EURO = {
    usd: 0.77818,
    gbp: 1.27341,
    cad: 0.70518,
    aud: 0.69052,
    eur: 1.0
  }

  FROM_EURO = {
    usd: 1.28356,
    gbp: 0.78478,
    cad: 1.41613,
    aud: 1.44651,
    eur: 1.0
  }

  def self.convert(amount, from_currency, to_currency)
    
    # Get to Euros

    euros = amount * TO_EURO[ from_currency.to_sym ]

    # Convert to target

    target = euros * FROM_EURO[ to_currency.to_sym ]

    return target.round(3)

  end
end
