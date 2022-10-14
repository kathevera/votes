// "SPDX-License-Identifier: MIT"
pragma solidity ^0.8.0;




    // Contrato de votaciones
    // registrar candidatos
    // persmiso a alguien de votar
    // votar
    
contract Votes{

    //address public INE = 0xC31De3b0fb01fab5a4cb2400F20Ff078fA1E516D;

    uint public votosCandidatos = 0;

    mapping(address => Votante) vota;


    //Registro de votantes

    struct Votante {
        bool voto;
        bool puedeVotar;

    }

    struct Candidatos{
        uint id;
        string  nombre;
        string  partido;
        uint256 votos;
        
    }

    Candidatos public candidato1 = Candidatos ({
        id: 1,
        nombre: "juana",
        partido: "partidoA",
        votos: 0
    });

    Candidatos public candidato2 = Candidatos ({
        id: 2,
        nombre: "pedro",
        partido: "partidoB",
        votos: 0
    });

    Candidatos public candidato3 = Candidatos ({
        id: 3,
        nombre: "Ramon",
        partido: "partidoC",
        votos: 0
    });



    function permisovotar(address _votante) public returns(bool, address) {
       vota[_votante].puedeVotar = true;
       return (true, _votante);
        
   }

    function votar (uint _candidato) public {
    require(vota[msg.sender].puedeVotar,"no puede votar");
    vota[msg.sender].voto = true;

    if(_candidato == 1)
    {
      candidato1.votos +=1;
      votosCandidatos +=1;
    }else if (_candidato==2){
     votosCandidatos +=1;
      candidato2.votos +=1;

    }else if (_candidato==3){
       votosCandidatos +=1;
      candidato3.votos +=1;

    }

    





}
 

}

