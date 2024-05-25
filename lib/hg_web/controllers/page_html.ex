defmodule HgWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """

  use Phoenix.LiveView
  import HgWeb.Components.BentoGrid

  use HgWeb, :html

  embed_templates "page_html/*"
end
