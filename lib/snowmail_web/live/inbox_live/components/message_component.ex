defmodule SnowmailWeb.InboxLive.Components.MessageComponent do
  use SnowmailWeb, :live_component

  def render(assigns) do
    ~H"""
    <div class="_message flex justify-between space-x-4 p-6
      bg-white bg-opacity-90 border-b border-accent border-opacity-10
      hover:cursor-pointer hover:bg-opacity-20">
      <div class="_info flex flex-col w-full">
          <h3 class="font-semibold relative flex items-center space-x-2">
              <span class="flex h-3 w-3">
                  <span class="relative animate-pulse inline-flex rounded-full h-3 w-3 bg-sky-500"></span>
              </span>
              <p class="truncat"><%= @message.subject %></p>
          </h3>
          <p class="text-sm font-thin break-all"><%= short_message(@message.content) %></p>
        </div>
        <div class="_meta flex-shrink-0 flex items-center text-sm">
          <time phx-hook="TimeAgo" datetime={@message.inserted_at} id={"time-#{@message.id}"}><%= time_ago(@message.inserted_at) %></time>
        </div>
    </div>
    """
  end

  def short_message(text) do
    String.slice(text, 0..50)
  end

  def time_ago(time) do
    Timex.from_now(time)
  end
end
