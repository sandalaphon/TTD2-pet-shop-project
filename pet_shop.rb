def pet_shop_name(imported_hash)
  imported_hash[:name]
end


def total_cash(imported_hash)
 puts imported_hash[:admin][:total_cash]
 return imported_hash[:admin][:total_cash]
 
end

def add_or_remove_cash(imported_hash, amount)
  imported_hash[:admin][:total_cash]+=amount
end

# commenting out an identical method/function
# def add_or_remove_cash(imported_hash,amount)
#   imported_hash[:admin][:total_cash]+=amount
# end

def pets_sold(imported_hash)
  imported_hash[:admin][:pets_sold]
end

def increase_pets_sold(imported_hash,number)
  imported_hash[:admin][:pets_sold]+=number
end

def stock_count(imported_hash)
 imported_hash[:pets].length
end

def pets_by_breed(imported_hash, breed_searched)
  array_to_return = []
  array_of_hash_of_pets= imported_hash[:pets]

  for hash in array_of_hash_of_pets
    if hash[:breed]==breed_searched
      array_to_return.push(hash[:breed])
    end 
  end
  puts array_to_return
  return array_to_return
end

def find_pet_by_name(imported_hash, pet_name)

  for pet in imported_hash[:pets]

   return pet if pet[:name]==pet_name
   
 end
 return nil

end

# have a break!

 def remove_pet_by_name(imported_hash,pet_name)

  hash_to_delete=find_pet_by_name(imported_hash,pet_name)

  array_of_hashes_to_adjust = imported_hash[:pets]

  array_of_hashes_to_adjust = array_of_hashes_to_adjust - [hash_to_delete]


  return imported_hash[:pets]=array_of_hashes_to_adjust


  end

def add_pet_to_stock(imported_hash, new_pet_hash)
imported_hash[:pets].push(new_pet_hash)
end

def customer_pet_count(customer_hash)
  customer_hash[:pets].length
end

def add_pet_to_customer(customer_hash, new_pet_hash)

  customer_hash[:pets]=[new_pet_hash]

  end


  def customer_can_afford_pet(customer_hash, new_pet_hash)
    if customer_hash[:cash]>=new_pet_hash[:price]
      return true
    end
    return false

  end

  def sell_pet_to_customer(imported_hash, pet_hash, customer_hash)
    #customer_can_afford_pet?
    #in admin: add to pets_sold and total cash
    #take cash from customer
    #remove pet from pets, add pet to customer
    #is pet available?

    for pet in imported_hash[:pets]

     if pet==pet_hash

      if customer_can_afford_pet(customer_hash,pet_hash)==true 
      #here we add and subract funds
      amount=pet_hash[:price]
      add_or_remove_cash(imported_hash ,amount)
      customer_hash[:cash]-=amount
      #here we add to pet sold
      imported_hash[:admin][:pets_sold]+=1
      #here we remove pet from pets
      remove_pet_by_name(imported_hash, pet_hash[:name])
      #here we add pet to customer, what if customer already has a pet? does the method work?
      add_pet_to_customer(customer_hash,pet_hash)

    end

    #returning false if cant afford
    return false
  
  end


end
end