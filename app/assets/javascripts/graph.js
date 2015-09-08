jQuery( function() {
    var users = [];
    $.ajax({
        type: "GET",
        url: "/api/result/score_sum"
    }).then(function(msg) {
        for(key in msg) {
            users.push(msg[key]);
        }
        log = msg['じーの'];
        $.jqplot('jqPlot-sample',users,{
            axes:{
                xaxis:{
                    pad: 0,
                    tickOptions:{
                        showGridline: false,
                        show: false
                    }
                }
            }
        });
    })
} );
