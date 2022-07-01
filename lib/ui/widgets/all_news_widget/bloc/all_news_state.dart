import 'package:equatable/equatable.dart';
import '../../../../repository/models/everything.dart';

enum AllNewsStatus { initial, loading, complete, error }

extension AllNewsStatusX on AllNewsStatus {
  bool get isInitial => this == AllNewsStatus.initial;
  bool get isLoading => this == AllNewsStatus.loading;
  bool get isComplete => this == AllNewsStatus.complete;
  bool get isError => this == AllNewsStatus.error;
}

class AllNewsState extends Equatable {
  const AllNewsState({this.allStories, this.status = AllNewsStatus.initial});
  final AllNewsStatus? status;
  final Everything? allStories;

  @override
  List<Object?> get props => [status, allStories];

  AllNewsState copyWith({AllNewsStatus? newStatus, Everything? stories}) {
    return AllNewsState(
        status: newStatus ?? status, allStories: stories ?? allStories);
  }
}
