# frozen_string_literal: true

# :nodoc
module LanguagesHelper
  def languages_name
    Language.pluck(:name, :value)
  end
end
