
hackLayout = (hacked) ->
  $('img#face_boring').hide()
  $('img#face_hacked').show()

  turnLightsOff = () ->
    $('body').addClass 'lights-off'

  turnLightsOn = () ->
    $('body').removeClass 'lights-off'
    $('body').addClass 'hacked'
    
  d1 = 1500
  d2 = 2000
  setTimeout turnLightsOff, d1
  setTimeout turnLightsOn, d1 + d2 
    

$ ->
  setTimeout hackLayout, 2000


