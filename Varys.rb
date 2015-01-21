class Varys

  def say_my_name!
    "I am Varys, and I'm here to say what you want to hear."
  end

  def say_cersei_rocks!
    "Cersei rocks!"
  end

  def say_joffrey_rocks!
    "Joffrey rocks!"
  end

  def backwards_wording(inp)

    inp.map { |el| el.reverse if el.length >= 5 }.compact

  end

  def friday_numbers(inp)
        
    inp.select { |el| el if (Time.now.friday? && el < 0) || (!Time.now.friday? && el >= 0) }

  end
end