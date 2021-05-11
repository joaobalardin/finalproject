class PositionUtil {
  static findPosition(String valorAnterior, String valorAtual, int posicaoAnterior){
    if(valorAtual.startsWith(valorAnterior))
      return posicaoAnterior;
    if(valorAnterior.startsWith(valorAtual))
      return posicaoAnterior - (valorAnterior.length - valorAtual.length);
    return posicaoAnterior;
  }
}