class CashRegister
    attr_accessor :discount, :total, :items
  
    def initialize(discount = 0)
      @discount = discount
      @total = 0
      @items = []
      @last_transaction = 0
    end
  
    def add_item(title, price, quantity = 1)
      @last_transaction = price * quantity
      @total += @last_transaction
      quantity.times { @items << title }
    end
  
    def apply_discount
      if discount > 0
        discount_total = @total * @discount / 100
        @total -= discount_total
        "After the discount, the total comes to $#{@total}."
      else
        "There is no discount to apply."
      end
    end
  
    def items
      @items
    end
  
    def void_last_transaction
      @total -= @last_transaction
      @last_transaction = 0
    end
  end
  