-- Este é un arquivo onde podemos meter funcións escritas con Lua. Podemos
-- chamalas despois no documento con \directlua{\minha_funcion()}
--
-- documentacion de Luatex: https://ctan.org/pkg/luatex

--[[
Devolve a rama e o hash da HEAD actual de git. Funciona con 2 estructuras:

.git/           | o normal, tendo os arquivos no mesmo directorio que .git/
worktree        |

HEAD            | tendo un 'bare repository', e dentro deste varios worktrees,
config          | os que aquí chamo meu_worktree_1,2,3/
refs/           |
lfs/            |
info/           |
branches/       |
meu_worktree_1/ |
meu_worktree_2/ |
meu_worktree_3/ |
(etc.)          |
]]
function gitInfo()
    -- Onde está o repositorio. En xeral debería ser .git/ pero hai casos
    -- exceptionais
    local ruta_REPO = ".git"
    -- Esta é a localización do repositorio no caso de usar 'bare repos',
    -- inicializo co mesmo valor, por agora
    local ruta_BARE = ruta_REPO
    -- Primeiro, intento abrir .git como se fose un arquivo. É posible, por
    -- exemplo, se estamos usando worktrees (como é meu caso)
    local GIT = io.open(ruta_REPO,'r')
    -- No caso de poder abrilo, supoño que tamos cun worktree dentro dun 'bare
    -- repo'. Todo este bloque son comprobacións e voltas para coller o
    -- directorio onde está o arquivo HEAD correcto.
    if GIT ~= nil then
        -- Unhas variables que encho logo
        local aux, WT
        -- Itero polas liñas do arquivo .git, que non me gusta pero non
        -- encontrei outro modo
        for linha in io.lines(ruta_REPO) do aux = linha end
        -- Ao usar worktrees, .git é un ficheiro que contén, por exemplo:
        -- gitdir: /home/david/.deivis_datos/proxectos/uni/revista/worktrees/WT3
        --
        -- Uso regex e dúas capturas para coller a ruta correcta ao bare repo
        -- (que sería análogo a onde está .git nun repositorio normal) e gardoo
        -- en 'ruta_BARE'. Tamén gardo o nome do worktree en 'WT' porque logo
        -- fará falta
        --
        -- véxase https://www.lua.org/pil/20.1.html para o tema de string.find
        _, _, ruta_BARE, WT = string.find( aux, "^gitdir:%s(.-)/worktrees/([^/]+)$" )

        -- Supoñendo que todo fose ben, 'ruta_BARE' ten que ter a ruta onde
        -- está colocado o bare repo, e 'WT' o nome do worktree no que estamos.
        -- Nestes casos a ruta ao arquivo HEAD é diferente:
        -- /home/david/.deivis_datos/proxectos/uni/revista/worktrees/meu_worktree/HEAD
        -- ousexa [ruta_bare]/wortrees/[nome worktree]
        ruta_REPO = ruta_BARE .. "/worktrees/" .. WT
    end

    -- Onde está a información.
    --
    -- Nun repo normal, non se executa o 'if' anterior, polo que ruta_REPO vale
    -- ".git" e entón ruta_HEAD vale ".git/HEAD", o cal é a situacion estándar.
    --
    -- No caso de estar nun wortree dentro dun bare repo. 'ruta_REPO' será algo
    -- como /home/ruta/ata/o/bare/worktrees/meu_worktree. É o que comentei
    -- antes
    local ruta_HEAD = ruta_REPO .. "/HEAD"

    -- Probamos a abrir o arquivo HEAD
    local ficheiro_HEAD = io.open(ruta_HEAD, 'r')

    -- Un pequeno 'edgecase', se non se pode abrir o arquivo
    if ficheiro_HEAD == nil then
        tex.print("(sin repo)")
        return
    end

    -- Iteramos polas liñas de HEAD.
    for linha in io.lines(ruta_HEAD) do
        -- HEAD ten unha liña como -> ref: refs/heads/principal
        -- Uso algo de regex para coller a ultima palabra, que é o nome da rama
        _, _, rama = string.find( linha , "/([^/]+)$" )

        -- O nome da rama en xeral non ten caracteres raros, o máis comun pode
        -- ser o '_', asique o escapo. Supoño que estaría ben facelo con máis
        -- caracteres especiais de TeX, pero por agora val
        rama_escapada = string.gsub(rama, "_", "\\_")

        -- E mostrámola (engadolle :  ao final porque queda bonito)
        tex.sprint(rama_escapada .. ":")
    end

    -- A ruta para obter o hash, soe estar en .git/refs/heads/[rama]/ pero teño
    -- en conta que podemos estar con worktrees, asique en vez de .git, uso
    -- ruta_BARE. No caso de ter un repo normal, o bloque 'if' grande non se
    -- executa, polo que ruta_BARE ten o valor de '.git'. Se sí se executa,
    -- entón ten o valor da posicion do repositorio BARE. Espero non estar
    -- facéndome un lio cos nomes :(
    local ruta_HASH = ruta_BARE .. "/refs/heads/" .. rama

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
