$( function() {
  function getScore(){
    $.ajax({
      type: "GET",
      url: "/api/result/all/"+year
    }).then(function(data) {
      $.each(data,function(index,value){
        $('.score:first').clone().insertAfter($('.score:last'));
        var cell = $('.score:last').children().first();
        for(key in value){
          cell.find('.score-name').html(value[key][0]);
          cell.find('.score-value').html(value[key][1]);
          cell = cell.next();
        }
      });
      if($('.score').length != 1){
        $('.score:first').remove();
      }else{
        var cell = $('.score:last').children().first();
        for(var i=0;i<4;i++){
          cell.find('.score-name').html("");
          cell.find('.score-value').html("");
          cell = cell.next();
        }
      }
    });
  };

  var year = $('#date_year option:selected').val();
  getScore();
  $('#date_year').change(function(){
    year = $('#date_year option:selected').val();
    var top = $('.score:first').clone();
    while($('.score').length > 1){
      $('.score:last').remove();
    }
    getScore();
  });
});
