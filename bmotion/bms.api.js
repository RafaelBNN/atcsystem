var bms = bms || {};
var angular = angular || {};

(function() {
    bms = window.parent.bmsapi(window.frameElement.getAttribute('sessionId'), window.frameElement.getAttribute('viewId'));
    angular = window.parent.angular;
})();

// observers to put runways on the map according to `aiport` variable
for(var i=1;i<=4;i++){

	bms.observe("formula", {
		selector: "#runway" + i,
		formulas: [	"(airport(" + i + "))'xx",
					"(airport(" + i + "))'yy" ],
		trigger: function(origin, values) {
			origin.attr("x", "" + (12 + (values[0]*40)))
			origin.attr("y", "" + (12 + (values[1]*40)))
		}
	})

}

// observers to change aircraft objects position according to aircraftInfo
for(var i=1;i<=5;i++){

	bms.observe("formula", {
		selector: "#aircraft" + i,
		formulas: [	"((aircraftInfo(A" + i + "))'currpos)'xx",
					"((aircraftInfo(A" + i + "))'currpos)'yy",
					"A" + i + " : dom(aircraftInfo)" ],
		trigger: function(origin, values) {
			origin.attr("x", "" + (14 + (values[0]*40)))
			origin.attr("y", "" + (14 + (values[1]*40)))
		}
	})

}

// observers to change aircraft objects rotation according to aircraftInfo
for(var i=1;i<=5;i++){

	bms.observe("formula", {
		selector: "#aircraft" + i,
		formulas: [	"(aircraftInfo(A" + i + "))'hdng",
					"((aircraftInfo(A" + i + "))'currpos)'xx",
					"((aircraftInfo(A" + i + "))'currpos)'yy" ],
		trigger: function(origin, values) {

			var xcenter = 28 + values[1]*40
			var ycenter = 28 + values[2]*40
			
			if(values[0]=="NN"){
				origin.attr("transform", "rotate(0 " + xcenter + " " + ycenter + ")")
			}
			else if(values[0]=="SS"){
				origin.attr("transform", "rotate(180 " + xcenter + " " + ycenter + ")")
			}
			else if(values[0]=="EE"){
				origin.attr("transform", "rotate(90 " + xcenter + " " + ycenter + ")")
			}
			else{
				origin.attr("transform", "rotate(270 " + xcenter + " " + ycenter + ")")
			}

		}
	})

}

// observer to remove aircraft when they land
for(var i=1;i<=5;i++){

	bms.observe("formula", {
		selector: "#aircraft" + i,
		formulas: ["A" + i + " : dom(aircraftInfo)"],
		trigger: function(origin, values) {
 			if(values[0]=="FALSE"){
 				origin.attr("opacity", "0")
				origin.attr("x", "300")
				origin.attr("y", "300")
 			}
			else{
				origin.attr("opacity", "1")
			}
 		}
 	})

}

// event handler that links advancetime button with operation
bms.executeEvent({
	selector: "#advancetime", // nome do objeto no svg
	events: [
		{ name: "advanceTime" } // nome da operacao
	]
});

// event handler that allows to change direction of aircraft by clicking on it
for(var i=1;i<=5;i++){

	bms.executeEvent({
		selector: "#aircraft" + i,
		events: [{
			name: "turnRight",
			predicate: function(origin){
				return "aa=A" + origin.attr("id").substring(8)
			}
		}]
	})

}

// event handler that allows creation of new aircraft by clicking on runways
for(var i=1;i<=4;i++){

	bms.executeEvent({
		selector: "#runway" + i,
		events: [{
			name: "makeAircraft",
			predicate: function(origin){
				return "ap=airport(" + origin.attr("id").substring(6) + ")"
			}
		}]
	})

}

// event handler that links landaircraft buttons with operations
for(var i=1;i<=5;i++){

	bms.executeEvent({
		selector: "#landaircraft" + i,
		events: [{
			name: "landAircraft",
			predicate: "aa=A" + i
		}]
	})

}