# Ollo! Aseguramos que o script funciona con Python 3.11.9 e 'pymupdf==1.26.7',
# mais pode que non funcione con outras versións do paquete.

import fitz
import sys
import os

# O factor de escala 0.96 equivale a reducir o contido un 4 %
FACTOR_ESCALA = 0.96
DESPRAZAMENTO_MARXES = 15 # Desprazamento lateral para a encadernación en px

def version_impresa(pdf_entrada, pdf_saida):
    """
    Reduce o contido dun ficheiro PDF mantendo o tamaño da páxina consonte un
    factor de escala. Engade páxinas en branco ata que o ficheiro resultante
    teña un número de páxinas múltiplo de catro. Orde de inserción: despois da
    portada, antes da contraportada e despois do índice.

    Args:
        pdf_entrada (str): Ruta ao ficheiro PDF de entrada.
        pdf_saida (str): Ruta ao ficheiro PDF de saída.

    Returns:
        None
    """
    # Abrimos o documento PDF orixinal
    doc_orixinal = fitz.open(pdf_entrada)
    # Tamaño das páxinas
    tamaño_paxina = doc_orixinal[0].rect

    # Páxinas en branco necesarias para completar o múltiplo de 4
    faltan = (4 - (doc_orixinal.page_count % 4)) % 4

    # Engadimos páxinas na seguinte orde: despois da portada, antes da
    # contraportada e despois do índice

    # Nota: o valor doc_novo.page_count calcúlase antes de inserir unha páxina
    # na posición 1, tras isto o tamaño total do PDF é page_count + 1. Polo que
    # usamos doc_novo.page_count para a páxina anterior á contraportada en
    # lugar de doc_novo.page_count - 1.

    posibeis_posicions = [1, doc_orixinal.page_count, 3]
    for pos in range(faltan):
        doc_orixinal.insert_page(pno=posibeis_posicions[pos],
                             width=tamaño_paxina.width,
                             height=tamaño_paxina.height)

    # Gardamos a nova posición do índice, no caso de que se modificase
    pos_indice = 2 if faltan != 0 else 1

    # Creamos un documento baleiro
    doc_novo = fitz.open()

    for num, paxina in enumerate(doc_orixinal):

        # Nova páxina co mesmo tamaño
        paxina_nova = doc_novo.new_page(
            width=tamaño_paxina.width,
            height=tamaño_paxina.height
        )

        # Calculamos o novo tamaño tras aplicar a escala
        ancho_escalado = tamaño_paxina.width * FACTOR_ESCALA
        alto_escalado = tamaño_paxina.height * FACTOR_ESCALA

        # Calculamos os desprazamentos para centrar o contido
        desprazamento_x = (tamaño_paxina.width - ancho_escalado) / 2
        desprazamento_y = (tamaño_paxina.height - alto_escalado) / 2

        # Desprazamento para marxes asimétricas
        # Excluímos portada (0), índice (pos_indice) e contraportada (total - 1)
        if num not in (0, pos_indice, doc_orixinal.page_count - 1):
            if num % 2 != 0:  # Índices impares corresponden a páxinas pares (dereita)
                desprazamento_x += DESPRAZAMENTO_MARXES
            else:           # Páxina par (esquerda)
                desprazamento_x -= DESPRAZAMENTO_MARXES

        # Rectángulo onde se colocará o contido escalado
        rectangulo_destino = fitz.Rect(
            desprazamento_x,
            desprazamento_y,
            desprazamento_x + ancho_escalado,
            desprazamento_y + alto_escalado
        )

        # Inserimos o contido da páxina orixinal escalado e centrado na nova
        # páxina
        paxina_nova.show_pdf_page(
            rectangulo_destino,
            doc_orixinal,
            paxina.number
        )


    # Gardamos o documento PDF final
    doc_novo.save(pdf_saida)

    # Pechamos o documento
    doc_orixinal.close()
    doc_novo.close()


def obter_pdf_saida(pdf_entrada):
    nome_base, extension = os.path.splitext(pdf_entrada)
    return f"{nome_base}_impresa{extension}"

def main():
    if len(sys.argv) not in (2, 3):
        print("Uso:")
        print("  python version_impresa.py <pdf_entrada> [pdf_saida]")
        sys.exit(1)

    pdf_entrada = sys.argv[1]

    if len(sys.argv) == 3:
        pdf_saida = sys.argv[2]
    else:
        pdf_saida = obter_pdf_saida(pdf_entrada)

    version_impresa(pdf_entrada, pdf_saida)

    print(f"PDF xerado correctamente: {pdf_saida}")


if __name__ == "__main__":
    main()
