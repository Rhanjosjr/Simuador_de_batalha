--[[

==============================================================================
Você empunha uma espada e se prepara para lutar.
É hora da batalha!

| Priama Colossus
|
|Enormes estátuas de prismarine que medem mais de 20 metros de altura. Sua aparência ameaçadora pode assustar até os mais bravos guerreiros
| Eles tem olhos turquesas brilhantes, mas um eleogio não vai te ajudar muito durante uma batalha.
|
| Atributos
| Vida        ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜
| Ataque      ⬜⬜⬜⬛⬛⬛⬛⬛⬛⬛
| Defesa      ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜
| Agilidade   ⬜⬛⬛⬛⬛⬛⬛⬛⬛⬛

O que você vai fazer?
1. Atacar com a espada.
2. Usar poção de regeneração.
3. Atirar uma pedra.
4. Se esconder



]]
--habilitar utf- 8 
os.execute("chcp 65001")
os.execute("cls")

local player = require("definitions.player")


--header
--outra forma de usar os strings dentro do print, com varias linha [[]]
print([[
=====================================================================================================
=========================================================================================================
          /)                    
         //                                                    SIMULADOR 
.-------| |--------------------------------------------.__
|WMWMWMW| |>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>:>                DE 
`-------| |--------------------------------------------'^^                  
         \\                                                                     BATALHAS  ⚔                 
          \)                                            
=========================================================================================================
=====================================================================================================

                            Você empunha uma espada e se prepara para lutar.
                                         É hora da batalha!
     --------------------------------------------------------------------------------------------                                    

]])




--obter definição do jogador
--print(string.format("Avida do jogador é no máximo: %d e atual é de: %d", player.maxHealth, 10))
print(type(player.maxHealth))



-- obter definição do monstro

--apresentar o monstro

--Começar loop de batalha