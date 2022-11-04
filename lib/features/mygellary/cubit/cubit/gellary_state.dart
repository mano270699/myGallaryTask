part of 'gellary_cubit.dart';

abstract class GellaryState extends Equatable {
  const GellaryState();

  @override
  List<Object> get props => [];
}

class GellaryInitial extends GellaryState {}

class GellaryLoading extends GellaryState {}

class GellaryLoaded extends GellaryState {}

class GellaryFailed extends GellaryState {}

class UploadGellaryLoading extends GellaryState {}

class GellaryUpLoaded extends GellaryState {}

class GellaryUploadFailed extends GellaryState {}

class GellaryPickedFromGellary extends GellaryState {}
