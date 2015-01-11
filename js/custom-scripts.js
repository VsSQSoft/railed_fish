/**
 * Created by Валерий on 25.12.2014.
 */

$(document).ready( function()
{

  $(document).scroll(function(){
  if($(document).scrollTop()> 150) $('#anchor-button').show(100);
  else $('#anchor-button').hide();
  });

$('li').click( function()
{
  var url = '../html/' + $(this).children('a').text().toLowerCase().trim()+'.html',
  result_id = 'main-content-actually';
    alert(url);
  if ( url === '../html/about us.html' ) {
    $( '#main-content-wrapper' ).width('100%'); $('#slider-container').show(); }
  else { $( '#main-content-wrapper').width( '' ); $('#slider-container').hide();}
  AjaxRequest(result_id, url);
 });
    /* init*/
  $('main-content-wrapper').width( '100%' );
  AjaxRequest('main-content-actually','../html/about us.html');
});


/**
 * Подгружает в элемент c id = result_id код документа url
 * @param {string} result_id контейнера, в который загружаем
 * @param {string} url адрес документа, который загружаем
 */
function AjaxRequest(result_id,url) {
    jQuery.ajax({
        url:     url,
        type:     "POST",
        dataType: "html",
        error: function (){
            alert("Ошибка соединения");
        },
        success: function(response){
            document.getElementById(result_id).innerHTML = response;
        }
    });
}