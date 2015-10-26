$( function() {
    $('.chart-botton').click(function(event){
        var id = String($('.user').val());
        var name = String($('.user option:selected').text());
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
                    },
                                        {
                        label: "ave",
                        fillColor: "rgba(148,155,234,0.4)",
                        strokeColor: "rgba(220,220,220,1)",
                        pointColor: "rgba(220,220,220,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(220,220,220,1)",
                        data: []
                    },
                ]
            }
            /*var chartOption = {
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
                //scaleStartValue : 0,
                legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
             }*/

            var min=100000;
            var max= -10000;
            $.each(msg,function(key,val){
                if(val < min){
                    min = val;
                }
                if(val > max){
                    max = val;
                }
            });
            $.each(msg,function(key,val){
                if(key != name){
                    chartData.labels.push(key);
                    if(val == null){
                        chartData.datasets[0].data.push(min);
                    }else{
                        chartData.datasets[0].data.push(val);
                    }
                }else{
                    console.log(key);
                    for(var i=0;i<$('.user').children().length;i++){
                        chartData.datasets[1].data.push(val);
                    }
                }
            });
            var chartOption = {
                // X, Y 軸ラインが棒グラフの値の上にかぶさるようにするか
                scaleOverlay : true,
                // 値の開始値などを自分で設定するか
                scaleOverride : true,

                // 以下の 3 オプションは scaleOverride: true の時に使用
                // Y 軸の値のステップ数
                // e.g. 10 なら Y 軸の値は 10 個表示される
                scaleSteps : 10,
                // Y 軸の値のステップする大きさ
                // e.g. 10 なら 0, 10, 20, 30 のように増えていく
                scaleStepWidth : Math.ceil((max-min)/10),
                // Y 軸の値の始まりの値
                scaleStartValue : min,
                // X, Y 軸ラインの色
                scaleLineColor : "rgba(0, 0, 0, .1)",
                // X, Y 軸ラインの幅
                scaleLineWidth : 1,
                // ラベルの表示 ( Y 軸の値 )
                scaleShowLabels : true,
                // ラベルの表示フォーマット ( Y 軸の値 )
                scaleLabel : "<%=value%>",
                // X, Y 軸値のフォント
                scaleFontFamily : "'Arial'",
                // X, Y 軸値のフォントサイズ
                scaleFontSize : 12,
                // X, Y 軸値のフォントスタイル, normal, italic など
                scaleFontStyle : "italic",
                // X, Y 軸値の文字色
                scaleFontColor : "#666",
                // グリッドライン ( Y 軸の横ライン ) の表示
                scaleShowGridLines : true,
                // グリッドラインの色
                scaleGridLineColor : "rgba(0, 0, 0, .05)",
                // グリッドラインの幅
                scaleGridLineWidth : 1,
                // 棒グラフの値部分の枠線の表示
                barShowStroke : true,
                // 棒グラフの値部分の枠線の幅
                barStrokeWidth : 1,
                // 棒グラフの値と値のスペース ( 違う X 値のものと )
                barValueSpacing : 5,
                // 棒グラフの値と値のスペース ( 同じ X 値のものと )
                barDatasetSpacing : 1,
                // 表示の時のアニメーション
                animation : true,
                // アニメーションの速度 ( ステップ数 )
                animationSteps : 60,
                // アニメーションの種類, 以下が用意されている
                // linear, easeInQuad, easeOutQuad, easeInOutQuad, easeInCubic, easeOutCubic,
                // easeInOutCubic, easeInQuart, easeOutQuart, easeInOutQuart, easeInQuint,
                // easeOutQuint, easeInOutQuint, easeInSine, easeOutSine, easeInOutSine,
                // easeInExpo, easeOutExpo, easeInOutExpo, easeInCirc, easeOutCirc, easeInOutCirc,
                // easeInElastic, easeOutElastic, easeInOutElastic, easeInBack, easeOutBack,
                // easeInOutBack, easeInBounce, easeOutBounce, easeInOutBounce
                animationEasing : "easeOutQuad",
                // アニメーション終了後に実行する処理
                // animation: false の時にも実行されるようです
                // e.g. onAnimationComplete : function() {alert('complete');}
                onAnimationComplete : null
            }


            var ctx = $('#chart').get(0).getContext('2d');
            var myRadarChart = new Chart(ctx).Radar(chartData, chartOption);
        });
    });
} );
