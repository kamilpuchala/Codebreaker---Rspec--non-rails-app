class Outputt
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def outputt
  @outputt ||= Outputt.new
end

Given /^I am not yet playing$/ do
end

When /^I start a new game$/ do
  @messenger = StringIO.new
  game = Codebreaker::Game.new(@messenger)
  game.start('1234')
end

Then /^I should see "([^\"]*)" $/ do |message|
  @messenger.string.split("\n" ).should include(message)
end


Given(/^the secret code is "([^"]*)"$/) do |secret|
  @game = Codebreaker::Game.new(outputt)
  @game.start(secret)
end

When(/^I guess "([^"]*)"$/) do |guess|
  @game.guess(guess)
end

Then(/^the mark should be "([^"]*)"$/) do |mark|
  expect(outputt.messages).to include(mark)
end
