--dependencias
local utils = require "utils"

local actions = {}

    actions.list = {}


---cria uma lista de ações armazenada internamente
    function actions.build()
        --reset list
        actions.list={}

        local axeAttack={
            description = "Atacar com machado.",
            requirement = nil,
            execute = function(playerData,creatureData)
                --1. definir chance de sucesso
                --baseado na velocidade da criatura
                local successChance = creatureData.speed == 0 and 1 or playerData.speed / creatureData.speed
                --para verificar se ocorreu sucesso ou nao no ataque, e comparado com um random de 0 a 1 para verificar o sucesso
                local sucess = math.random() <= successChance

                --2. calcular dano
                local rawDamege = playerData.attack - (math.random()*creatureData.defense)
                --gera um resultado de dano entre -2 e 6, para evitar o dano negativo, faremos, tambemlembrar que temos que arredondar pra cima o valor
                local damage = math.max(1,math.ceil(rawDamege))
                
                --3. apresentar resutados como print
                if sucess then
                    print(string.format("%s atacou %s com o machado e deu %d pontos de dano",playerData.name,creatureData.name, damage))
                    --para aplicar o grafico demonstrando a queda de vida da criatura
                    local healthRate = math.floor((creatureData.health / creatureData.maxHealth)*10)
                    
                    --4. aplicar o dano em caso de sucesso  
                    creatureData.health = creatureData.health - damage
                    print(string.format("%s:%s",creatureData.name,utils.getProgressBar(healthRate   )))
                else
                    print(string.format("******%s tentou atacar, mas errou!******",playerData.name))
                end
                            
            end

        }
        --usar poção de regeneração
        local regentPotion = {
            description = ("Tomar solução de regeneração."),
            requirement = function (playerData,creatureData)
                --verificar se o player possou ao menos uma solução
                return playerData.potions >=1                
            end,
            execute = function (playerData,creatureData)
                --tirar poção do inventario
                playerData.potions = playerData.potions-1
                --retornar os ponto de vida, em um itervalo ate max health
                local regenPoints =10
                playerData.health=math.min(playerData.maxHealth,playerData.health + regenPoints)
                print(string.format("*****%s tomou a poção e recuperou pontos de vida.*****",playerData.name))
            end      
        }
        --usar ataque de fury
        local furyAttack = {
            description = ("Entrar em modo de furia, causa um dano dobrado no próximo ataque!"),
            requirement = function (playerData,creatureData)
                --verifica se ja usou o modo de fury
                return playerData.fury >=1                
            end,
            execute = function (playerData,creatureData)
                --tira a habilidade de realizara a furia
                playerData.fury = playerData.fury-1

                --1. definir chance de sucesso
                --baseado na velocidade da criatura
                local successChance = creatureData.speed == 0 and 1 or playerData.speed / creatureData.speed
                --para verificar se ocorreu sucesso ou nao no ataque, e comparado com um random de 0 a 1 para verificar o sucesso
                local sucess = math.random() <= successChance

                --2. calcular dano
                local rawDamege = playerData.attack - (math.random()*creatureData.defense)
                --gera um resultado de dano entre -2 e 6, para evitar o dano negativo, faremos, tambemlembrar que temos que arredondar pra cima o valor
                local damage = (math.max(1,math.ceil(rawDamege)))*2

               --3. apresentar resutados como print
                if sucess then
                print(string.format("%s atacou %s com o machado em furia e deu %d pontos de dano",playerData.name,creatureData.name, damage))

                --para aplicar o grafico demonstrando a queda de vida da criatura
                local healthRate = math.floor((creatureData.health / creatureData.maxHealth)*10)
                
                --4. aplicar o dano em caso de sucesso  
                creatureData.health = creatureData.health - damage
                print(string.format("%s:%s",creatureData.name,utils.getProgressBar(healthRate   )))
                else
                print(string.format("******%s tentou atacar, mas errou!******",playerData.name))
                end                                
                
                
                
            end      
        }

        
        
        

        --populate list
        actions.list[#actions.list+1] = axeAttack
        actions.list[#actions.list+1] = regentPotion
        actions.list[#actions.list+1] = furyAttack
        
    end

       
    
    ---Retorna uma lista de ações válidas
    ---@param playerData table definição do jogador
    ---@param creatureData table definição da criatura
    ---@return table
    function actions.getValidActions(playerData,creatureData)
        local validActions = {}
        for _, actions in pairs(actions.list) do
            local requirement = actions.requirement
            local isValid = requirement==nil or requirement(playerData,creatureData)
            if isValid then
                validActions[#validActions+1] = actions
            end
        end
        return validActions
    end

return actions