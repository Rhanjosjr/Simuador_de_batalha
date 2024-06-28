--Dependencias
local config = require("config")
local player = require("player.player")
local playerAction = require("player.actions")
local playerTwo = require("playerTwo.playerTwo")
local playerTwoAction = require("playerTwo.actions")
local playerThree = require("playerThree.playerThree")
local playerThreeAction = require("playerThree.actions")
local colossus = require("colossus.colossus")
local colossusAction = require("colossus.actions")  
local kraken = require("kraken.kraken")
local krakenAction = require("kraken.actions")
local utils = require("utils")

--habilitar utf- 8 
config.enableUtf8()

--header
utils.printHeader()

--escolhe com qual player ira jogar
    local chosenHero = require(config.whichPlayer())
    local chosenPlayer = chosenHero
    if chosenPlayer== player then
        playerAction = playerAction
    
    elseif chosenPlayer== playerTwo then 
        playerAction = playerTwoAction
        
    elseif chosenPlayer== playerThree then 
        playerAction = playerThreeAction
        
    end

--print definição do player escolhido
print()
print(string.format("Você escolheu %s que é %s",chosenPlayer.name,chosenPlayer.description))
print()
--imprimir carta do player
utils.printPlayer(chosenPlayer)



print("Seu adversario será: ")


-- vamos criar um variavel para o boss, que pode receber diferentes monstos, de forma random, assim podemos ter outros desafios aos player
--####################3
-- obter definição do monstro

local chosenMonster = require(config.whichBoss())
local boss = chosenMonster
local bossAction
if boss== colossus then
    bossAction = colossusAction
elseif boss==kraken then 
    bossAction = krakenAction

end


--local boss = kraken
--local bossAction = require("kraken.actions")

--apresentar o monstro
utils.printCreature(boss)

--############build actions, tem que executar uma vez para criar a lista que esta armazenada nele
playerAction.build()
bossAction.build()



--Começar loop de batalha
while true do

    --mostrar ações para o jogador
    print()
    print(string.format("Qual será a próxima ação de %s?",chosenPlayer.name))
    local validPlayerAction = playerAction.getValidActions(chosenPlayer,boss)
    for i, action in pairs(validPlayerAction) do
        print(string.format("%d. %s",i,action.description))
    end

    local chosenIndex = utils.ask()
    print("chosen index: "..chosenIndex)

    --verificar se a escolha e valida ou seja se existe
    local chosenAction = validPlayerAction[chosenIndex]
    local isActionValid = chosenAction ~= nil

    --realiza a ação execute dentro do modulo action
    --simular o turno do jogador
    if isActionValid then
        chosenAction.execute(chosenPlayer,boss)
    else
        print(string.format("########### Sua escolha é inválida, %s perdeu a vez! ##########",chosenPlayer.name))
    end
    
     --simular o turno da criatura


    --ponto de saida -se a criatura morrer
    if boss.health <= 0 then
        print(string.format([[
            --------------------------------------------------------------------------------------
            %s consegue derrotar %s fazendo com que o monstro caia.
            Um grande estrondo ecoa com a queda e derrota de %s... e uma lenda surgi, a lenda de %s
        ]],chosenPlayer.name,boss.name,boss.name,chosenPlayer.name))
        break        
    end


     --simular o turno da criatura
     print()
     --escolhendo uma ação da criatura
     local validBossAction = bossAction.getValidActions(chosenPlayer,boss)
     local bossActions = validBossAction[math.random(#validBossAction)]
     bossActions.execute(chosenPlayer,boss)

    --ponto de saida -se o player morrer
    if chosenPlayer.health <= 0 then
        print(string.format([[
--------------------------------------------------------------------------------------
 %s cai em batalha e não consegue derrotar %s
    ..mas antes do golpe final...uma sombra aparece no campo de batalha...
            e %s desaparece... 🧜... um novo guerreiro surgira??
        ]],chosenPlayer.name,boss.name,chosenPlayer.name))
        break
    end



end

--fim