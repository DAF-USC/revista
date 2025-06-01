
-- Devolve a rama e o hash da HEAD actual de git
function gitInfo()

    -- Onde está a información
    local ruta_HEAD = ".git/HEAD"

    -- Probamos a abrir o arquivo
    local ficheiro_HEAD = io.open(ruta_HEAD, 'r')

    -- Un pequeno 'edgecase', no caso de que o usuario esté a manexar o
    -- repositorio como se fose de tipo 'bare'
    if ficheiro_HEAD == nil then
        tex.print("(sin repo)")
        return
    end

    -- Iteramos polas liñas. Non me gusta facelo así, pero non
    -- me saliu de ningún outro modo. Non creo que haxa problema, dado que
    -- .git/HEAD debería ter so 1 liña
    for linha in io.lines(ruta_HEAD) do
        -- .git/HEAD ten unha liña como -> ref: refs/heads/principal
        -- Uso algo de regex para coller a ultima palabra, que é o nome da rama
        -- véxase https://www.lua.org/pil/20.1.html
        _, _, rama = string.find( linha , "/([^/]+)$" )

        -- E mostrámola (engadolle :  ao final porque queda bonito)
        tex.sprint(rama .. ":")
    end

    -- A ruta para obter o hash, soe estar en .git/refs/heads/[rama]/
    local ruta_HASH = ".git/refs/heads/" .. rama

    -- Abrimos o ficheiro
    local ficheiro_HASH = io.open(ruta_HASH, "r")

    -- Igual que antes, chequeamos primeiro que se abriu
    if ficheiro_HASH == nil then
        tex.print("(sin hash)")
        return
    end

    -- Iterar para ler
    for hash in io.lines(ruta_HASH) do
        -- O hash son 40 caracteres, collendo os 7 primeiros debería chegar. E
        -- imprimimolo directamente
        tex.sprint(string.sub(hash, 1, 7))
    end

end
