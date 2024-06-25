local config = {}
    ---
    ---Função para ativar o utf-8 aceitando emojis e acentos
    ---
    function config.enableUtf8()
        os.execute("chcp 65001")
        os.execute("cls")
    end

return config