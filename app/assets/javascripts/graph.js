jQuery( function() {
    Tarou = [ [ 1, 65 ], [ 2, 72 ], [ 3, 74 ], [ 4, 63 ], [ 5, 85 ]];
    Hanako = [ [ 1, 83 ], [ 2, 81 ], [ 3, 79 ], [ 4, 88 ], [ 5, 78 ], [ 6, 96 ] ];
    Ichirou = [ [ -1, 81 ], [ 3, 86 ], [ 4, 69 ], [ 5, 101 ], [ 6, 82 ] ];
    jQuery . jqplot(
        'jqPlot-sample',
        [
            Tarou, Hanako, Ichirou
        ]
    );
} );
