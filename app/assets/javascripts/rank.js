$( function() {
  function getScore(){
    $.ajax({
      type: "GET",
      url: "/api/result/rank/"+year,
      dataType: "json"
    }).then(function(data) {
      makeTable(data['score_sum'],'.score-sum');
      makeTable(data['score_ave'],'.score-ave');
      makeTable(data['rank_ave'],'.rank-ave');
    });
  }

  function makeTable(data,selecter){
    $.each(data,function(index,value){
      $(selecter+':first').clone().insertAfter($(selecter+':last'));
      var cell = $(selecter+':last').children().first();
      cell.find('.score-name').html(value['name']);
      cell.find('.score-value').html(value['score']);
      cell = cell.next();
    });
    if($(selecter).length != 1){
      $(selecter+':first').remove();
    }else{
      var cell = $(selecter+':last').children().first();
      for(var i=0;i<4;i++){
        cell.find('.score-name').html("");
        cell.find('.score-value').html("");
        cell = cell.next();
      }
    }
  }

  function removeTable(selecter){
    var top = $(selecter+':first').clone();
    while($(selecter).length > 1){
      $(selecter+':last').remove();
    }
  }

  var year = $('#date_year option:selected').val();
  getScore();
  $('#date_year').change(function(){
    year = $('#date_year option:selected').val();
    removeTable('.score-sum');
    removeTable('.score-ave');
    removeTable('.rank-ave');
    getScore();
  });
});
