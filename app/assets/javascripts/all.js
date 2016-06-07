$( function() {
  $.ajax({
    type: "GET",
    url: "/api/result/all"
  }).then(function(data) {
    $.each(data,function(index,value){
      $('#score').clone().append();
      var cell = $('.score:last').children().first();
      for(key in value){
        cell.find('.score-name').html(value[key][0]);
        cell.find('.score-value').html(value[key][1]);
        cell = cell.next();
      }
    });
  });
});
