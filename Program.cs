using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;


namespace ConsoleApp1
{
    class Program
    {

        static void CreateFile(string path, string text)
        {
            using (var tw = new StreamWriter(path, false))
            {
                tw.WriteLine(text);
            }

        }

        static void CopyFile(string src, string dest)
        {
            if (File.Exists(src))
                if (!File.Exists(dest))
                    File.Copy(src, dest);
        }
        string ToUnderscoreCase(string str)
           => string.Concat((str ?? string.Empty).Select((x, i) => i > 0 && i < str.Length - 1 && char.IsUpper(x) && !char.IsUpper(str[i - 1]) ? $"_{x}" : x.ToString())).ToLower();

        static void createDirectory(string blocDirectoryName)
        {

            bool blocDirectoryExist = System.IO.Directory.Exists(blocDirectoryName);
            if (!blocDirectoryExist)
            {
                System.IO.Directory.CreateDirectory(blocDirectoryName);
            }

        }


        static void Main(string[] args)
        {
            Console.Write("Welcome To The Code Generator (PageName Dtos Events bool:item(For State) => sepratos whit ,):");

            string[] readLine = Console.ReadLine().Split(' ');
            string className = readLine[0];
            string[] dtos = readLine[1].Split(',');
            string[] events = readLine[2].Split(',');
            string[] stateItems = readLine[3].Split(',');
            //string[] dto = readLine[3].Split(',');

            string fileName = "";
            string text = "";
            string snacCaseClassName = FileContents.ToUnderscoreCase(className);
            string blocDirectoryName = snacCaseClassName + "/bloc";
            string viewDirectoryName = snacCaseClassName + "/view";
            string modelDirectoryName = snacCaseClassName + "/model";

            createDirectory(blocDirectoryName);
            createDirectory(viewDirectoryName);
            createDirectory(modelDirectoryName);



            #region bloc
            fileName = blocDirectoryName + "/" + snacCaseClassName + "_bloc.dart";
            text = FileContents.BlocFile(className, dtos, events);
            CreateFile(fileName, text);
            #endregion


            #region viewImport
            fileName = viewDirectoryName + "/" + "view.dart";
            text = FileContents.ViewImportFile(className);
            CreateFile(fileName, text);
            #endregion

            #region modelImport
            fileName = modelDirectoryName + "/" + "model.dart";
            text = "";
            CreateFile(fileName, text);
            #endregion

            #region basePage
            fileName = viewDirectoryName + "/" + snacCaseClassName + "_page.dart";
            text = FileContents.BaseViewFile(className, dtos, events);
            CreateFile(fileName, text);
            #endregion


            #region baseWidget
            fileName = viewDirectoryName + "/" + snacCaseClassName + "_widget.dart";
            text = FileContents.BaseWidgetFile(className, dtos);
            CreateFile(fileName, text);
            #endregion


            #region base
            fileName = snacCaseClassName + "/" + snacCaseClassName + ".dart";
            text = FileContents.BaseFile(className, dtos);
            CreateFile(fileName, text);
            #endregion

            #region event
            fileName = blocDirectoryName + "/" + snacCaseClassName + "_event.dart";
            text = FileContents.EventFile(className, events);
            CreateFile(fileName, text);
            #endregion

            #region state
            fileName = blocDirectoryName + "/" + snacCaseClassName + "_state.dart";
            text = FileContents.StateFile(className, dtos, events , stateItems);
            CreateFile(fileName, text);
            #endregion


            #region repository
            fileName = snacCaseClassName + "/" + snacCaseClassName + "_repository.dart";
            text = FileContents.RepositoryFile(className, dtos, events);
            CreateFile(fileName, text);
            Console.Write("All Codes Generated");
            Console.ReadLine();
            #endregion

            

        }
    }
}
