module LocalesI18n
  def self.included(clazz)
    clazz.class_eval do
      before_action :set_locale
    end
  end

  private

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    user_locale = current_user ? current_user.locale : :en
    I18n.available_locales.map(&:to_s).include?(user_locale) ? user_locale : nil
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
