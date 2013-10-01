
CHARS = ['1', '0', 'z', 'G', 'y', 'x', '$', '*', '_', '`']
madnessActive = true
boring = true

strByReplacingCharWith = (str, index, char) ->
  str.substr(0, index) + char + str.substr(index + char.length)  

# See http://stackoverflow.com/questions/1527803/generating-random-numbers-in-javascript-in-a-specific-range
getRandomInt = (max) ->
  Math.floor(Math.random() *  max)

getRandom = (array) ->
  idx = getRandomInt array.length
  array[idx]

lettersMadness = () ->
  $('h1, h2, h3, li').each () ->
    current = $(this).html()

    original = $(this).attr 'data-original'
    if not original
      $(this).attr 'data-original', current

    if current
      $(this).html strByReplacingCharWith current, getRandomInt(current.length), getRandom(CHARS)

lettersMadnessLooped = () ->
  looped = () ->
    if madnessActive
      lettersMadness()
      lettersMadnessLooped()
  setTimeout looped, 100

hackedLayout = () ->

  changeFace = () ->
    $('img#face_boring').fadeOut(1000)
    $('img#face_hacked').fadeIn(1000)

  turnLightsOff = () ->
    $('body').addClass 'lights-off'

  turnLightsOn = () ->
    $('body').removeClass 'lights-off'
    $('body').addClass 'hacked'

    $('#switch').html($('#switch').attr 'data-hacked')


  turnTheMadnessOff = () ->
    madnessActive = false
    $('h1, h2, h3, li').each () ->
      original = $(this).attr 'data-original'
      $(this).html original

  d1 = 0
  d2 = 2000
  
  setTimeout changeFace, d1
  setTimeout turnLightsOff, d1
  # setTimeout turnTheMadnessOff, d1 + d2
  setTimeout turnLightsOn, d1 + d2

  boring = false

boringLayout = () ->

  stepOne = () ->
    $('body').addClass('lights-off')

  stepTwo = () ->
    $('body').removeClass('lights-off')
    $('body').removeClass('hacked')
    $('body').addClass('boring')
    $('img#face_boring').fadeIn(1000)
    $('img#face_hacked').fadeOut(1000)

    $('#switch').html($('#switch').attr('data-boring'))

  stepOne()
  setTimeout stepTwo, 2000

  boring = true

  
switchLayout = () ->
  if boring
    hackedLayout()
  else
    boringLayout()

$ ->
  setTimeout hackedLayout, 3000

  $('#switch').on 'click', () ->
    switchLayout()
