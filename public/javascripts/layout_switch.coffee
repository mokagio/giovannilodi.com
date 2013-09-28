
hackLayout = (hacked) ->
  # switch the light off
  $('body').addClass 'lights-off'

  changeImage = () ->
    $('img#face_boring').hide()
    $('img#face_hacked').show()

  turnLightsOn = () ->
    $('body').removeClass 'lights-off'
    $('body').addClass 'hacked'
    
  d1 = 1500
  d2 = 2000
  setTimeout changeImage, d1
  setTimeout turnLightsOn, d1 + d2 
    
  

$ ->
  setTimeout hackLayout, 2000


