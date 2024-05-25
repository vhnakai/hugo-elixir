defmodule HgWeb.AppointmentHTML do
  use HgWeb, :html

  embed_templates("appointment_html/*")

  @doc """
  Renders a appointment form.
  """
  attr(:changeset, Ecto.Changeset, required: true)
  attr(:action, :string, required: true)

  def appointment_form(assigns)
end
