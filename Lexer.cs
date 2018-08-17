using System;
using System.Text;

namespace dfmhtml
{
    public class Lexer : TokenList
    {
        private int _currentIndex;
        private string _input;
        public void Lex(string input)
        {
            _input = input;
            Lex();
        }

        private void Lex()
        {
            Console.Write("Lexing...");
            Clear();
            _currentIndex = 0;
            while(!Eof())
            {
                char c = Peek();
                if(char.IsDigit(c))
                {
                    ReadNumber();
                }
                else if(char.IsLetter(c) || c == '_')
                {
                    ReadName();
                }
                else if (c == '\'')
                {
                    ReadString();
                }
                else if (char.IsWhiteSpace(c))
                {
                    Add(new WhiteSpace(NextChar()));
                }
                else if(c == '-')
                {
                    c = NextChar();
                    if(char.IsDigit(Peek()))
                    {
                        ReadNumber(c.ToString());
                    }
                    else
                    {
                        Add(c);    
                    }
                }
                else
                {
                    Add(NextChar());
                }
            }
            Console.WriteLine("done!");
        }

        private void ReadNumber(string prefix = null)
        {
            StringBuilder buffer = new StringBuilder();
            if(prefix != null)
            {
                buffer.Append(prefix);
            }
            while(char.IsDigit(Peek()))
            {
                buffer.Append(NextChar());
            }
            Add(new NumberToken(buffer.ToString()));
        }

        private void ReadName()
        {
            StringBuilder buffer = new StringBuilder();
            while(Peek() == '_' || char.IsLetter(Peek()) ||char.IsDigit(Peek()))
            {
                buffer.Append(NextChar());
            }
            Add(buffer);
        }

        private void ReadString()
        {
            StringBuilder buffer = new StringBuilder();
            buffer.Append(NextChar());
            bool goon = true;
            do
            {
                goon = Peek() != '\'';
                buffer.Append(NextChar());
                if (!goon && Peek() == '\'')
                {
                    buffer.Append(NextChar());
                    goon = true;
                }
            } while(goon);
            Add(new StringToken(buffer.ToString()));
        }

        private bool Eof()
        {
            return !(_currentIndex < _input.Length);
        }

        private char Peek()
        {
            char c = (char)0;
            if(_currentIndex < _input.Length)
            {
                c = _input[_currentIndex];
            }
            return c;
        }

        private char NextChar()
        {
            char c = (char)0;
            if(_currentIndex < _input.Length)
            {
                c = _input[_currentIndex++];
            }
            return c;
        }
    }
}