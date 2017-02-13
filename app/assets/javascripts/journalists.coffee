class Journalists
  constructor: ->
    @add()
    @happend_message()

  add: ->
    obj = @
    $('#new-journalist form').submit (e) ->
      e.preventDefault()
      name = $('#journalist_name').val()
      media = $('#journalist_media').val()
      id = $('#new-journalist #id').text()
      url = obj.is_new_journalist() ? "/journalists" : "/journalist/"+id
      type = obj.is_new_journalist() ? 'POST' : 'PUT'
      $.ajax "/journalists",
        type: type,
        dataType: 'script',
        data: { name: name, media: media }
        error: (jqXHR, textStatus, errorThrown) ->
          console.log("AJAX Error: #{textStatus}")

  is_new_journalist: ->
    $('#new-journalist #action').text()=="new"

  happend_message: ->
    message = $(".flash.alert")
    if message.is(":visible")
      message.fadeIn("slow").delay(3000).fadeOut("slow")

ready = ->
    new Journalists()

$(document).on('ready',ready)
$(document).on('page:load',ready)


