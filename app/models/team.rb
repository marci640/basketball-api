class Team < ApplicationRecord

  def count_em(string, substring)
    return string.scan(/^[substring]+$/).count
    
  end

  def update_first_round(big_string)
    if first_four == true
      if count_em(big_string,college_name) >=1
        return true
      end
    end
  end

  def update_second_round(big_string)
    if first_round == true
      if count_em(big_string,college_name) >= 2 
        return true
      end
    end
  end

  def update_regional_semifinals(big_string)
    if second_round == true
      if count_em(big_string,college_name) >= 3 
        return true
      end
    end
  end

  def update_regional_finals(big_string)
    if regional_semifinals == true
      if count_em(big_string,college_name) >= 4 
        return true
      end
    end
  end

  def update_final_four(big_string)
    if regional_finals == true
      if count_em(big_string,college_name) >= 5 
        return true
      end
    end
  end

  def update_national_championship(big_string)
    if final_four == true
      if count_em(big_string,college_name) >= 6 
        return true
      end
    end
  end

  def update_winner(big_string)
    if national_championship == true
      if count_em(big_string,college_name) >= 7 
        return true
      end
    end
  end

end
