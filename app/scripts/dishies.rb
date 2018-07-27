class Dishies

  def dishies_values(input)
    dish_values = input.downcase.gsub(" ","").split(',')
    if (dish_values.include?('morning') && dish_values.include?("night"))
      puts "Sua entrada deve conter apenas 1 periodo"
      return "Sua entrada deve conter apenas 1 periodo"  
    elsif dish_values.include?('morning')
      dish_values.delete('morning')
      puts transform_to_dishies(dish_values, 'morning')
      transform_to_dishies(dish_values, 'morning')
    elsif dish_values.include?('night')
      dish_values.delete('night')
      puts transform_to_dishies(dish_values, 'night')
      transform_to_dishies(dish_values, 'night')
    else
      puts "invalid input period"
      "invalid input period"
    end
  end

  def validation_input(dishies, period)
    begin
      if period == "morning"
        dishies.each{|key,value| raise "existe mais que 1 prato igual, somente coffee (3) pode ter mais que 1" if (key != "3" && value.count > 1)}
      else
        dishies.each{|key,value| raise "existe mais que 1 prato ou bebida igual, somente potato (2) pode ter mais que 1" if (key != "2" && value.count > 1)}
      end
    rescue Exception => ex
       "Houve um erro: " + ex.message
    end
  end

  def transform_to_dishies(dishies, period)
    hash_numbers = {}
    dishies.each_with_index do |value, index|
      (hash_numbers[value] ||= []) << index
    end
    validation = validation_input(hash_numbers, period)
    return validation if validation.include?("Houve um erro")
    number_to_dish(hash_numbers.sort.to_h, period).join(",")
  end

  def number_to_dish(hash_numbers, period)
    array_dishies = []
    hash_numbers.each do |key,value|
      array_dishies << count_dishies(key,value, period)
    end
    array_dishies
  end

  def count_dishies(key, value, period)
    if period == "morning"
      return transform_to_dish_morning(key) + "(x#{value.count})" if (value.count > 1 && key == "3")
      transform_to_dish_morning(key)
    else
      return transform_to_dish_night(key) + "(x#{value.count})" if (value.count > 1 && key == "2")
      transform_to_dish_night(key)
    end
  end

  def transform_to_dish_morning(key)
    case key
    when "1"
      "eggs"
    when "2"
      "toast"
    when "3"
      "coffee"
    else
      "error"
    end
  end

  def transform_to_dish_night(key)
    case key
    when "1"
      "steak"
    when "2"
      "potato"
    when "3"
      "wine"
    when "4"
      "cake"
    else
      "error"
    end
  end

end