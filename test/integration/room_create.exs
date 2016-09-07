defmodule ElixirWorkshopApp.RoomCreate do
  use ElixirWorkshopApp.IntegrationCase

  @tag :integration
  test "Create new room" do
    email = "john@example.com"
    room_name = "new chat room"

    navigate_to "/"

    user_sign_up(%{email: email, password: "password"})

    find_element(:id, "new-room")
    |> click

    assert page_source =~ "New room"

    room_form = find_element(:id, "new-room-form")
    room_form
    |> find_within_element(:id, "room_name")
    |> fill_field(room_name)

    submit_element(room_form)

    assert element_displayed?({:css, "table"})
    assert page_source =~ "#{room_name} - admin: #{email}"
  end
end