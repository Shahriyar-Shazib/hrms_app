import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../application/houses_controller.dart';
import '../data/models/house.dart';

class HouseDetailScreen extends ConsumerWidget {
  const HouseDetailScreen({super.key, required this.houseId});

  final String houseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(houseDetailProvider(houseId));

    return Scaffold(
      appBar: AppBar(
        title: Text(state.asData?.value?.name ?? 'House'),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(e is ApiException ? e.message : 'Failed to load house'),
        ),
        data: (house) {
          if (house == null) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.cloud_off, size: 48),
                    SizedBox(height: 12),
                    Text(
                      'House not found',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Connect to the internet to load this house.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
          return _HouseDetail(house: house);
        },
      ),
    );
  }
}

class _HouseDetail extends StatelessWidget {
  const _HouseDetail({required this.house});

  final House house;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _InfoCard(children: [
          _Field('Name', house.name),
          if (house.address != null) _Field('Address', house.address!),
          if (house.city != null) _Field('City', house.city!),
          if (house.totalFloors != null)
            _Field('Total Floors', '${house.totalFloors}'),
          if (house.notes != null) _Field('Notes', house.notes!),
        ]),
        const SizedBox(height: 12),
        _InfoCard(children: [
          _Field('Created', house.createdAt),
          _Field('Updated', house.updatedAt),
        ]),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(children: children),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.outline),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
