# class CashRegister
#     attr_accessor :total, :discount, :items

#     def initialize(discount = 0)
#         @total = 0
#         @discount = discount
#         @items = []
#     end

#     def add_item(title, price, quantity = 1)
#         self.total += price * quantity
#         quantity.times { self.items << title }
#     end   

#     def apply_discount
#       if discount > 0
#          discount_amount = (total * discount.to_f / 100).to_i
#           self.total -= discount_amount
#           "After the discount, the total comes to $#{total}."
#         else
#           "There is no discount to apply."
#         end
#     end

#     def void_last_transaction
#         last_item_price = total
#         self.total -= last_item_price
#     end
      
    
#     # def void_last_transaction
#     #     last_item_price = @total - @items.pop
#     #     @total -= last_item_price
#     #   end
      
# end
class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = {}
    end
  
    def add_item(title, price, quantity = 1)
      item = { title: title, price: price, quantity: quantity }
      self.total += price * quantity
      self.items.concat([title] * quantity)
      self.last_transaction = item
    end
  
    def apply_discount
      if discount > 0
        discount_amount = (total * discount.to_f / 100).to_i
        self.total -= discount_amount
        "After the discount, the total comes to $#{total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      self.total -= last_transaction[:price] * last_transaction[:quantity]
      self.items.pop(last_transaction[:quantity])
      self.last_transaction = {}
    end
  end
  