class CashRegister
attr_accessor :total, :discount, :last_transaction

def  initialize (discount=0)
  @total = 0
  @discount = discount
  @items=[]
end

def add_item(item,price,quantity=1)
    item_info = {}
   item_info[:name] = item
   item_info[:price] = price
   item_info[:quantity] = quantity

  @items<<item_info
  @total+=price*quantity
  self.last_transaction = price * quantity
end

def apply_discount
  if @discount==0
    return "There is no discount to apply."
  end
  @total -= @total * @discount/100
  return "After the discount, the total comes to $#{total}."
end

def items
    item_names = []
    @items.each do | item_info |
      #test expects product name * quantity...
      for qty in 1..item_info[:quantity]
        item_names << item_info[:name]
      end
    end
    item_names
  end

  def void_last_transaction
     self.total = self.total - self.last_transaction
   end
end
