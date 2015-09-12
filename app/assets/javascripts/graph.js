jQuery( function() {
    var scores = [];
    var names = [];
    $.ajax({
        type: "GET",
        url: "/api/result/score_sum"
    }).then(function(msg) {
        for(key in msg) {
            scores.push(msg[key]);
            var name = {label: key}
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
    })
} );
