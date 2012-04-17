# coding: utf-8
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^"([^"]*)"ページを表示している$/ do |page_name|
  visit path_to("#{page_name}")
end

When /^"([^"]*)"ボタンをクリックする$/ do |button|
  click_button "#{button}"
end

Then /^エラーメッセージが表示されること$/ do
  page.should have_selector('div.alert.alert-error')
end

Given /^アカウントを取得している会員がいる$/ do
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
end

When /^signin情報を入力しsigninボタンをクリックする$/ do
  visit signin_path
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

Then /^その会員のプロフィールページが表示されていること$/ do
  page.should have_selector('title', text: @user.name)
end

Then /^"([^"]*)"と表示されていること$/ do |text|
  page.should have_link("#{text}")
end
