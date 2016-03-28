Given /^the following movies exist:$/ do |movies_table|
  movies_table.hashes.each do |movie|
      Movie.create!(movie)
  end
end

Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |title, director|
  #debugger
    #page.body.match(/.*#{title}.*#{director}/)
  #/.*#{title}.*#{director}/.match(page.body)
  
  expect(page.body).to match(/.*#{title}.*#{director}/m) 
  #pending # Write code here that turns the phrase above into concrete actions
end
