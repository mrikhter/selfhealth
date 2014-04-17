var data = [
{"id":11,"amount":10,"units":"mEq/L","low_range":18.0,"high_range":23.0},
{"id":12,"amount":40,"units":"mEq/L","low_range":98.0,"high_range":106.0},
{"id":13,"amount":30,"units":"mg/dL","low_range":8.2,"high_range":10.6},
{"id":14,"amount":13,"units":"mEq/L","low_range":3.5,"high_range":5.4},
{"id":15,"amount":1938,"units":"mEq/L","low_range":133.0,"high_range":146.0}
]

var barHeight = 20;
var height = 50;
var width = 400;

$(function(){
  $.each(data, function(key, value){
    var barWidth = (value.high_range - value.low_range) * 10;
    var xScale = d3.scale.linear().domain([value.low_range, value.high_range]).range([0, width]);
    d3.select("#result" + value.id)
      .append("svg")
        .attr("width", width)
        .attr("height", height)
        .attr("x", xScale)      
      .append("svg:rect")
        // attr("x", 100).
        // attr("y", 100).
        .attr("height", barHeight)
        .attr("width", barWidth);

    
  });
});

// for each result, append a graph to the selection. 
// draw a box from the min to max normal range
// draw a line where the actual result is
// if the result is out of range ???