defmodule HgWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use HgWeb, :controller` and
  `use HgWeb, :live_view`.
  """
  use HgWeb, :html

  embed_templates "layouts/*"
end
