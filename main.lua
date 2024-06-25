local config = require("definitions.config")
local player = require("definitions.player")
local colossus = require("definitions.colossus")
local utils = require("utils")




--habilitar utf- 8 
config.enableUtf8()

--header
utils.printHeader()

--obter definição do jogador

    
-- obter definição do monstro
-- vamos criar um variavel para o boss, que pode receber diferentes monstos, de forma random, assim podemos ter outros desafios aos player
local boss = colossus

--apresentar o monstro
utils.printCreature(boss)

--Começar loop de batalha
while true do

    --mostrar ações para o jogador

    
    --se a criatura morrer
    if boss.health <= 0 then
        break        
    end
    --se o player morrer
    if player.health <= 0 then
        break
    end



end