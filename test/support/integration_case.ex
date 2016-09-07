defmodule ElixirWorkshopApp.IntegrationCase do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  using do
    quote do
      use Hound.Helpers
      import ElixirWorkshopApp.IntegrationCase

      hound_session
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(ElixirWorkshopApp.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(ElixirWorkshopApp.Repo, {:shared, self()})
    end

    :ok
   end

  def user_sign_up(%{email: email, password: password}) do
    navigate_to "/registrations/new"

    sign_up_form = find_element(:css, "form")

    sign_up_form
    |> find_within_element(:id, "user_email")
    |> fill_field(email)

    sign_up_form
    |> find_within_element(:id, "user_password")
    |> fill_field(password)

    submit_element(sign_up_form)
  end
end
