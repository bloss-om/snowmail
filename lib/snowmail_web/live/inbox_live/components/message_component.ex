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
              <span>Contract amendment</span>
          </h3>
          <p class="text-sm font-thin break-all">Lorem ipsum, dolor sit amet consectetur consectetur  adipisicing elit ...</p>
      </div>
      <div class="_meta flex-shrink-0 flex items-center">
          <span>2:32pm</span>
      </div>
    </div>
    """
  end
end
