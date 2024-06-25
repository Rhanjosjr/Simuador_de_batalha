local utils = {}



    ---
    ---Função para imprimir a tela inicial do simulador
    ---
    function utils.printHeader()
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

end


---Função pra preencher a barra de status do personagem
---@param atribute any
---@return string
    function utils.getProgressBar(atribute)

    local fullChar = "◼"
    local emptyChar = "◻"

    local result = ""
    for i = 1, 10, 1 do
        if i<= atribute then
            result = result .. fullChar
        else
            result = result .. emptyChar
        end
            
    end
    return result
    end


    ---
    ---Realiz o print do cartão da criatura
    ---@param creature any
    function utils.printCreature(creature)

        local healthRate = math.floor((creature.health / creature.maxHealth)*10)

        
        --Cartão
        print("| "..creature.name)
        print("| ")
        print("| "..creature.description)
        print("| ")
        print("| Atributos")
        print("|   Vida         "..utils.getProgressBar(healthRate))
        print("|   Ataque       "..utils.getProgressBar(creature.attack))
        print("|   Defesa       "..utils.getProgressBar(creature.defense))
        print("|   Velocidade   "..utils.getProgressBar(creature.speed))

    end


return utils