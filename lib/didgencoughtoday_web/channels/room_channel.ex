defmodule DidgencoughtodayWeb.RoomChannel do
  use DidgencoughtodayWeb, :channel

  alias Didgencoughtoday.Counter

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("increment", %{"body" => body}, socket) do
    broadcast!(socket, "increment", %{body: body})
    {:noreply, socket}
  end
end
