defmodule HgWeb.DifficultyHTML do
  use HgWeb, :html

  embed_templates "difficulty_html/*"

  @doc """
  Renders a difficulty form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def difficulty_form(assigns)
end
