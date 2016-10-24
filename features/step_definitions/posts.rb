Given(/^I am a guest user$/) do
end

When(/^I go to the index page$/) do
  visit(posts_path)
end

Then(/^I must see footer$/) do
  expect(page).to have_content('Copyright 2016. Klika d.o.o. Sarajevo. All Rights Reserved.')
end

When(/^I go to the post page$/) do
  visit(post_path(@post.id))
end

Given(/^there are posts$/) do
  @post_definition = FactoryGirl.create(:post_definition)
  @post_field = FactoryGirl.create(:post_field)
  @field = FactoryGirl.create(:field, value: 'First blog')
  @post = FactoryGirl.create(:post)
end

Then(/^I must see posts conten$/) do
  expect(page).to have_content('First blog')
end