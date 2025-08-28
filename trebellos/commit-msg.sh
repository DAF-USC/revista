#!/usr/bin/env bash

# Fonte: https://github.com/iuricode/padroes-de-commits

# Ruta ao ficheiro da mensaxe de commit (fornecido por Git)
COMMIT_MSG_FILE=$1

# Le a mensaxe de commit do ficheiro
COMMIT_MSG=$(cat "$COMMIT_MSG_FILE")

CONVENTIONAL_COMMIT_REGEX='^(feat|fix|docs|style|refactor|test|chore|build|ci|perf|revert)(\([a-zA-Z0-9_.-]+\))?(!)?:\s.*$'

# Comproba se a mensaxe de commit cadra co regex
if ! [[ $COMMIT_MSG =~ $CONVENTIONAL_COMMIT_REGEX ]]; then
    echo "ERRO: A mensaxe de commit non segue o formato dos Conventional Commits."
    echo
    echo "Cómpre utilizar mensaxes de commit co seguinte formato:"
    echo "  <tipo>(<contexto opcional>): <descrición>"
    echo
    echo "Os tipos válidos son:"
    echo "  feat:     Engadir unha nova funcionalidade ou artigo."
    echo "  fix:      Corrección dun bug ou errata."
    echo "  docs:     Cambios na documentación (README, comentarios, etc.)."
    echo "  style:    Cambios de estilo no código (formato, espazos, punto e coma, etc.)."
    echo "  refactor: Reestruturación do código sen engadir funcionalidades nin corrixir bugs."
    echo "  perf:     Melloras no rendemento."
    echo "  build:    Cambios que afectan o sistema de compilación ou dependencias externas."
    echo "  chore:    Tarefas de mantemento que non afectan ao código principal (scripts, hooks, .gitignore, etc.)."
    echo "  test:     Engadir ou actualizar tests."
    echo "  ci:       Cambios nos ficheiros de configuración de integración continua (CI)."
    echo "  revert:   Reverter un commit anterior."
    echo
    echo "Nota:"
    echo "  O contexto é opcional, e pode indicar a revista ou ficheiro afectado."
    echo "  Os commits que introduzan cambios críticos deben ser indicados cun ! antes do :"
    echo
    echo "Exemplos:"
    echo "  feat(002): engadir artigo DARKO"
    echo "  fix(003): corrixir erratas varios artigos"
    echo "  fix(revista)!: definición imaxe portada"
    echo "  docs(readme): actualizar instrucións de instalación"
    echo
    exit 1
fi

exit 0
