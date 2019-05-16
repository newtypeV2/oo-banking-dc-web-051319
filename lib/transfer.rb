class Transfer

    attr_accessor  :status
    attr_reader :amount,:sender,:receiver, :amount

      def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = "pending"
      end

      def valid?
        (sender.valid? && receiver.valid?) && (sender.balance >= self.amount) && (self.status == "pending")
      end

      def execute_transaction
        if self.valid?
          self.status = "complete"
          sender.balance-=self.amount
          receiver.balance+=self.amount
        else
          self.status = "rejected"
          "Transaction rejected. Please check your account balance."
        end
      end

      def reverse_transfer
        if self.status == "complete"
          receiver.balance-=self.amount
          sender.balance+=self.amount
          self.status = "reversed"
        end
      end

end
