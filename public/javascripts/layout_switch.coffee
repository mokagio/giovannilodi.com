
CHARS = ['1', '0', 'z', 'G', 'y', 'x', '$', '*', '_', '`']
madnessActive = true

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

hackLayout = (hacked) ->

  changeFace = () ->
    $('img#face_boring').hide()
    $('img#face_hacked').show()

  turnLightsOff = () ->
    $('body').addClass 'lights-off'

  turnLightsOn = () ->
    $('body').removeClass 'lights-off'
    $('body').addClass 'hacked'
  
  lettersMadness()
  lettersMadnessLooped()

  turnTheMadnessOff = () ->
    madnessActive = false
    $('h1, h2, h3, li').each () ->
      original = $(this).attr 'data-original'
      $(this).html original

  d1 = 2500
  d2 = 2000
  setTimeout changeFace, d1
  setTimeout turnLightsOff, d1
  setTimeout turnTheMadnessOff, d1 + d2
  setTimeout turnLightsOn, d1 + d2


$ ->
  setTimeout hackLayout, 3000
