contract minhapropriedade {
	address public dono;

	function minhapropriedade(){
		dono = msg.sender;
	}

	modifier apenasDono {
		if (msg.sender != dono) throw;
		_
	}

	function transferirPropriedade(address novoDono) apenasDono{
		dono = novoDono;
	}
}

contract crowdfunding is minhapropriedade {


int public margemMaioria;
uint public numProposta;
mapping (address => uint) public IDmembro;
Membro[] public membros
bool executado;
Voto[] votos;
mapping (address => bool) voted;

}