local player = require ("player.player")
local playerTwo = require ("playerTwo.playerTwo")
local playerThree = require ("playerThree.playerThree")
local colossus    = require ("colossus.colossus")
local kraken      = require ("kraken.kraken")

local config = {}

    local listPlayer = {}
        listPlayer[1] = player
        listPlayer[2] = playerTwo
        listPlayer[3] = playerThree

    local listBoss = {}
        listBoss[1]=colossus
        listBoss[2]=kraken

    ---
    ---Função para ativar o utf-8 aceitando emojis e acentos
    ---
    function config.enableUtf8()
        os.execute("chcp 65001")
        os.execute("cls")
    end

    ---Função para escolher com qual personagem o player irá jogar
    ---@return string
    function config.whichPlayer()
        local number
        --para verificar se o numero digitado e valido
        while true do
            print("Escolha um dos herois para jogar:")
            for i, name in pairs(listPlayer) do
                print(string.format("%d para %s",i,name.name))
            end
            io.write(" >_")
            number = io.read("*n")
            --se o numro esta entre 1 - 3
            if (number >=1) and (number <=3) then
            break
            else
                print("Escolha inválida tente novamente!")
            end
        end

            local choice = listPlayer[number].numberPlay  
      
        return choice
    end

    ---Função que escolhe alternadamente com boss irá ser enfrentado
    ---@return string
    function config.whichBoss()
    
        local number = math.random(2)
        local choice = listBoss[number].numberBoss

        return choice
    end

   

    





return config