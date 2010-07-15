module SendGrid

  def self.included(base)
    base.class_eval do
      alias_method_chain :create_mail, :send_grid
    end
  end

  protected
  def create_mail_with_send_grid()
    create_mail_without_send_grid
    hdr = SmtpApiHeader.new
    hdr.addTo(@mail.to)
    @mail["X-SMTPAPI"] = hdr.asJSON
    @mail
  end
end