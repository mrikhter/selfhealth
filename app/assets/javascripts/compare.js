$(function(){
    var dataset = <%= raw(@results) %>

    var margin = {top: 30, right: 20, bottom: 30, left: 50},
    width = 600 - margin.left - margin.right,
    height = 270 - margin.top - margin.bottom;

    //var x = d3.scale.linear().domain([0, data.length]).range([0, width]);
    var x = d3.time.scale().range([0, width]);
    var y = d3.scale.linear().range([height, 0]);

    var xAxis = d3.svg.axis().scale(x)
      .orient("bottom").ticks(1)
      .tickFormat(d3.time.format("%m-%d-%Y"));

    // var xLine = d3.svg.axis().scale(x)
    //   .orient("bottom").ticks(0).tickSize(0);

    var yAxis = d3.svg.axis().scale(y)
      .orient("left").ticks(5); 

    var parseDate = d3.time.format("%Y-%m-%d").parse;

    var valueline = d3.svg.line()
      .x(function(d) { return x(d.date); })
      .y(function(d) { return y(d.amount); });

    var maxline = d3.svg.line()
      .x(function(d) { return x(d.date); })
      .y(function(d) { return y(d.high); });

    var minline = d3.svg.line()
      .x(function(d) { return x(d.date); })
      .y(function(d) { return y(d.low); });

    $.each(dataset, function(key, value){
      console.log(value);
      d3.json(value, function(data){
        d3.select("body")
          .append("div")
          .selectAll("h1")
          .data([value])
          .enter()
          .append("h1")
          .text(
            function(d){
              var msg = d.item;
              msg += " measured in "
              msg += d.units;
              return msg;
            }
          )
          var svg = d3.select("body").append("svg")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
          .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
          var results = value.results;
          var normal = value.normal;

          d3.json(normal, function(error, data) {
            normal.forEach(function(d) {
              d.date = parseDate(d.date);
              d.high = +d.high;
              d.low = +d.low;

            
            });
          })



          d3.json(results, function(error, data) {
            results.forEach(function(d) {
              d.date = parseDate(d.date);
              d.amount = +d.amount;



            x.domain(d3.extent(results, function(d) { return d.date; }));
            //y.domain([0, d3.max(results, function(d) { return d.amount; })]);
            y.domain(d3.extent(results, function(d) { return d.amount; }));

            svg.append("g")         // Add the X Axis
                .attr("class", "x axis")
                .attr("transform", "translate(0," + height + ")")
                .call(xAxis);

            svg.append("g")         // Add the Y Axis
                .attr("class", "y axis")
                .call(yAxis)
              .append("text")
                .attr("transform", "rotate(-90)")
                .attr("y", 6)
                .attr("dy", ".71em")
                .style("text-anchor", "end")
                .text("Price ($)");

            svg.append("path")      // Add the valueline path.
              .datum(results)
              .attr("class", "line")
              .attr("d", valueline(results));

            svg.append("path")  // Add the normal line low
              .attr("class", "max")
              .attr("d", maxline(normal))            
              // .attr("transform", "translate(0," + (height - normal.low) + ")")
              // .call(xLine)
              .append("text")
                .attr("transform", "translate(" + width + ",0)")
                .text("Max");


            svg.append("path")  // Add the normal line high
              .attr("class", "min")
              .attr("d", minline(normal));

            });
          });

          
        }
      );
    });
 });