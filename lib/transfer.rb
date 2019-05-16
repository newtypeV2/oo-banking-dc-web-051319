class Transfer

    @@all_accounts

    attr_accessor  :status, :amount
    attr_reader :amount,:sender, :receiver

      def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = "pending"
      end

      def valid?
        sender.valid? && receiver.valid? && sender.balance >= @amount && @status == "pending"
      end

      def execute_transaction
        # binding.pry
        if self.valid?
          @status = "complete"
          sender.balance-=@amount
          receiver.balance+=@amount
        else
          @status = "rejected"
          "Transaction rejected. Please check your account balance."
        end
      end

      def reverse_transfer
        if @status == "complete"
          receiver.balance-=@amount
          sender.balance+=@amount
          @status = "reversed"
        end
      end

end
