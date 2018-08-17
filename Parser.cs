using System;

namespace dfmhtml
{
    public class Parser
    {
        private Lexer _lex;
        private int _currentIndex;
        public Parser()
        {
            
        }

        public ObjectToken Parse(string input)
        {
            _lex = new Lexer();
            _lex.Lex(input);
            foreach(Token t in _lex)
            {
                Console.WriteLine(t);
            }
            _currentIndex = 0;
            return ParseGoal();
        }

        private ObjectToken ParseGoal()
        {
            Console.WriteLine("Parsing....");
            return ParseObject();
        }

        private ObjectToken ParseObject()
        {
            ParseKeyword("object");
            Token name = ParseName();
            ParseSpecialChar(':');
            Token typename = ParseTypename();
            if(PeekSpecialChar('['))
            {
                ParseIndex();
            }

            ObjectToken result = new ObjectToken(name, typename);
            Console.WriteLine("Parsing " + result);
            while(!PeekKeyword("end"))
            {
                if(PeekKeyword("object"))
                {
                    result.Children.Add(ParseObject());
                }
                else
                {
                    result.Children.Add(ParseProperty());
                }
            }
            ParseKeyword("end");
            return result;
        }

        private void ParseIndex()
        {
            ParseSpecialChar('[');
            ParseNumber();
            ParseSpecialChar(']');
        }

        private Token ParseName()
        {
            return NextToken();
        }

        private Token ParseTypename()
        {
            return NextToken();
        }

        private Token ParseProperty()
        {

            Token qualid = ParseQualifiedIdent();
            ParseSpecialChar('=');
            Token value = ParsePropertyValue();

            return new PropertyToken(qualid, value);
        }

        private Token ParseQualifiedIdent()
        {
            Token result = NextToken();
            while(PeekSpecialChar('.'))
            {
                ParseSpecialChar('.');
                NextToken();
            }
            return result;

        }

        private Token ParsePropertyValue()
        {
            Token value = null;
            if(PeekString())
            {
                value = ParseString();
            }
            else if(PeekNumber())
            {
                value = ParseNumber();
            }
            else if (PeekSpecialChar('['))
            {
                value = ParseSet();
            }
            else if(PeekSpecialChar('<'))
            {
                value = ParseItemList();
            }
            else if (PeekSpecialChar('('))
            {
                value = ParsePositionData();
            }
            else if(false)
            {
                value = ParseBinary();
            }
            else
            {
                value = ParseIdentifier();
            }
            return value;
        }

        private Token ParseSet()
        {
            Token result = ParseSpecialChar('[');
            while(!PeekSpecialChar(']'))
            {
                Console.WriteLine(NextToken());
                if(PeekSpecialChar(','))
                {
                    ParseSpecialChar(',');
                }
            }
            ParseSpecialChar(']');
            Console.WriteLine("[");
            return result;
        }

        private Token ParseItemList()
        {
            Token result = ParseSpecialChar('<');
            while(!PeekSpecialChar('>'))
            {
                NextToken();
            }
            ParseSpecialChar('>');
            return result;
        }

        private Token ParsePositionData()
        {
            Token result = ParseSpecialChar('(');
            while(!PeekSpecialChar(')'))
            {
                Console.WriteLine(NextToken());
            }
            ParseSpecialChar(')');
            return result;
        }

        private Token ParseBinary()
        {
            return NextToken();
        }

        private Token ParseIdentifier()
        {
            Token result = NextToken();
            while(PeekSpecialChar(','))
            {
                ParseSpecialChar(',');
                NextToken();
            }
            return result;
        }

        private Token Peek()
        {
            Token result = null;

            while(_currentIndex < _lex.Count && _lex[_currentIndex] is WhiteSpace)
            {
                _currentIndex++;
            }
            if(_currentIndex < _lex.Count)
            {
                result = _lex[_currentIndex];
            }
            return result;
        }

        private Token NextToken()
        {
            Token result = null;
            while(Peek() != null && result == null)
            {
                result = _lex[_currentIndex++];
            }
            return result;
        }

        private bool PeekSpecialChar(char c)
        {
            Token peek = Peek();
            return peek.Text == c.ToString();
        }

        private Token ParseSpecialChar(char c)
        {
            Token token = null;
            if(PeekSpecialChar(c))
            {
                token = NextToken();
            }
            return token;
        }

        private bool PeekKeyword(string keyword)
        {
            Token peek = Peek();
            return peek != null && string.Compare(peek.Text, keyword, true) == 0;
        }

        private Token ParseKeyword(string keyword)
        {
            Token result = null;
            if(PeekKeyword(keyword))
            {
                result = NextToken();
            }
            return result;
        }

        private bool PeekString()
        {
            Token peek = Peek();
            return peek != null && peek is StringToken;
        }

        private StringToken ParseString()
        {
            StringToken result = null;
            if(PeekString())
            {
                result = (StringToken)NextToken();
            }
            return result;
        }

        private bool PeekNumber()
        {
            Token peek = Peek();
            return peek != null && peek is NumberToken;
        }

        private NumberToken ParseNumber()
        {
            NumberToken result = null;
            if(PeekNumber())
            {
                result = (NumberToken)NextToken();
            }
            return result;
        }
    }
}