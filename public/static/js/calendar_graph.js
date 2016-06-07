/**
 * Created by guoxc on 14-4-28.
 */

var show_calendar_graph = function(svg_id,d){
    //group daily data by week
    var i,dataset,d_min,d_max;
    dataset = [];
    d_min = d[0];
    d_max = d[0];
    for(i = 0; i < d.length; i += 1){
        if(i % 7 == 0){
            dataset.push([]);
        }
        dataset[dataset.length - 1].push(d[i]);
        if(d[i] < d_min) {
            d_min = d[i];
        }
        if(d[i] > d_max) {
            d_max = d[i];
        }
    }

    var svg = d3.select(svg_id);
    svg.style("border","solid 1px black");
    var g = svg.selectAll("g");
    var g1 = g.data(dataset).enter().append("g");
    g1.attr("transform",function(d, i) { return "translate("+(i * 12 + 2)+",0)"});
    var rect = g1.selectAll("rect");
    var rect_each = rect.data(function(d){ return d;})
        .enter().append("rect");
    rect_each.style("fill",function(d){
        var p = Math.floor( 80 *  (d_max - d) / (d_max - d_min)) ;
        return "hsl(120,80%,"+ (p + 15) +"%)";
    }).attr("width","10").attr("height","10")
        .attr("transform",function(d,i){ return "translate(0," + (i * 12 + 2) + ")"}).text(function(d){return d;})
        .on("mouseover",function(d){
            d3.select(this).transition().style("stroke","black");
        }).on("mouseout",function(d,i){
            d3.select(this).transition().style("stroke","");
        });


}