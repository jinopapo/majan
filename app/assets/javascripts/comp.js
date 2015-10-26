$( function() {
    $('.chart-botton').click(function(event){
        var id = String($('.user').val());
        var name = String($('.user').text());
        $.ajax({
            url: "/api/comp",
            type: "GET",
            data: { id: id}
        }).then(function(msg){
            var chartData = {
                labels: [],
                datasets:[
                    {
                        label: String(name),
                        fillColor: "rgba(48,155,234,0.4)",
                        strokeColor: "rgba(220,220,220,1)",
                        pointColor: "rgba(220,220,220,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(220,220,220,1)",
                        data: []
                    }
                ]
            }
            var chartOption = {
                scaleShowLine : true,
                angleShowLineOut : true,
                scaleShowLabels : true,
                scaleBeginAtZero : true,
                angleLineColor : "rgba(0,0,0,.1)",
                angleLineWidth : 1,
                pointLabelFontFamily : "'Arial'",
                pointLabelFontStyle : "normal",
                pointLabelFontSize : 10,
                pointLabelFontColor : "#666",
                pointDot : true,
                pointDotRadius : 3,
                pointDotStrokeWidth : 1,
                pointHitDetectionRadius : 20,
                datasetStroke : true,
                datasetStrokeWidth : 2,
                datasetFill : true,
                legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"

            }
            $.each(msg,function(key,val){
                chartData.labels.push(key);
                chartData.datasets[0].data.push(val);
                console.log(key);
            });

            var ctx = $('#chart').get(0).getContext('2d');
            var myRadarChart = new Chart(ctx).Radar(chartData, chartOption);
        });
    });
} );
