--Dependencias
local config = require("config")
local player = require("player.player")
local playerAction = require("player.actions")
local colossus = require("colossus.colossus")
local colossusAction = require("colossus.actions")

local utils = require("utils")

--habilitar utf- 8 
config.enableUtf8()

--header
utils.printHeader()

-- obter definição do monstro
-- vamos criar um variavel para o boss, que pode receber diferentes monstos, de forma random, assim podemos ter outros desafios aos player
local boss = colossus
local bossAction = colossusAction

--apresentar o monstro
utils.printCreature(boss)

--build actions, tem que executar uma vez para criar a lista que esta armazenada nele
playerAction.build()
bossAction.build()
    
--Começar loop de batalha
while true do

    --mostrar ações para o jogador
    print()
    print(string.format("Qual será a próxima ação de %s?",player.name))
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
    --simular o turno do jogador
    if isActionValid then
        chosenAction.execute(player,boss)
    else
        print(string.format("########### Sua escolha é inválida, %s perdeu a vez! ##########",player.name))
    end
    
     --simular o turno da criatura


    --ponto de saida -se a criatura morrer
    if boss.health <= 0 then
        print(string.format([[
            --------------------------------------------------------------------------------------
            %s consegue derrotar %s com um rápido lance de espada, fazendo com que o monstro caia.
            Um grande estrondo ecoa com a queda e derrota de %s... e uma lenda surgi, a lenda de %s
        ]],player.name,boss.name,boss.name,player.name))
        break        
    end


     --simular o turno da criatura
     print()
     --escolhendo uma ação da criatura
     local validBossAction = bossAction.getValidActions(player,boss)
     local bossActions = validBossAction[math.random(#validBossAction)]
     bossActions.execute(player,boss)

    --ponto de saida -se o player morrer
    if player.health <= 0 then
        print(string.format([[
--------------------------------------------------------------------------------------
 %s cai em batalha e não consegue derrotar %s
    ..mas antes do golpe final...uma sombra aparece no campo de batalha...
            e %s desaparece... 🧜... um novo guerreiro surgira??
        ]],player.name,boss.name,player.name))
        break
    end



end

--fim