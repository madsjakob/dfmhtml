using System;

namespace dfmhtml
{
    public class Lexer
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
            _currentIndex = 0;
            while(!Eof())
            {
                char c = Peek();
                if(char.IsDigit(c))
                {
                    // ReadNumber
                }
                else if(char.IsLetter(c))
                {
                    // ReadName
                }
                else if (c == '\'')
                {
                    // String
                }
                else
                {
                    // SpecialChar
                }
                Console.WriteLine(NextChar());
            }
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