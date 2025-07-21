-- Este é un arquivo onde podemos meter funcións escritas con Lua. Podemos
-- chamalas despois no documento con \directlua{\minha_funcion()}
--
-- Documentación de Lua: https://www.lua.org/manual/5.3/
-- Documentacion de Luatex: https://ctan.org/pkg/luatex

-- :FACER: pode que mereza a pena sustituir esto por 'luagit' de ctan.
-- :FACER: algún modo de saber se estamos en 'dirty state' ?
-- :FACER: parece que hai un erro a veces, ao poñernos en 'detached state', pode ser polos regexes?
-- :FACER: qué pasa se usamos 'sparse-checkout' ?
function gitInfo()
    --[[
    Esta funcións devolve a rama e o hash da HEAD actual de git. Para dito fin,
    busca nos directorios de git (.git e similares) para obter o nome da rama
    na que estamos, e con esa información obter o hash da última contribución
    Funciona con 2 estructuras:

    .git/       | o normal, tendo os arquivos no mesmo directorio que .git/
    ficheiro    | e sendo .git/ un directorio con HEAD, config, refs/, etc.
    ficheiro2   |
    etc         |


    .git        | parecido, pero aquí .git é un ARQUIVO que contén o texto:
    ficheiro    | "gitdir: /ruta/ata/meu/PROXECTO/worktrees/WT3"
    ficheiro2   |
    etc         |

    Sí, parecen estructuras iguais, pero o feito de que nun caso .git sexa un
    directorio e no outro un ficheiro normal, é fundamentalmente diferente, e
    cambia o modo de buscar a información que queremos
    ]]

    -- Comprobamos se .git é un directorio (99% dos casos) ou un ficheiro (e.g.
    -- usando worktrees) Alternativas a pelo:
    -- https://www.geeks3d.com/hacklab/20210901/how-to-check-if-a-directory-exists-in-lua-and-in-python/
    -- https://stackoverflow.com/questions/1340230/check-if-directory-exists-in-lua/40195356#40195356
    -- Usando LFS (Lua File System) é sinxelo.
    -- Véxase: https://lunarmodules.github.io/luafilesystem/manual.html
    local tipo, _ = lfs.attributes(".git","mode")

    -- Se non se atopa ou hai algún erro, mostrámolo e rematamos a función
    if tipo == nil then tex.print("[SIN .GIT]") return end

    -- O caso típico, temos o espazo de traballo cos nosos ficheiros e ao lado
    -- o repositorio en .git/ o cal é un directorio
    if tipo == "directory" then

        -- Intento abrir o ficheiro HEAD
        local HEAD = io.open(".git/HEAD")

        -- Se non abre, rematamos o traballo
        if HEAD == nil then tex.print("HEAD non abre") return end

        -- Lemos a primeira liña con 'l', ousexa só unha liña do arquivo
        local info = HEAD:read("l")
        -- E cerramos o ficheiro
        HEAD:close()

        -- .git/HEAD ten unha liña como -> ref: refs/heads/principal
        -- Uso algo de regex para coller a ultima palabra, que é o nome da rama
        -- véxase https://www.lua.org/manual/5.3/manual.html#pdf-string.match
        local rama = string.match( info , "/([^/]+)$" )

        -- O nome da rama en xeral non ten caracteres raros, o máis comun pode
        -- ser o '_', asique o escapo. Supoño que estaría ben facelo con máis
        -- caracteres especiais de TeX, pero por agora val
        local rama_escapada = string.gsub(rama, "_", "\\_")

        -- E imprimímola directamente. Engado un ':' porque queda bonito
        tex.sprint(rama_escapada .. ":")

        -- A ruta para obter o hash, soe estar en .git/refs/heads/[rama]/
        local ficheiro_HASH = io.open(".git/refs/heads/" .. rama, "r")

        -- Outra comprobacion, se non se abre
        if ficheiro_HASH == nil then

            -- Pode ocurrir, que ao facer cousas como 'git gc' ou
            -- 'maintenance', ou rulando 'git pack-refs', en vez de ter as
            -- cousas en .git/refs/HEADS/[rama]/ estén en .git/packed-refs.
            -- Véxase: https://git-scm.com/docs/git-pack-refs
            --
            -- IMPORTANTE: para máis lio, se temos 'packed-refs', e creamos
            -- referencias NOVAS, estas gárdanse en .git/refs/heads/[rama] É
            -- dicir, podemos ter as referencias en dous sitios distintos. Non
            -- é problema, porque queremos a última referencia, a cal está en
            -- .git/refs/heads/[rama], o cal é o PRIMEIRO sitio que buscamos.
            -- Asique se existe, escollemos o correcto. Creo.
            ficheiro_HASH = io.open(".git/packed-refs","r")

            -- Se nin así funciona, rematamos
            if ficheiro_HASH == nil then tex.sprint("HASH non abre") return end

            -- Lemos o packed-refs. Usase 'a' porque son varias liñas.
            -- IMPORTANTE: lendo con "a" todo o contido do arquivo pasa a ser
            -- unha soa cadena. Se o ficheiro ten varias liñas, concaténanse.
            -- Hai que telo enconta logo usando regex, dado que ^ e $ son máis
            -- delicados
            info = ficheiro_HASH:read("a")
            ficheiro_HASH:close()

            -- O ficheiro 'packed-refs' ten varias liñas como:
            -- 152204658ccc8c4126477370cdfb5de8b49348ab refs/heads/[rama]
            -- .-            -> coincide con calquera caracter, a menor cantidade de veces
            -- (%x+)         -> coincide con caracteres hex, mínimo un
            -- %srefs/heads/ -> espazo e logo o literal "refs/heads/"
            -- Como comentei antes, non hai que usar ^ nin $ porque inda que o
            -- que buscamos no arquivo esté agarrado ao comezo ^ ou ao final $,
            -- esa estructura desfaise porque ao ler o arquivo xuntanse todas
            -- as liñas!
            local hash = string.match( info , ".-(%x+)%srefs/heads/"..rama )

            -- O hash son 40 caracteres, collendo os 7 primeiros debería chegar
            -- e.g. 5fde70ec
            tex.sprint(string.sub(hash, 1, 7))
            return

        end

        -- No caso de que si teñamos as cousas en .git/refs/HEADS/[rama]/ ,
        -- entón o 'if' anterior non se executa, e rulase esto de aquí.
        -- En principio, lendo con 'l' é suficiente, o contido será o hash de
        -- 40 caracteres simplemente
        info = ficheiro_HASH:read("l")
        ficheiro_HASH:close()

        tex.sprint(string.sub(info, 1, 7))
        return

    -- No caso de que temos nun worktree de git. Véxase:
    -- https://git-scm.com/docs/git-worktree
    -- Pode que haxa outros casos cun .git que sea un arquivo, non os coñezo
    elseif tipo == "file" then

        -- Primeiro, intento abrir .git como se fose un arquivo.
        local GIT = io.open(".git")

        -- Se non se pode, rematamos
        if GIT == nil then tex.print("GIT non abre") return end

        -- Lemos os contidos
        local info = GIT:read("l")
        GIT:close()

        -- Ao usar worktrees, .git é un ficheiro que contén, por exemplo:
        -- gitdir: /home/david/.deivis_datos/proxectos/uni/revista/worktrees/WT3
        -- onde o directorio base do repositorio é "revista"
        --
        -- Uso regex e dúas capturas para coller a ruta correcta ao repo (que
        -- sería análogo a onde está .git nun repositorio normal) e gardoo en
        -- 'ruta_BASE'. Tamén gardo o nome do worktree en 'worktree' porque
        -- logo fará falta
        local _, _, ruta_BASE, worktree = string.find( info, "^gitdir:%s(.-)/worktrees/([^/]+)$" )

        -- ruta_BASE: directorio onde está o repositorio, con HEAD (non do worktree), config, refs/, etc.
        -- ruta_BASE/wortrees/[nome worktree]: dentro está o HEAD do propio Worktree que estamos usando
        -- xa sei que é un rollo, non me culpedes, foi Torvalds quen creou esto
        local HEAD = io.open(ruta_BASE .. "/worktrees/" .. worktree .. "/HEAD")

        -- Abrir, checkear, ler... como antes
        if HEAD == nil then tex.sprint("HEAD non abre") return end

        local info = HEAD:read("l")
        HEAD:close()

        local rama = string.match( info , "/([^/]+)$" )

        local rama_escapada = string.gsub(rama, "_", "\\_")
        tex.sprint(rama_escapada .. ":")

        -- Para o hash, en ruta_BASE/
        local ficheiro_HASH = io.open(ruta_BASE .. "/refs/heads/" .. rama, "r")

        -- Outra comprobacion, como antes
        if ficheiro_HASH == nil then

            -- O mesmo de antes, se temos 'packed-refs'
            ficheiro_HASH = io.open(ruta_BASE .. "/packed-refs","r")
            if ficheiro_HASH == nil then tex.sprint("HASH non abre") return end

            -- Lemos o packed-refs
            info = ficheiro_HASH:read("a")
            ficheiro_HASH:close()

            local hash = string.match( info , ".-(%x+)%srefs/heads/"..rama )

            tex.sprint(string.sub(hash, 1, 7))
            return

        end

        -- No caso de non ter packed-refs
        info = ficheiro_HASH:read("l")
        ficheiro_HASH:close()

        tex.sprint(string.sub(info, 1, 7))
        return

    end

end
