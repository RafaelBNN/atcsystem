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
		- criar observer para mostrar aeroportos nos locais em que eles forem inicializados
			- adicionar numero fixo ou maximo de aeroportos DONE
			- notar que airport eh um conjunto, entao nao eh trivial usar o elevador como exemplo,
			  ja que todos os elementos de formulas eram elementos simples (e nao conjuntos)
		- criar observer para total e capacity
	- criar botoes
		- makeAircraft
		- landAircraft
			- tratar o caso em que mais de uma aeronave pode pousar
			- deixar botao cinza quando nao for possivel
		- changeDirection
			- talvez mudar essa operation para turnLeft por exemplo
				- para mudar a direcao de uma aeronave, bastaria clicar nela
			- se continuar como changeDirection (uma ideia)
				- selecionar aeronave para mudar de direcao
				- aparecer conjunto de selecoes possiveis clicaveis
			- deixar botao cinza quando nao for possivel
		- advanceTime
			- deixar botao cinza quando nao for possivel
	- uma ideia para a movimentacao eh ter um observer para aircraftInfo
	- talvez deixar o numero de aeronaves disponivel ou icones de aeronaves "estacionadas" embaixo
	* lembrar da ideia de deixar tudo transparente e so diminuir a transparencia se tiver uma aeronave la, por exemplo
*/

bms.observe("formula", {
    selector: "#timetext",
    formulas: ["time"],
    trigger: function(origin, values){
        origin.text(values[0])
		console.log("Advanced time")
    }
})

// observer to change position of A1 in svg according to aircraftInfo
bms.observe("formula", {
    selector: "#aircraft1",
    // formulas: ["auxInitPosA1x", "auxInitPosA1y"],
    formulas: ["((aicraftInfo(A1))'currpos)'xx", "((aicraftInfo(A1))'currpos)'yy"], // queremos observar as coordenadas da aeronave
    trigger: function(origin, values) {
		// origin.attr("x", "0")
        // origin.attr("y", "0")
        origin.attr("x", "" + (14 + ((values[0]-1)*40)))
        origin.attr("y", "" + (14 + ((values[1]-1)*40)))
        console.log("to aqui")
    }
})

// event handler that links advancetime button with operation
bms.executeEvent({
	selector: "#advancetime", // nome do objeto no svg
	events: [
		{ name: "advanceTime" } // nome da operacao
	]
});

