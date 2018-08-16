using System;
using System.IO;

namespace dfmhtml
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            Lexer lex = new Lexer();
            using(StreamReader sr = new StreamReader("test.dfm"))
            {
                lex.Lex(sr.ReadToEnd());
            }
        }
    }
}
