$( function() {
  function makeGraph(){
    var scores = [];
    var names = [];
    $.ajax({
      type: "GET",
      url: "/api/result/score_sum/"+year
    }).then(function(msg) {
      for(key in msg) {
        scores.push(msg[key]);
        var name = {label: key};
        names.push(name);
      }
      $.jqplot('jqPlot-sample',scores,{
        axes:{
          xaxis:{
            pad: 0,
            tickOptions:{
              showGridline: false,
              show: false
            }
          }
        },
        series: names,
        legend: {
          show: true,
          placement: 'outside',
          location: 's',
          renderer: jQuery . jqplot . EnhancedLegendRenderer,
          rendererOptions: {
            numberRows: 1
          }
        }
      });
    });
  }
  var year = $('#date_year option:selected').val();
  makeGraph();
  $('#date_year').change(function(){
    year = $('#date_year option:selected').val();
    makeGraph();
  });

} );
