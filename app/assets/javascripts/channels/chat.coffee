App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    console.log 'connected'
    $('#chat_message').on 'keyup', (e) =>
      if e.which == 13
        @speak({message: e.target.value})
        e.target.value = ""

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    $('#chat ul').append($("<li></li>").text(data.message))

  speak: (data) ->
    @perform 'speak', data
