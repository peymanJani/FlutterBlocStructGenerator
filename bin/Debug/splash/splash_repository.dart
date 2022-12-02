
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/user.dart';
import '../../../services/user_service.dart';
import '../../../models/language.dart';
import '../../../services/language_service.dart';
import '../../../models/language_title.dart';
import '../../../services/language_title_service.dart';


class SplashRepository extends BaseRepository<BaseRepositoryStatus> {
  SplashRepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
getUsers()async {
     
List<User> result = await serviceManager.userService.getUsers();
       add(state?.copyWidth(data: result, action: SplashActions.getUserFindAlls));
}
getUserById(id)async {
    User result = serviceManager.userService.getUserById(id: id);
    add(state?.copyWidth(data: result, action: SplashActions.getUserById));
}




getLanguages()async {
     
List<Language> result = await serviceManager.userService.getLanguages();
       add(state?.copyWidth(data: result, action: SplashActions.getLanguageFindAlls));
}
getLanguageById(id)async {
    Language result = serviceManager.userService.getLanguageById(id: id);
    add(state?.copyWidth(data: result, action: SplashActions.getLanguageById));
}




getLanguageTitles()async {
     
List<LanguageTitle> result = await serviceManager.userService.getLanguageTitles();
       add(state?.copyWidth(data: result, action: SplashActions.getLanguageTitleFindAlls));
}
getLanguageTitleById(id)async {
    LanguageTitle result = serviceManager.userService.getLanguageTitleById(id: id);
    add(state?.copyWidth(data: result, action: SplashActions.getLanguageTitleById));
}




}

class SplashRepositoryStatus implements BaseRepositoryStatus<SplashActions> {
  @override
  SplashActions? action;

  dynamic data;

  SplashRepositoryStatus({this.action, this.data});

  SplashRepositoryStatus copyWidth({SplashActions? action, dynamic data}) {
    return SplashRepositoryStatus(
        action: action ?? this.action, data: data ?? this.data);
  }
}

enum SplashActions {
  getUserFindAlls,getUserById,getLanguageFindAlls,getLanguageById,getLanguageTitleFindAlls,getLanguageTitleById,
}


