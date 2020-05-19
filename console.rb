require ('pry')
require_relative('models/property.rb')

property1 = Property.new({
  'address' => '12 Buchanan Drive',
  'value'=> 100000,
  'number_of_bedrooms'=> 3,
  'buy_let_status' => 'buy'
  })

property2 = Property.new({
  'address' => '267 Crow Road',
  'value'=> 123456,
  'number_of_bedrooms'=> 2,
  'buy_let_status' => 'let'})

property2 = Property.new({
  'address' => '36 Oransay Crescent',
  'value'=> 246810,
  'number_of_bedrooms'=> 4,
  'buy_let_status' => 'buy'})

binding.pry

property1.save()
property2.save()
