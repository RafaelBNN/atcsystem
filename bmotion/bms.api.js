/* TO DO:
	- simular no prob
	- prestar atencao na inicializacao das constantes
		- criar observer para mostrar aeroportos nos locais em que eles forem incializados
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

var bms = bms || {};
var angular = angular || {};

(function() {
    bms = window.parent.bmsapi(window.frameElement.getAttribute('sessionId'), window.frameElement.getAttribute('viewId'));
    angular = window.parent.angular;
})();

// for(var i=1;i<=3;i++){
// 	bms.observe("formula",{
// 		selector: "#runway" + i, 
// 		formulas: ["airport"], // the idea is that we observe the constant airport defined in the model
// 		trigger: function (origin, values){

// 		}
// 	})
// }