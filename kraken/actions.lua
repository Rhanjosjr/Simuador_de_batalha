--dependencias
local utils = require "utils"

local actions = {}

    actions.list = {}



---cria uma lista de ações armazenada internamente
    function actions.build()
        --reset list
        actions.list={}

        local bodyAttack = {
            description = "Atacar com o corpo.",
            requirement = nil,
            execute = function(playerData,creatureData)
                --1. definir chance de sucesso(é invertido em relação ao do player)
                --baseado na velocidade da criatura
                local successChance = playerData.speed == 0 and 1 or creatureData.speed / playerData.speed
                --para verificar se ocorreu sucesso ou nao no ataque, e comparado com um random de 0 a 1 para verificar o sucesso
                local sucess = math.random() <= successChance

                --2. calcular dano
                local rawDamege = creatureData.attack - (math.random()*playerData.defense)
                --gera um resultado de dano entre -2 e 6, para evitar o dano negativo, faremos, tambemlembrar que temos que arredondar pra cima o valor
                local damage = math.max(1,math.ceil(rawDamege))
                
                --3. apresentar resutados como print
                if sucess then
                    print(string.format(" %s atacou a %s e deu %d pontos de dano",creatureData.name,playerData.name,damage))
                    --para aplicar o grafico demonstrando a queda de vida da criatura
                    local healthRate = math.floor((playerData.health / playerData.maxHealth)*10)
                    
                    --4. aplicar o dano em caso de sucesso  
                    playerData.health = playerData.health - damage
                    print(string.format("%s:%s",playerData.name,utils.getProgressBar(healthRate   )))
                else
                    print(string.format("******%s tentou atacar, mas errou!******",creatureData.name))
                end
                            
            end
        }
        --ataque com tentaculo
        local tentacleAttack = {
            description = "Ataque com tentaculos",
            requirement = nil,
            execute = function(playerData,creatureData)

                --2. calcular dano
                local rawDamege = creatureData.attack - (math.random()*playerData.defense)
                local damage = math.max(1,math.ceil(rawDamege*0.3))
                
                --3aplica o dano
                playerData.health = playerData.health - damage
                --apresenta o resultado
                print(string.format(" %s usou um ataque com tentaculo e deu %d pontos de dano",creatureData.name,damage))
                local healthRate = math.floor((playerData.health / playerData.maxHealth)*10)
                print(string.format("%s:%s",playerData.name,utils.getProgressBar(healthRate)))  
            end

        }

         


        --aguardar
        local waitAttack = {
            description = "Aguardar",
            requirement = nil,
            execute = function(playerData,creatureData)

               
                --apresenta o resultado
                print(string.format(" %s decidiu aguardar e não fez nada!!!",creatureData.name))
                local healthRate = math.floor((playerData.health / playerData.maxHealth)*10)
                print(string.format("%s:%s",playerData.name,utils.getProgressBar(healthRate)))  
            end

        }


        --populate list
        actions.list[#actions.list+1] = bodyAttack
        actions.list[#actions.list+1] = tentacleAttack
        actions.list[#actions.list+1] = waitAttack
        
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