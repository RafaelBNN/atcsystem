var bms = bms || {};
var angular = angular || {};

(function() {
    bms = window.parent.bmsapi(window.frameElement.getAttribute('sessionId'), window.frameElement.getAttribute('viewId'));
    angular = window.parent.angular;
})();

/* 
DUVIDAS:
	- como iterar pelos elementos do conjunto airport?
		- talvez deixar como um conjunto pre-determinado
		- ou transformar airport em um array
	- para a demonstracao no bmotion, um mapa 8x8 pode ser feito ou eh exagero?
	- 

TO DO:
	- comportamento inesperado quando ha mais de uma aeronave e uma delas tenta sair do mapa
	- simular no prob DONE
	- prestar atencao na inicializacao das constantes
		- criar observer para mostrar aeroportos nos locais em que eles forem inicializados DONE
			- adicionar numero fixo ou maximo de aeroportos DONE
			- notar que airport eh um conjunto, entao nao eh trivial usar o elevador como exemplo,
			  ja que todos os elementos de formulas eram elementos simples (e nao conjuntos)
		- criar observer para total e capacity NAO PRECISA
	- criar botoes
		- makeAircraft DONE
		- landAircraft
			- tratar o caso em que mais de uma aeronave pode pousar
			- deixar botao cinza quando nao for possivel
		- changeDirection
			- talvez mudar essa operation para turnLeft por exemplo DONE
				- para mudar a direcao de uma aeronave, bastaria clicar nela DONE
			- se continuar como changeDirection (uma ideia)
				- selecionar aeronave para mudar de direcao
				- aparecer conjunto de selecoes possiveis clicaveis
			- deixar botao cinza quando nao for possivel
		- advanceTime DONE
			- deixar botao cinza quando nao for possivel
	- uma ideia para a movimentacao eh ter um observer para aircraftInfo DONE
	- talvez deixar o numero de aeronaves disponivel ou icones de aeronaves "estacionadas" embaixo
	* lembrar da ideia de deixar tudo transparente e so diminuir a transparencia se tiver uma aeronave la, por exemplo
*/

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