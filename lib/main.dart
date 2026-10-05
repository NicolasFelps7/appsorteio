import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sorteio Fácil',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF155EEF),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const Color azulEscuro = Color(0xFF071E49);
  static const Color azul = Color(0xFF155EEF);
  static const Color azulClaro = Color(0xFFEAF1FF);
  static const Color vermelho = Color(0xFFF04438);
  static const Color fundo = Color(0xFFF4F7FC);
  static const Color textoEscuro = Color(0xFF16223A);

  int totalSorteios = 0;
  String ultimoResultado = 'Nenhum sorteio ainda';

  final List<String> historico = [];

  void registrarResultado(String tipo, String resultado) {
    setState(() {
      totalSorteios++;
      ultimoResultado = resultado;

      historico.insert(
        0,
        '$tipo • $resultado',
      );

      if (historico.length > 6) {
        historico.removeLast();
      }
    });
  }

  void abrirSorteioNomes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SorteioNomesPage(
          aoSortear: (resultado) {
            registrarResultado(
              'Nome',
              resultado,
            );
          },
        ),
      ),
    );
  }

  void abrirSorteioNumeros() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SorteioNumerosPage(
          aoSortear: (resultado) {
            registrarResultado(
              'Número',
              resultado,
            );
          },
        ),
      ),
    );
  }

  Widget cardOpcao({
    required IconData icon,
    required String titulo,
    required String descricao,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: azulClaro,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                icon,
                color: azul,
                size: 28,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: textoEscuro,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    descricao,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF7C879E),
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: Color(0xFF9CA6B8),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // TOPO
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                  24,
                  24,
                  24,
                  32,
                ),
                decoration: const BoxDecoration(
                  color: azulEscuro,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(34),
                    bottomRight: Radius.circular(34),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(
                              alpha: 0.12,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.casino_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),

                        const SizedBox(width: 14),

                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sorteio Fácil',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'Sorteios rápidos e simples',
                              style: TextStyle(
                                color: Color(0xFFB6C9F2),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFF04438),
                            Color(0xFFFF6B35),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SORTEIOS COMPLETOS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.2,
                            ),
                          ),

                          SizedBox(height: 10),

                          Text(
                            'Sorteie nomes e números em segundos.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              height: 1.1,
                            ),
                          ),

                          SizedBox(height: 10),

                          Text(
                            'Ideal para brincadeiras, apresentações, trabalhos e decisões rápidas.',
                            style: TextStyle(
                              color: Color(0xFFFFE5E0),
                              fontSize: 13,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'O que você quer sortear?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: textoEscuro,
                      ),
                    ),

                    const SizedBox(height: 16),

                    cardOpcao(
                      icon: Icons.groups_rounded,
                      titulo: 'Sortear nomes',
                      descricao:
                          'Adicione participantes e escolha um vencedor.',
                      onTap: abrirSorteioNomes,
                    ),

                    const SizedBox(height: 14),

                    cardOpcao(
                      icon: Icons.numbers_rounded,
                      titulo: 'Sortear números',
                      descricao:
                          'Defina um intervalo e gere um número aleatório.',
                      onTap: abrirSorteioNumeros,
                    ),

                    const SizedBox(height: 26),

                    Row(
                      children: [
                        Expanded(
                          child: _cardStatus(
                            titulo: 'Sorteios',
                            valor: '$totalSorteios',
                            icon: Icons.casino_outlined,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: _cardStatus(
                            titulo: 'Último',
                            valor: ultimoResultado,
                            icon: Icons.history_rounded,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 26),

                    if (historico.isNotEmpty) ...[
                      const Text(
                        'Histórico recente',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: textoEscuro,
                        ),
                      ),

                      const SizedBox(height: 14),

                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Column(
                          children: List.generate(
                            historico.length,
                            (index) {
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  backgroundColor: azulClaro,
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                      color: azul,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  historico[index],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardStatus({
    required String titulo,
    required String valor,
    required IconData icon,
  }) {
    return Container(
      height: 125,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: azul,
          ),

          const Spacer(),

          Text(
            valor,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: textoEscuro,
            ),
          ),

          Text(
            titulo,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF8993A7),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SORTEIO DE NOMES
// ============================================================

class SorteioNomesPage extends StatefulWidget {
  final Function(String) aoSortear;

  const SorteioNomesPage({
    super.key,
    required this.aoSortear,
  });

  @override
  State<SorteioNomesPage> createState() =>
      _SorteioNomesPageState();
}

class _SorteioNomesPageState
    extends State<SorteioNomesPage> {
  static const Color azulEscuro = Color(0xFF071E49);
  static const Color azul = Color(0xFF155EEF);
  static const Color fundo = Color(0xFFF4F7FC);

  final TextEditingController nomeController =
      TextEditingController();

  final List<String> nomes = [];

  bool removerDepoisDoSorteio = false;

  void adicionarNome() {
    final nome = nomeController.text.trim();

    if (nome.isEmpty) {
      return;
    }

    setState(() {
      nomes.add(nome);
      nomeController.clear();
    });
  }

  void adicionarLista() {
    showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController();

        return AlertDialog(
          title: const Text(
            'Adicionar vários nomes',
          ),
          content: TextField(
            controller: controller,
            maxLines: 8,
            decoration: const InputDecoration(
              hintText:
                  'Digite um nome por linha:\n\nJoão\nMaria\nPedro\nAna',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),

            ElevatedButton(
              onPressed: () {
                final lista = controller.text
                    .split('\n')
                    .map((nome) => nome.trim())
                    .where((nome) => nome.isNotEmpty)
                    .toList();

                setState(() {
                  nomes.addAll(lista);
                });

                Navigator.pop(context);
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  void sortearNome() {
    if (nomes.isEmpty) {
      return;
    }

    final indice = Random().nextInt(nomes.length);
    final vencedor = nomes[indice];

    widget.aoSortear(vencedor);

    if (removerDepoisDoSorteio) {
      setState(() {
        nomes.removeAt(indice);
      });
    }

    mostrarResultado(
      titulo: 'Nome sorteado!',
      resultado: vencedor,
      emoji: '🎉',
    );
  }

  void mostrarResultado({
    required String titulo,
    required String resultado,
    required String emoji,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  emoji,
                  style: const TextStyle(
                    fontSize: 60,
                  ),
                ),

                const SizedBox(height: 14),

                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Color(0xFF7A8497),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  resultado,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: azulEscuro,
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: azul,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      'CONTINUAR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,

      appBar: AppBar(
        backgroundColor: azulEscuro,
        foregroundColor: Colors.white,
        title: const Text(
          'Sortear nomes',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: azul,
                        borderRadius:
                            BorderRadius.circular(22),
                      ),
                      child: const Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.groups_rounded,
                            color: Colors.white,
                            size: 32,
                          ),

                          SizedBox(height: 12),

                          Text(
                            'Sorteio de participantes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w900,
                            ),
                          ),

                          SizedBox(height: 6),

                          Text(
                            'Adicione os nomes e sorteie um participante.',
                            style: TextStyle(
                              color: Color(0xFFDDE8FF),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    TextField(
                      controller: nomeController,
                      onSubmitted: (_) {
                        adicionarNome();
                      },
                      decoration: InputDecoration(
                        labelText: 'Nome do participante',
                        hintText: 'Ex: Nicolas',
                        prefixIcon: const Icon(
                          Icons.person_add_alt_1_rounded,
                        ),
                        suffixIcon: IconButton(
                          onPressed: adicionarNome,
                          icon: const Icon(
                            Icons.add_circle,
                            color: azul,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: adicionarLista,
                        icon: const Icon(
                          Icons.playlist_add,
                        ),
                        label: const Text(
                          'Adicionar vários nomes',
                        ),
                        style: OutlinedButton.styleFrom(
                          padding:
                              const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Participantes (${nomes.length})',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        if (nomes.isNotEmpty)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                nomes.clear();
                              });
                            },
                            child: const Text(
                              'Limpar',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    if (nomes.isEmpty)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(35),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.people_outline,
                              size: 50,
                              color: Color(0xFFB2B9C7),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Nenhum participante adicionado',
                              style: TextStyle(
                                color: Color(0xFF7E8799),
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      ListView.builder(
                        itemCount: nomes.length,
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 0,
                            margin: const EdgeInsets.only(
                              bottom: 8,
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    const Color(0xFFE8F0FF),
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    color: azul,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                              ),
                              title: Text(
                                nomes[index],
                                style: const TextStyle(
                                  fontWeight:
                                      FontWeight.w700,
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    nomes.removeAt(index);
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                    const SizedBox(height: 10),

                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text(
                        'Remover após sortear',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: const Text(
                        'Evita que a mesma pessoa seja sorteada novamente.',
                      ),
                      value: removerDepoisDoSorteio,
                      onChanged: (valor) {
                        setState(() {
                          removerDepoisDoSorteio = valor;
                        });
                      },
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(
                22,
                15,
                22,
                22,
              ),
              color: Colors.white,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed:
                      nomes.isEmpty ? null : sortearNome,
                  icon: const Icon(
                    Icons.casino_rounded,
                  ),
                  label: const Text(
                    'SORTEAR NOME',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: azul,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SORTEIO DE NÚMEROS
// ============================================================

class SorteioNumerosPage extends StatefulWidget {
  final Function(String) aoSortear;

  const SorteioNumerosPage({
    super.key,
    required this.aoSortear,
  });

  @override
  State<SorteioNumerosPage> createState() =>
      _SorteioNumerosPageState();
}

class _SorteioNumerosPageState
    extends State<SorteioNumerosPage> {
  static const Color azulEscuro = Color(0xFF071E49);
  static const Color azul = Color(0xFF155EEF);
  static const Color fundo = Color(0xFFF4F7FC);

  final TextEditingController minimoController =
      TextEditingController(text: '1');

  final TextEditingController maximoController =
      TextEditingController(text: '100');

  String resultadoAtual = '?';

  void sortearNumero() {
    final minimo =
        int.tryParse(minimoController.text.trim());

    final maximo =
        int.tryParse(maximoController.text.trim());

    if (minimo == null || maximo == null) {
      mostrarErro(
        'Digite números válidos.',
      );
      return;
    }

    if (minimo >= maximo) {
      mostrarErro(
        'O número máximo precisa ser maior que o mínimo.',
      );
      return;
    }

    final numero =
        minimo + Random().nextInt(maximo - minimo + 1);

    setState(() {
      resultadoAtual = '$numero';
    });

    widget.aoSortear('$numero');

    mostrarResultado(numero);
  }

  void mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        backgroundColor: Colors.red,
      ),
    );
  }

  void mostrarResultado(int numero) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '🎲',
                  style: TextStyle(
                    fontSize: 55,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'Número sorteado',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFF7D879B),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  '$numero',
                  style: const TextStyle(
                    fontSize: 55,
                    color: azul,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: azul,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      'CONTINUAR',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    minimoController.dispose();
    maximoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,

      appBar: AppBar(
        backgroundColor: azulEscuro,
        foregroundColor: Colors.white,
        title: const Text(
          'Sortear números',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: azul,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.numbers_rounded,
                      color: Colors.white,
                      size: 32,
                    ),

                    SizedBox(height: 12),

                    Text(
                      'Sorteio de números',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    SizedBox(height: 6),

                    Text(
                      'Defina o intervalo e deixe o app escolher.',
                      style: TextStyle(
                        color: Color(0xFFDDE8FF),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: minimoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Mínimo',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: TextField(
                      controller: maximoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Máximo',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              Container(
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: azul.withValues(alpha: 0.15),
                      blurRadius: 35,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    resultadoAtual,
                    style: const TextStyle(
                      fontSize: 60,
                      color: azulEscuro,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: sortearNumero,
                  icon: const Icon(
                    Icons.casino_rounded,
                  ),
                  label: const Text(
                    'SORTEAR NÚMERO',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: azul,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}