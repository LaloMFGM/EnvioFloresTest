import 'package:envioflorestest/domain/datasource/github_user_datasource.dart';
import 'package:envioflorestest/domain/entities/github_user_entity.dart';
import 'package:envioflorestest/domain/entities/github_user_followers_entity.dart';
import 'package:envioflorestest/domain/entities/github_user_repositories_entity.dart';
import 'package:flutter/material.dart';

class GithubUserProvider extends ChangeNotifier {
  final GithubUserDatasource datasource;

  String? _username;

  String? get username => _username;
  set username(String value) {
    _username = value;
    notifyListeners();
  }

  GithubUserEntity? user;

  List<GithubUserRepositoriesEntity>? repositories;

  List<GithubUserFollowersEntity>? followers;

  bool isLoading = false;
  String? error;

  GithubUserProvider({required this.datasource});

  Future<void> loadUser(String username) async {
    user = null;
    try {
      isLoading = true;
      notifyListeners();

      user = await datasource.getUser(username);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadRepositories() async {

    repositories = null;

    try {
      isLoading = true;
      notifyListeners();

      if (_username != null) {
        repositories = (await datasource.getRepositories(_username!));
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  loadFollowers() async{

    followers = null;
    
    try {
      isLoading = true;
      notifyListeners();

      if(_username != null){
       followers = await datasource.getFollowers(_username!);
      }


    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

}
