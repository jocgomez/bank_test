import 'package:bank_test/domain/models/account.dart';
import 'package:bank_test/domain/models/account_info.dart';
import 'package:bank_test/view_model.dart';

class HomeStatus extends ViewStatus {
  final bool isLoading;
  final AccountInfo accountInfo;
  final List<Account> savedAccounts;
  final bool ascending;
  final bool descending;

  HomeStatus({
    required this.isLoading,
    required this.accountInfo,
    required this.savedAccounts,
    required this.ascending,
    required this.descending,
  });

  HomeStatus copyWith({
    bool? isLoading,
    AccountInfo? accountInfo,
    List<Account>? savedAccounts,
    bool? ascending,
    bool? descending,
  }) {
    return HomeStatus(
      isLoading: isLoading ?? this.isLoading,
      accountInfo: accountInfo ?? this.accountInfo,
      savedAccounts: savedAccounts ?? this.savedAccounts,
      ascending: ascending ?? this.ascending,
      descending: descending ?? this.descending,
    );
  }
}
