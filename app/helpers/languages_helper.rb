# frozen_string_literal: true

# :nodoc
module LanguagesHelper
  def language_name
    Language.pluck(:name, :value)
  end
end
