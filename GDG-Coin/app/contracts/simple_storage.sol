
//Definir o dono do contrato para efetuar funções de manuntenção
//Administração CENTRALIZADA

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

  function mudarDono(address novoDono) ApenasDono {
    dono = novoDono;
  }
}

contract GDGCoin is minhapropriedade{

  //Eventos para clients escutarem
  event Transfer(address indexed from, address indexed to, uint256 value);

  //variaveis a serem passadas na função construtora das moedas dos capitulos, assim como da moeda principal do GDG.
  string public nomeCapitulo;
  string public simbolo;
  uint8 public decimals;
  uint256 public totalSupply;
  uint256 public sellPrice;
  uint256 public buyPrice;
  uint minBalanceForAccounts;
  bytes32 public currentChallenge;                         // ChallengeStartado
uint public timeOfLastProof;                             // Quando premios foram dados
uint public difficulty = 10**32;                         // Seta dificuldade

  //Cria um array com todos os balances de GDGCoin
  //Mapping é um array associativo entre address(hexa) e balance(int)
  //Public para os balances serem acessíveis por qlqr um na blockchain
  mapping (address => uint256) public balanceOf;

  function GDGCoin(uint256 initialSupply, string nometoken, string simbolotoken, uint8 unidadesdecimais, address administrador){
    //Define o administrador
    if(administrador != 0) owner = msg.sender;
    if (initialSupply == 0) initialSupply = 666;  //VAI DEMONIO
    //Essa função rodará apenas a primeira vez que o contrato for executado (nome igual do contrato)
    //Balance do dono da coin recebe parametro da function de qnts coins serão inicializadas e recebe todas
    balanceOf[msg.sender] = initialSupply;
    nomeCapitulo = nometoken;   //Para display
    simbolo = simbolotoken;     //Para display
    decimals = unidadesdecimais;    //Para display
    totalSupply = initialSupply;
    timeOfLastProof = now;
  }

//Transferencia de moedas

function transferencia(address to, uint256 value){
  //Não iremos fazer o handler para débitos, então checamos se o remetente possui o valor para enviar / checa overflow na conta do recipiente
  if(balanceOf[msg.sender] < value || balanceOf[to] + value < balanceOf[to])
      throw;

  //Adiciona recipiente e subtrai valores remetente de balances
  balanceOf[msg.sender] -= value;
  balanceOf[to] += value;
  if(msg.sender.balance<minBalanceForAccounts)
        sell((minBalanceForAccounts-msg.sender.balance)/sellPrice);

     //Notifica o client que uma transferencia foi feita
     Transfer(msg.sender, to, value);

}

//Cria tokens centralizadamente

function criatokens(address target, uint256 amount) ApenasDono{
  balanceOf[target] += amount;
  totalSupply += amount;
  Transfer(0, dono, amount);
  Transfer(dono, target, amount);

}

function setaprecos(uint256 newSellPrice, uint256 newBuyPrice) ApenasDono{
sellPrice = newSellPrice;
buyPrice = newBuyPrice;

}

// IMPORTANTE PRA KCT -> "One ether is 1000000000000000000 wei. So when setting prices for your token in ether, add 18 zeros at the end."
// "a much more interesting contract would allow a market where anyone can bid different prices, or maybe it would load the prices directly from an external source."

function buy() returns (uint amount){
    amount = msg.value / buyPrice;       // CALCULA O MONTANTE
    if (balanceOf[this] < amount) throw;   // CHECA O SALDO SUFICIENTE PARA VENDER
    balanceOf[msg.sender] += amount;    // ADICIONA NO SALDO DO COMPRADOR
    balanceOf[this] -= amount;    // SUBTRAI DO VENDEDOR
    Transfer(this, msg.sender, amount);     // EVENTO PARA CLIENTE
    return amount;                                     
}

function sell(uint amount) returns (uint revenue){
    if (balanceOf[msg.sender] < amount ) throw;        
    balanceOf[this] += amount;                         
    balanceOf[msg.sender] -= amount;                   
    revenue = amount * sellPrice;                      // CALCULA O PROFIT
    msg.sender.send(revenue);                          // ENVIA ETHER PARA O VENDEDOR
    Transfer(msg.sender, this, amount);                
    return revenue;                                    
}

function setMinBalance(uint minimumBalanceInFinney) ApenasDono {
     minBalanceForAccounts = minimumBalanceInFinney * 1 finney;
}

function proofOfWork(uint nonce){
    bytes8 n = bytes8(sha3(nonce, currentChallenge));    // Gera hash aleatório
    if (n < bytes8(difficulty)) throw;                   // Checa se ta abaixo da dificuldade

    uint timeSinceLastProof = (now - timeOfLastProof);  // Calcula quanto tempo desde o ultimo reward
    if (timeSinceLastProof <  5 seconds) throw;         // Controla o tempo dos rewards para não serem dados muito rapido
    balanceOf[msg.sender] += timeSinceLastProof / 60 seconds;  // Aumenta a recompensa por minuto

    difficulty = difficulty * 10 minutes / timeSinceLastProof + 1;  // Ajusta a dific

    timeOfLastProof = now;                              // Reseta o contador
    currentChallenge = sha3(nonce, currentChallenge, block.blockhash(block.number-1));  // Salva o hash que será usado como próxima prova
}


}




contract SimpleStorage {
  uint public storedData;
  address dono;
  
  dono = msg.sender;
  

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

/*


contract TrocaP2p{

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

//Consultar produtos

//Votar na reputação de um usuário

//Fazer um request de compra

//Fazer uma oferta de venda

//Definir a localidade (FODA)




} 
*/