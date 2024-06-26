--Dependencias
local config = require("config")
local player = require("player.player")
local playerAction = require("player.actions")
local colossus = require("colossus.colossus")

local utils = require("utils")

--habilitar utf- 8 
config.enableUtf8()

--header
utils.printHeader()

-- obter definição do monstro
-- vamos criar um variavel para o boss, que pode receber diferentes monstos, de forma random, assim podemos ter outros desafios aos player
local boss = colossus

--apresentar o monstro
utils.printCreature(boss)

--build actions, tem que executar uma vez para criar a lista que esta armazenada nele
playerAction.build()
    
--Começar loop de batalha
while true do

    --mostrar ações para o jogador
    print()
    print("O que você deseja fazer em seguida?")
    local validPlayerAction = playerAction.getValidActions(player,boss)
    for i, action in pairs(validPlayerAction) do
        print(string.format("%d. %s",i,action.description))
    end

    local chosenIndex = utils.ask()
    print("chosen index: "..chosenIndex)

    --verificar se a escolha e valida ou seja se existe
    local chosenAction = validPlayerAction[chosenIndex]
    local isActionValid = chosenAction ~= nil

    --realiza a ação execute dentro do modulo action
    if isActionValid then
        chosenAction.execute(player,boss)
    else
        print("Sua ação é inválida! Você perdeu a vez!")
    end
    

    --simular o turno do jogador
    --todo

   

    
    --ponto de saida -se a criatura morrer
    if boss.health <= 0 then
        break        
    end
     --simular o turno da criatura



     --todo


    --ponto de saida -se o player morrer
    if player.health <= 0 then
        break
    end



end

--fim