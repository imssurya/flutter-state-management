import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

@immutable
class Entity extends Equatable {
  final String id;

  Entity([String id, List props = const []])
      : this.id = id ?? Uuid().v4(),
        super([id]..addAll(props));
}

@immutable
abstract class EntityEvent<E extends Entity> extends Equatable {
  EntityEvent([List props = const []]) : super(props);
}

@immutable
abstract class EntityState<E extends Entity> extends Equatable {
  final Map<String, E> dictionary;
  final List<String> ids;
  final List<E> entities;

  EntityState([this.entities = const [], List props = const []])
      : dictionary = Map.fromIterable(entities,
            key: (entity) => entity.id, value: (entity) => entity),
        ids = List.from(entities.map((entity) => entity.id)),
        super([entities]..addAll(props));
}

abstract class EntityBloc<E extends EntityEvent, S extends EntityState>
    extends Bloc<E, S> {}
