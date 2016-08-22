# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: odhttp://coffeescript.org/

$(document).ready ->
  $('#debug').on 'click', ->
    $.ajax(
      type: 'POST',
      url: '/user_token',
      data: { auth: { email: $('#auth_email').val(), password: $('#auth_password').val() } },
      dataType: 'json'
      success: (data) ->
        token = data.jwt
        $('.debug_container').text "token: #{token}"
        $.ajax(
          type: 'GET',
          url: '/debug/api',
          headers: { 'Authorization': "Bearer #{token}" }
        ).done (data) ->
          console.log 'request result'
          console.log data
      error: (data) ->
        message = "#{data.status}: #{data.statusText}"
        $('.debug_container').text message
    )
