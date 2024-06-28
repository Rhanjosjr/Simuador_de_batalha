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

    ---Realiza print da carta do player escolhido
    ---@param player any
    function utils.printPlayer(player)
        print("-----------------------------------")
        print("| Atributos")
        print("|   Vida         "..utils.getProgressBar(player.health))
        print("|   Ataque       "..utils.getProgressBar(player.attack))
        print("|   Defesa       "..utils.getProgressBar(player.defense))
        print("|   Velocidade   "..utils.getProgressBar(player.speed))
        print("-----------------------------------")
        print()
        



        
    end




    ---Pergunta ao usuario por um numero e retorna o numero
    ---@return number
    function utils.ask()
        --para escrever na mesma linha e aguardar resposta vamos usar o io.write
        io.write("> ")     
        local answer =io.read("*n")   
        return answer
    end




return utils