local config = require("definitions.config")
local player = require("definitions.player")
local colossus = require("definitions.colossus")



--[[


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
config.utf()

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
print(string.format("A vida do jogador é %d/%d", player.maxHealth, player.health))

-- obter definição do monstro
-- vamos criar um variavel para o boss, que pode receber diferentes monstos, de forma random, assim podemos ter outros desafios aos player
local boss = colossus
print(string.format("O valor da vida do %s é de %d/%d",boss.name,boss.health,boss.maxHealth))



--apresentar o monstro

--Começar loop de batalha