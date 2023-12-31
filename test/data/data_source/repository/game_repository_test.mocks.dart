// Mocks generated by Mockito 5.4.2 from annotations
// in test_assesment/test/data/data_source/repository/game_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:mockito/mockito.dart' as _i1;
import 'package:test_assesment/core/common/network_checker.dart' as _i12;
import 'package:test_assesment/features/data/data_sources/locale/game_local_data_source.dart'
    as _i9;
import 'package:test_assesment/features/data/data_sources/remote/game_remote_data_source.dart'
    as _i7;
import 'package:test_assesment/features/data/data_sources/remote/models/creator_model.dart'
    as _i4;
import 'package:test_assesment/features/data/data_sources/remote/models/developer_data_model.dart'
    as _i6;
import 'package:test_assesment/features/data/data_sources/remote/models/developer_model.dart'
    as _i5;
import 'package:test_assesment/features/data/data_sources/remote/models/game_detail_model.dart'
    as _i3;
import 'package:test_assesment/features/data/data_sources/remote/models/game_model.dart'
    as _i2;
import 'package:test_assesment/features/domain/entities/creator_entity.dart'
    as _i11;
import 'package:test_assesment/features/domain/entities/game_data_entity.dart'
    as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGameModel_0 extends _i1.SmartFake implements _i2.GameModel {
  _FakeGameModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGameDetailModel_1 extends _i1.SmartFake
    implements _i3.GameDetailModel {
  _FakeGameDetailModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCreatorModel_2 extends _i1.SmartFake implements _i4.CreatorModel {
  _FakeCreatorModel_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDeveloperModel_3 extends _i1.SmartFake
    implements _i5.DeveloperModel {
  _FakeDeveloperModel_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDeveloperDataModel_4 extends _i1.SmartFake
    implements _i6.DeveloperDataModel {
  _FakeDeveloperDataModel_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GameRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockGameRemoteDataSource extends _i1.Mock
    implements _i7.GameRemoteDataSource {
  @override
  _i8.Future<_i2.GameModel> getAllGames({String? page}) => (super.noSuchMethod(
        Invocation.method(
          #getAllGames,
          [],
          {#page: page},
        ),
        returnValue: _i8.Future<_i2.GameModel>.value(_FakeGameModel_0(
          this,
          Invocation.method(
            #getAllGames,
            [],
            {#page: page},
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.GameModel>.value(_FakeGameModel_0(
          this,
          Invocation.method(
            #getAllGames,
            [],
            {#page: page},
          ),
        )),
      ) as _i8.Future<_i2.GameModel>);
  @override
  _i8.Future<_i3.GameDetailModel> getDetailGame({int? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDetailGame,
          [],
          {#id: id},
        ),
        returnValue:
            _i8.Future<_i3.GameDetailModel>.value(_FakeGameDetailModel_1(
          this,
          Invocation.method(
            #getDetailGame,
            [],
            {#id: id},
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i3.GameDetailModel>.value(_FakeGameDetailModel_1(
          this,
          Invocation.method(
            #getDetailGame,
            [],
            {#id: id},
          ),
        )),
      ) as _i8.Future<_i3.GameDetailModel>);
  @override
  _i8.Future<_i4.CreatorModel> getAllCreatorGames({String? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllCreatorGames,
          [],
          {#page: page},
        ),
        returnValue: _i8.Future<_i4.CreatorModel>.value(_FakeCreatorModel_2(
          this,
          Invocation.method(
            #getAllCreatorGames,
            [],
            {#page: page},
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i4.CreatorModel>.value(_FakeCreatorModel_2(
          this,
          Invocation.method(
            #getAllCreatorGames,
            [],
            {#page: page},
          ),
        )),
      ) as _i8.Future<_i4.CreatorModel>);
  @override
  _i8.Future<_i4.CreatorModel> getCreatorDetailGame({int? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCreatorDetailGame,
          [],
          {#id: id},
        ),
        returnValue: _i8.Future<_i4.CreatorModel>.value(_FakeCreatorModel_2(
          this,
          Invocation.method(
            #getCreatorDetailGame,
            [],
            {#id: id},
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i4.CreatorModel>.value(_FakeCreatorModel_2(
          this,
          Invocation.method(
            #getCreatorDetailGame,
            [],
            {#id: id},
          ),
        )),
      ) as _i8.Future<_i4.CreatorModel>);
  @override
  _i8.Future<_i5.DeveloperModel> getDeveloperDetailGame({int? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDeveloperDetailGame,
          [],
          {#id: id},
        ),
        returnValue: _i8.Future<_i5.DeveloperModel>.value(_FakeDeveloperModel_3(
          this,
          Invocation.method(
            #getDeveloperDetailGame,
            [],
            {#id: id},
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i5.DeveloperModel>.value(_FakeDeveloperModel_3(
          this,
          Invocation.method(
            #getDeveloperDetailGame,
            [],
            {#id: id},
          ),
        )),
      ) as _i8.Future<_i5.DeveloperModel>);
  @override
  _i8.Future<_i6.DeveloperDataModel> getAllDeveloperGames({String? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllDeveloperGames,
          [],
          {#page: page},
        ),
        returnValue:
            _i8.Future<_i6.DeveloperDataModel>.value(_FakeDeveloperDataModel_4(
          this,
          Invocation.method(
            #getAllDeveloperGames,
            [],
            {#page: page},
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i6.DeveloperDataModel>.value(_FakeDeveloperDataModel_4(
          this,
          Invocation.method(
            #getAllDeveloperGames,
            [],
            {#page: page},
          ),
        )),
      ) as _i8.Future<_i6.DeveloperDataModel>);
}

/// A class which mocks [GameLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockGameLocalDataSource extends _i1.Mock
    implements _i9.GameLocalDataSource {
  @override
  _i8.Future<void> persistGame(_i10.GameData? gameModel) => (super.noSuchMethod(
        Invocation.method(
          #persistGame,
          [gameModel],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> persistCreator(_i11.CreatorData? creatorModel) =>
      (super.noSuchMethod(
        Invocation.method(
          #persistCreator,
          [creatorModel],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<List<_i10.GameData>> getAllGames() => (super.noSuchMethod(
        Invocation.method(
          #getAllGames,
          [],
        ),
        returnValue: _i8.Future<List<_i10.GameData>>.value(<_i10.GameData>[]),
        returnValueForMissingStub:
            _i8.Future<List<_i10.GameData>>.value(<_i10.GameData>[]),
      ) as _i8.Future<List<_i10.GameData>>);
  @override
  _i8.Future<List<_i10.GameData>> searchGames({required String? text}) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchGames,
          [],
          {#text: text},
        ),
        returnValue: _i8.Future<List<_i10.GameData>>.value(<_i10.GameData>[]),
        returnValueForMissingStub:
            _i8.Future<List<_i10.GameData>>.value(<_i10.GameData>[]),
      ) as _i8.Future<List<_i10.GameData>>);
  @override
  _i8.Future<void> pesistDetailGame(_i3.GameDetailModel? gameDetailModel) =>
      (super.noSuchMethod(
        Invocation.method(
          #pesistDetailGame,
          [gameDetailModel],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<_i3.GameDetailModel?> getDetailGame({required int? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDetailGame,
          [],
          {#id: id},
        ),
        returnValue: _i8.Future<_i3.GameDetailModel?>.value(),
        returnValueForMissingStub: _i8.Future<_i3.GameDetailModel?>.value(),
      ) as _i8.Future<_i3.GameDetailModel?>);
  @override
  _i8.Future<List<_i11.CreatorData>> getCreatorGames() => (super.noSuchMethod(
        Invocation.method(
          #getCreatorGames,
          [],
        ),
        returnValue:
            _i8.Future<List<_i11.CreatorData>>.value(<_i11.CreatorData>[]),
        returnValueForMissingStub:
            _i8.Future<List<_i11.CreatorData>>.value(<_i11.CreatorData>[]),
      ) as _i8.Future<List<_i11.CreatorData>>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i12.NetworkInfo {
  @override
  _i8.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i8.Future<bool>.value(false),
        returnValueForMissingStub: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
}
