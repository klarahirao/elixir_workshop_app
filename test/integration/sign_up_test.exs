defmodule ElixirWorkshopApp.SignUpTest do
  use ElixirWorkshopApp.IntegrationCase

  @tag :integration
  test "Sign up new user" do
    navigate_to "/registrations/new"

    email = "john@example.com"
    user_sign_up(%{email: email, password: "password"})

    assert element_displayed?({:css, "table"})

    assert page_source =~ "#{email}"
    assert page_source =~ "Your account was created"
  end
end