# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

###*
Подгружает в элемент c id = result_id код документа url
@param {string} result_id контейнера, в который загружаем
@param {string} url адрес документа, который загружаем
###
AjaxRequest = (result_id,url) ->
  url:     url
  type:     "POST"
  dataType: "html"
  error: ->
  alert("Ошибка соединения");
  success:  ( response ) ->
  document.getElementById(result_id).innerHTML = response
  return         

$(document).ready ->
 
  $(document).scroll ->
  if $(document).scrollTop() > 150  $('#anchor-button').show(100)
  else $('#anchor-button').hide()
  return

  $('li').click ->
    url = '../html/' + $(this).children('a').text().toLowerCase().trim()+'.html',
    result_id = 'main-content-actually';
    alert(url);
  if  url is '../html/about us.html'  
    $( '#main-content-wrapper' ).width'100%'
    $('#slider-container').show() 
  else 
    $( '#main-content-wrapper').width( '' )
    $('#slider-container').hide()
    AjaxRequest result_id, url 
    return
  
  $('main-content-wrapper').width '100%' ;
  AjaxRequest('main-content-actually','../html/about us.html');
  return