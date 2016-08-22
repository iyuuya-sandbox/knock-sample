# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: odhttp://coffeescript.org/

$(document).ready ->
  $('#auth').on 'click', ->
    $.ajax(
      type: 'POST',
      url: '/user_token',
      data: { auth: { email: $('#auth_email').val(), password: $('#auth_password').val() } },
      dataType: 'json'
      success: (data) ->
        token = data.jwt
        $('.debug_container').text "token: #{token}"
      error: (data) ->
        message = "#{data.status}: #{data.statusText}"
        $('.debug_container').text message
    )

  $('#api').on 'click', ->
    $.ajax(
      type: 'GET',
      url: '/debug/api',
      headers: { 'Authorization': "Bearer #{$('#api_token').val()}" }
      success: (data) ->
        $('.debug_container').text data.message
      error: (data) ->
        message = "#{data.status}: #{data.statusText}"
        $('.debug_container').text message
    )
