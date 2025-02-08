import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:motel_list_test/core/route/app_routes.dart';
import 'package:motel_list_test/domain/entities/motel_entity.dart';
import 'package:motel_list_test/domain/entities/suite_entity.dart';

class MotelCard extends StatelessWidget {
  final MotelEntity motel;

  const MotelCard({
    super.key,
    required this.motel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _MotelInfoHeader(motel: motel),
        _MotelSuiteCarrousel(suites: motel.suites),
      ],
    );
  }
}

class _MotelInfoHeader extends StatelessWidget {
  final MotelEntity motel;

  const _MotelInfoHeader({required this.motel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.network(
                  motel.logo,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    motel.fantasia,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    motel.bairro,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade800,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Colors.amber,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 12,
                            ),
                            Text(
                              motel.media.toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${motel.qtdAvaliacoes} avaliações',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Icon(
                Icons.favorite_outlined,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MotelSuiteCarrousel extends StatelessWidget {
  final List<SuiteEntity> suites;

  const _MotelSuiteCarrousel({
    required this.suites,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: suites.length,
        itemBuilder: (context, index) {
          final suite = suites[index];
          return Column(
            children: [
              _SuiteCarrouselPhotos(suite: suite),
              _SuiteCategoryItems(
                suite: suite,
                onTap: () {
                  _showSuiteDetails(context, suite);
                },
              ),
              _SuitePeriods(suite: suite),
            ],
          );
        },
      ),
    );
  }

  void _showSuiteDetails(BuildContext context, SuiteEntity suite) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          child: Column(
            children: [
              Text(
                suite.nome,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.black87),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                      endIndent: 8,
                    ),
                  ),
                  Text(
                    'principais itens',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                      indent: 8,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: suite.categoriaItens.map(
                  (category) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          category.icone,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          category.nome.toLowerCase(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                      endIndent: 8,
                    ),
                  ),
                  Text(
                    'tem também',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                      indent: 8,
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
              Wrap(
                children: suite.itens
                    .map(
                      (e) => Text('${e.nome}, '),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SuitePeriods extends StatelessWidget {
  final SuiteEntity suite;

  const _SuitePeriods({required this.suite});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: suite.periodos.map((periodo) {
        return Card(
          child: ListTile(
            title: Text(
              periodo.tempoFormatado,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Text(
              NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                  .format(periodo.valor),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade800,
                  ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        );
      }).toList(),
    );
  }
}

class _SuiteCarrouselPhotos extends StatelessWidget {
  const _SuiteCarrouselPhotos({required this.suite});

  final SuiteEntity suite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          AppRoutes.suiteDetails,
          extra: suite,
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  suite.fotos.first,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    suite.nome,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black87,
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

class _SuiteCategoryItems extends StatelessWidget {
  final SuiteEntity suite;
  final VoidCallback onTap;

  const _SuiteCategoryItems({required this.suite, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...suite.categoriaItens.take(4).map(
                (category) => Image.network(
                  category.icone,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  'Ver\nmais',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
