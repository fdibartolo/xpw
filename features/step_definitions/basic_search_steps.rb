
When(/^I browse the job list$/) do
	visit '/job_offers/latest'
end

When(/^I search for "(.*?)"$/) do |text|
  fill_in('text_search', :with => text)
  click_button('search')
end

Then(/^logout$/) do
	visit('/logout')
end
