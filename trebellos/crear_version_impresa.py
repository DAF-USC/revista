import fitz # Instalar o paquete 'pymupdf'
import sys
import os

# O factor de escala 0.96 equivale a reducir o contido un 4 %
FACTOR_ESCALA = 0.96

def version_impresa(pdf_entrada, pdf_saida):
    """
    Reduce o contido dun ficheiro PDF mantendo o tamaño da páxina. Engade unha
    páxina en branco despois da portada e, se o número de páxinas non é
    múltiplo de catro, engade outra páxina en branco antes da contraportada.

    Args:
        pdf_entrada (str): Ruta ao ficheiro PDF de entrada.
        pdf_saida (str): Ruta ao ficheiro PDF de saída.

    Returns:
        None
    """
    # Abrimos o documento PDF orixinal
    doc_orixinal = fitz.open(pdf_entrada)

    # Creamos un documento baleiro
    doc_novo = fitz.open()

    for paxina in doc_orixinal:
        # Tamaño da páxina actual
        tamaño_paxina = paxina.rect

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

    # Páxina inmediatamente despois da portada en branco
    doc_novo.insert_page(
        pno=1,  # posición 2 (os índices comezan en 0)
        width=tamaño_paxina.width,
        height=tamaño_paxina.height
    )

    # O número de páxinas total debe ser múltiplo de 4. Se non se cumpre isto,
    # engadimos páxinas en branco ao final
    if doc_novo.page_count % 4 == 1:
        doc_novo.insert_page(
            pno=doc_novo.page_count - 1,
            width=tamaño_paxina.width,
            height=tamaño_paxina.height
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
