begin
  require 'rspec/expectations'
rescue LoadError
  require 'spec/expectations'
end

require 'cucumber/formatter/unicode'
$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../../lib")
require 'calculator'

Before do
  @calc = Calculator.new
end

After do
end

Given(/Zadám číslo (\d+) do kalkulačky/) do |n|
  @calc.push n.to_i
end

When(/Stlačím tlačidlo (\w+)/) do |op|
  @result = @calc.send op
end

Then(/Výsledok by mal byť (.*)/) do |result|
  expect(@result).to eq(result.to_f)
end
