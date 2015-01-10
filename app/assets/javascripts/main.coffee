###*
Подгружает в элемент c id = result_id код документа url
@param {string} result_id контейнера, в который загружаем
@param {string} url адрес документа, который загружаем
###


AjaxRequest = (result_id, url) ->
  jQuery.ajax
    url: url
    type: "POST"
    dataType: "html"
    error: ->
      alert "Ошибка соединения"
      return
    success: (response) ->
      document.getElementById(result_id).innerHTML = response
      return

  return
$(document).ready ->
  $(document).scroll ->
    if $(document).scrollTop() > 150
      $("#anchor-button").show 100
    else
      $("#anchor-button").hide()
    return
#../html
  $("li").click ->
    url =  $(this).children("a").text().toLowerCase().trim() + ".html"
    result_id = "main-content-actually"
    alert url
    if url is "../html/about_us.html"
      $("#main-content-wrapper").width "100%"
      $("#slider-container").show()
    else
      $("#main-content-wrapper").width ""
      $("#slider-container").hide()
    AjaxRequest result_id, url
    return

  $("main-content-wrapper").width "100%"
  AjaxRequest "main-content-actually", "../html/about us.html"
  return
