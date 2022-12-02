part of 'splash_bloc.dart';

class SplashState extends Equatable {
  List<User>? users;
List<Language>? languages;
List<LanguageTitle>? languagetitles;

  User? user;
Language? language;
LanguageTitle? languagetitle;


  SplashState(
  {
  this.users,this.user,
this.languages,this.language,
this.languagetitles,this.languagetitle,

  });

  @override
  List<Object?> get props => [
        users,user,
languages,language,
languagetitles,languagetitle,

      ];

SplashState copyWith({
    List<User>? users,
List<Language>? languages,
List<LanguageTitle>? languagetitles,

    User? user,
Language? language,
LanguageTitle? languagetitle,
    
  }) {
    return SplashState(
      users: users ?? this.users,
 user: user ?? this.user,
languages: languages ?? this.languages,
 language: language ?? this.language,
languagetitles: languagetitles ?? this.languagetitles,
 languagetitle: languagetitle ?? this.languagetitle,

    );
  }

}

 
class SplashInitial extends SplashState {
  SplashInitial() {
    }
  }


