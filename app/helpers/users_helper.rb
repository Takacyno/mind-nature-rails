module UsersHelper
    def generate_addiction_string(addiction)
        result = ""    
        addiction.each do |index|
          result += I18n.t("addiction.#{index}") + " "
        end
        return result
      end
end
