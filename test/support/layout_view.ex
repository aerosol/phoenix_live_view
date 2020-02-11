defmodule Phoenix.LiveViewTest.LayoutView do
  use Phoenix.View, root: ""
  import Phoenix.LiveView.Helpers

  def render("app.html", assigns) do
    # Assert those assigns are always available
    _ = assigns.live_view_module
    _ = assigns.live_view_action

    ["LAYOUT", render(assigns.view_module, assigns.view_template, assigns)]
  end

  def render("live.html", assigns) do
    ~L"""
    LIVELAYOUTSTART-<%= @val %>-<%= @live_view_module.render(assigns) %>-LIVELAYOUTEND
    """
  end

  def render("live-override.html", assigns) do
    ~L"""
    LIVEOVERRIDESTART-<%= @val %>-<%= @live_view_module.render(assigns) %>-LIVEOVERRIDEEND
    """
  end

  def render("widget.html", assigns) do
    ~L"""
    WIDGET:<%= live_render(@conn, Phoenix.LiveViewTest.ClockLive) %>
    """
  end
end

defmodule Phoenix.LiveViewTest.AssignsLayoutView do
  use Phoenix.View, root: ""

  def render("app.html", assigns) do
    ["title: #{assigns.title}", render(assigns.view_module, assigns.view_template, assigns)]
  end
end
