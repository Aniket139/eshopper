%h1 Fill Customer all blank filed 
-@customer.attributes.each |key, value|
  -next if @avoid_fields == key || value.present?
    %p "#{key}"
  