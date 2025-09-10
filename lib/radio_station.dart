// Este ficheiro define o modelo de dados para uma estação de rádio.

class RadioStation {
  // --- Atributos ---
  // Cada estação de rádio terá estas três propriedades.
  // 'final' significa que, uma vez que criamos uma estação, estes valores não podem ser mudados.
  
  final String name;       // O nome da rádio a ser exibido (ex: "Rádio Cidade FM").
  final String streamUrl;  // O link da transmissão ao vivo (streaming).
  final String imageUrl;   // O link para a imagem do logótipo da rádio.

  // --- Construtor ---
  // O construtor é um método especial para criar uma nova "instância" da classe.
  // Usamos 'required' para garantir que nenhuma estação seja criada sem estas informações.
  const RadioStation({
    required this.name,
    required this.streamUrl,
    required this.imageUrl,
  });
}
