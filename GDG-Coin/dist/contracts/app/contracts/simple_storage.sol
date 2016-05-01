//Definir o dono do contrato para efetuar funções de manuntenção

/*
contract minhapropriedade {
  address public dono;

  function minhapropriedade() { 
    dono = msg.sender;
  }

//Modificador que define funções que apenas eu posso executar.

  modifier ApenasDono{
    if (msg.sender != dono) throw;
    _    //O underline significa refazer tudo que ja foi executado no contrato para uma pilha, ou seja
    //devolver os tokens que foram utilizados em funções e em outras computações
  }

  funcion mudarDono(address novoDono) ApenasDono {
    dono = novoDono;
  }
}


contract 



contract PirateCoin is minhapropriedade{



}







contract TrocaPp is PirateCoin{

  //Declarar eventos que podem ser observáveis

  event Transferencia(address indexed de, address indexed para, uint256 valor);



  //Inicializar as variáveis do contrato das trocas
address user1;
mapping(address => uint) public Iduser;
mapping (produtos => uint) public IdProduto;
Produto[] public produtos;
uint public distancia;
mapping (address => uint 256) public;



struct Produto {
string nome;
uint valor;
bool disponível;
bool vendendo;
address propriedade;



}

//Cadastrar produto

function cadastro(uint valor, string nomeprod){
 

 IdProduto = produtos.length++;
 Produto p = produtos[IdProduto];
 p.propriedade = msg.sender;
 p.nome = nomeprod;


}



//Definir a ação compra de um produto

function compraProd(address vendedor, uint256 valor, uint IdProduto) {

// Verifica se o comprador tem fundos suficientes e se o saldo do vendedor não está bugado
if (balanceOf[msg.sender] < valor || balanceOf[vendedor] + valor < balanceOf[vendedor]) {
  throw;
}

balanceOf[msg.sender] -= valor;
balanceOf[vendedor] += valor;

//Faz um evento para notificar que esta transferência ocorreu
Transferencia(msg.sender, vendedor, valor);

}

function colocarValProd(address vendedor, uint256 valor, uint IdProduto){

IdProduto[vendedor];





}






//Definir um produto à venda

//Votar na qualidade de um produto
function votarqualidadeproduto(){
}

//Consultar produtos

//Votar na reputação de um usuário

//Fazer um request de compra

//Fazer uma oferta de venda

//Definir a localidade (FODA)




} 

*/

contract SimpleStorage {
  uint public storedData;
  address criador;
  
  
  

  function SimpleStorage(uint initialValue) {
    
    
    storedData = initialValue;
          }

    function saldo(){
      storedData = this.balance;
    }      



      function pegaend(){
        storedData = msg.gas;
      }

      function dobrar(){
        storedData *= 2;
      }


  function set(uint x) {
    storedData = x;
       }

  function get() constant returns (uint retVal) {
    return storedData;
  }

}




// Jogo educacional