using System;
using System.IO;

namespace dfmhtml
{
    class Program
    {
        static void Main(string[] args)
        {
            if(args.Length > 0)
            {
                foreach(string filename in args)
                {
                    Run(filename);
                }
            }
            else
            {
                Run("test.dfm");
            }
            
        }

        private static void Run(string dfmFilename)
        {
            if(File.Exists(dfmFilename))
            {
                string htmlFilename = Path.ChangeExtension(dfmFilename, ".html");
                Console.WriteLine("Converting {0} to {1}", dfmFilename, htmlFilename);
                Parser parser = new Parser();
                using(StreamReader sr = new StreamReader(dfmFilename))
                {
                    ObjectToken ot = parser.Parse(sr.ReadToEnd());
                    ot.Print();
                    File.WriteAllText(htmlFilename, ot.ToHtml());
                }
            }
        }
    }
}
