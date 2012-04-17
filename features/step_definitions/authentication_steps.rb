# coding: utf-8
Given /^signinページを表示する$/ do
  visit signin_path
end

When /^signinボタンをクリックする$/ do
  click_button "Sign in"
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

Then /^signoutと表示されていること$/ do
  page.should have_link('Sign out', href: signout_path)
end
