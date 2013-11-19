#!/bin/env ruby
# encoding: utf-8

class UserMailer < ActionMailer::Base
  default from: 'info@gobiernoabierto.gob.sv',
          to: 'info@gobiernoabierto.gob.sv',
          bcc: 'log@gobiernoabierto.gob.sv'

  def new_contact_message(contact_message)
    @contact_message = contact_message

    message_info = {
      reply_to: contact_message.email,
      subject: 'Nuevo mensaje enviado a través de El Salvador Adelante'
    }
    if Rails.env.development?
      message_info[:to] = 'henry@gobiernoabierto.gob.sv'
    end
    mail message_info
  end
end
