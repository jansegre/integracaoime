require 'i18n'
#debug_i18n = false
debug_i18n = true

if (Rails.env.development? || Rails.env.test?) && debug_i18n
  module I18n
    class << self
      def translate_with_debug(*args)
        translation = translate_without_debug(*args)
        Rails.logger.debug "  I18N: #{translation}  #{args.map{ |a| a.inspect }.join(", ")}"
        translation
      end
      alias_method_chain :translate, :debug
    end
  end
end
