using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    public static class FileContents
    {
        public static string BlocFile(string entityName, string[] dto, string[] events)
        {
            string dtoList = "";
            string dtoCopyWith = "";
            string eventLine = "";
            string eventFunctions = "";
            for (int i = 0; i < dto.Length; i++)
            {
                var item = dto[i];
              
               
                dtoList += string.Format("import '../../../../models/{0}.dart';", ToUnderscoreCase(item)) +  "\r\n";
                dtoCopyWith += string.Format(@" {3}if (event?.action == {0}Actions.get{1}FindAlls) {{
        emit(state.copyWith({2}s: event?.data));
      }}", entityName, item, item.ToLower() , (i > 0 ? "else " : "")) + "\r\n"; ;


            }


            foreach (var item in events)
            {
                eventLine += string.Format("on<{0}{1}Event>(_on{1});", entityName, item) + "\r\n";
                eventFunctions += string.Format(@"FutureOr<void> _on{1}(
                {0}{1}Event event, Emitter<{0}State> emit) {{ }}", entityName, item) + "\r\n";
            }

            string result = string.Format(@"
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../base_class/base_state.dart';

import '../{5}_repository.dart';
import '../../../../base_class/base_bloc.dart';
import '../../../../base_class/base_repository.dart';

{1}

part '{5}_event.dart';
part '{5}_state.dart';

class {0}Bloc extends BaseBloc<{0}Event, {0}State, {0}Repository> {{
  {0}Bloc(
      {{required {0}Repository repository, required {0}State initialState}})
      : super(repository: repository, initialState: initialState) {{
   

    {3}
  }}

 {4}
 @override
  setRepositoryListener() {{
   repository.status.listen((BaseRepositoryStatus? event) {{
     {2}
   }});
 }}
}}", entityName, dtoList, dtoCopyWith, eventLine , eventFunctions, ToUnderscoreCase(entityName));

            return result;
        }


        public static string BaseViewFile(string entityName, string[] dto, string[] events)
        {
        
         

            string result = string.Format(@"
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../{1}_repository.dart';
import '../bloc/{1}_bloc.dart';
import '{1}_widget.dart';
import '../../../../constants/colors.dart';
import '../../../../services/service_manager.dart';



class {0}Page extends StatelessWidget {{
  static String getRout = '{0}';

  {0}Page({{Key? key}}) : super(key: key);

  @override
  Widget build(BuildContext context) {{
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => {0}Bloc(
              repository: {0}Repository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: {0}Initial()),
          child: {0}Widget(),
        ));
  }}
}}
", entityName, ToUnderscoreCase(entityName));

            return result;
        }

        public static string BaseWidgetFile(string entityName, string[] dto)
        {



            string result = string.Format(@"
import 'package:flutter/material.dart';
import '../../../../base_class/base_widget.dart';

class {0}Widget extends BaseStateLess {{


  @override
  Widget body(BuildContext context) {{
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }}
}}

", entityName, ToUnderscoreCase(entityName));

            return result;
        }

        public static string EventFile(string entityName, string[] events)
        {
            string eventFunctions = "";
            foreach (var item in events)
            {
                eventFunctions += string.Format(@"class {0}{1}Event extends {0}Event{{
  @override
  List<Object?> get props => [];
}}", entityName, item) + "\r\n";
            }
            string result = string.Format(@"
part of '{2}_bloc.dart';

abstract class {0}Event extends Equatable {{
  const {0}Event();
}}

{1}
", entityName, eventFunctions, ToUnderscoreCase(entityName));

            return result;
        }

        public static string BaseFile(string entityName, string[] events)
        {
            string eventFunctions = "";
           
            string result = string.Format(@"export 'bloc/{0}_bloc.dart';
export 'view/view.dart';
export 'model/model.dart';
", ToUnderscoreCase(entityName), eventFunctions);

            return result;
        }


        public static string ViewImportFile(string entityName)
        {
            string eventFunctions = "";

            string result = string.Format(@"export '{0}_page.dart';
export '{0}_widget.dart';", ToUnderscoreCase(entityName), eventFunctions);

            return result;
        }

        public static string StateFile(string entityName,string[] dto, string[] events , string[] stateItems)
        {
            string dtoList = "";
            string dtoItem = "";
            string constructor = "";
            string props = "";
            string copyItems = "";

            foreach (var item in dto)
            {
                dtoList += string.Format("List<{0}>? {1}s;", item , item.ToLower()) + "\r\n";
                dtoItem += string.Format("{0}? {1};", item , item.ToLower()) + "\r\n";
                constructor += string.Format(@"this.{0}s,this.{0},", item.ToLower()) + "\r\n";
                props += string.Format(@"{0}s,{0},", item.ToLower()) + "\r\n";
                copyItems += string.Format("{1}s: {1}s ?? this.{1}s," + "\r\n" + " {1}: {1} ?? this.{1},", item, item.ToLower()) + "\r\n";
            }
           foreach (var item in stateItems)
           {
               var type = item.Split(':').First();
               var key = item.Split(':').Last().ToCamelCase();
                dtoList += string.Format("{0}? {1};", type, key) + "\r\n";
                constructor += string.Format(@"this.{0},", key) + "\r\n";
                props += string.Format(@"{0},", key) + "\r\n";
                copyItems += string.Format(" {1}: {1} ?? this.{1},", item, key) + "\r\n";
            }

           constructor += string.Format(@"this.{0},this.{1},this.{2}", "msg","status" , "nextPageRout") + "\r\n";
           props += string.Format(@"{0},{1},{2}", "msg", "status","nextPageRout") + "\r\n";
           copyItems += string.Format("{0}: {0} ?? this.{0}," + "\r\n" + " {1}: {1} ?? this.{1}," + " {2}: {2} ?? this.{2},", "msg", "status","nextPageRout") + "\r\n";


            string result = string.Format(@"part of '{3}_bloc.dart';

class {0}State extends Equatable implements BaseState{{

  @override
  Status? status;

  @override
  String? nextPageRout;

  @override
  String? msg;
  {1}
  {5}

  {0}State(
  {{
  {2}
  }});

  @override
  List<Object?> get props => [
        {4}
      ];

{0}State copyWith({{
    {6}
    {7}    
  }}) {{
    return {0}State(
      {8}
    );
  }}

}}

 
class {0}Initial extends {0}State {{
  {0}Initial() {{
    }}
  }}

", entityName, dtoList,constructor, ToUnderscoreCase(entityName),props,dtoItem, dtoList.Replace(';', ',') , dtoItem.Replace(';', ','), copyItems);

            return result;
        }

        public static string RepositoryFile(string entityName, string[] dtos, string[] events)
        {
            string dtoList = "";
            string getApiList = "";
            string serverSuccessResponseList = "";
            string serverSuccessResponseDto = "";
            string dtoEnums = "";

            foreach (var item in dtos)
            {
                dtoList += string.Format("import '../../../models/{0}.dart';" + "\r\n" + "import '../../../services/{0}_service.dart';", ToUnderscoreCase(item)) + "\r\n";
                getApiList += string.Format(@"
  get{0}s()async {{
     
    await serviceManager.userService.get{0}s( res: ({{isSuccess, msg, result}}) {{
        isSuccess! ? add(state?.copyWith(data: result, action: {1}Actions.get{0}FindAlls , msg: msg)) :  null;
    }});
  }}
  get{0}ById(id)async {{
    await serviceManager.userService.get{0}ById(id: id ,  res: ({{isSuccess, msg, result}}) {{
        isSuccess! ? add(state?.copyWith(data: result, action: {1}Actions.get{0}ById , msg: msg)) :  null;
    }});
  }}


", item, entityName  ) + "\r\n";
                serverSuccessResponseDto += string.Format(@"if (result.str == apis.get{1}ById) {{
         
          add(state?.copyWith(
              data: {1}.fromJson, action: {0}Actions.get{1}ById));
        }}", entityName, item
     , ToUnderscoreCase(entityName)) + "\r\n";
                serverSuccessResponseList += string.Format(@"if (result.str == apis.get{1}FindAlls) {{
          var dataList = BaseModelResponseList<{1}>.fromJson(
              result.value, {1}.fromJson);
          add(state?.copyWith(
              data: dataList.data, action: {0}Actions.get{1}FindAlls));
        }}", entityName, item 
       , ToUnderscoreCase(entityName)) + "\r\n";

                dtoEnums += string.Format("get{0}FindAlls,get{0}ById,", item);
            }
        


            string result = string.Format(@"
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

{1}

class {0}Repository extends BaseRepository<BaseRepositoryStatus> {{
  {0}Repository({{required ServiceManager serviceManager}})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    {2}
}}

class {0}RepositoryStatus implements BaseRepositoryStatus<{0}Actions> {{
  @override
  {0}Actions? action;

  @override
  String? msg;

  @override
  int? status;

  dynamic data;

  {0}RepositoryStatus({{this.action, this.data , this.msg,this.status}});

  @override
  {0}RepositoryStatus copyWith({{{0}Actions? action, dynamic data , String? msg ,  int? status}}) {{
    return {0}RepositoryStatus(
        action: action ?? this.action, data: data ?? this.data , msg: msg , status: status);
  }}
}}

enum {0}Actions {{
  {4}
}}

", entityName, dtoList, getApiList , serverSuccessResponseList , dtoEnums  , serverSuccessResponseDto);

            return result;
        }
        public static string ToUnderscoreCase(string str)
    => string.Concat((str ?? string.Empty).Select((x, i) => i > 0 && i < str.Length - 1 && char.IsUpper(x) && !char.IsUpper(str[i - 1]) ? $"_{x}" : x.ToString())).ToLower();


    }


}
public static class StringExtension
{
    public static string ToCamelCase(this string str) =>
        string.IsNullOrEmpty(str) || str.Length < 2
            ? str.ToLowerInvariant()
            : char.ToLowerInvariant(str[0]) + str.Substring(1);
}