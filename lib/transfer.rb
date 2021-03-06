class Transfer
  
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
    self.receiver.balance += amount
    self.sender.balance -= amount
    self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      self.receiver.balance -= amount
      self.sender.balance += amount
      self.status = "reversed"
    end
  end


end
