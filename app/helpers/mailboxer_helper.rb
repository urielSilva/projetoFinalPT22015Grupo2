module MailboxerHelper

  def unread_messages_count
    current_user.mailbox.inbox(:unread => true).count(:id, :distinct => true)
  end
  
end