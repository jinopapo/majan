$(function(){
    $(".input-score").each(function(){
        $(this).numeric({decimal: false})
            .focusout(function(e){
                autoComp();
            })
    });
    function autoComp(){
        var sum=0;
        var empty=0;
        $(".input-score").each(function(){
            sum += Number($(this).val());
            if($(this).val() == ""){
                empty++;
            }
        });
        if(sum != 100000 && empty == 1){
            $(".input-score").each(function(){
                if($(this).val() == ""){
                    $(this).val(100000-sum);
                }
            });
        }
    }
});
