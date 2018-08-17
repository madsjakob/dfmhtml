using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;

namespace dfmhtml
{
    public class Token 
    {
        private string _text;
        public string Text
        {
            get { return _text; }
        }

        public Token(string text) 
        {
            _text = text;
        }

        public override string ToString()
        {
            return "TOKEN: " + _text;
        }

        public void Print()
        {
            Print(0);
        }
        public virtual void Print(int indent)
        {
            if(indent > 0)
            {
                Console.Write(new string(' ', indent * 2));
            }
            Console.WriteLine(ToString());
        }

        public virtual string ToHtml()
        {
            StringBuilder result = new StringBuilder();
            result.AppendLine("<html>");
            result.AppendLine("<head><title>dfmhtml</title></head>");
            result.AppendLine("<body>");
            AppendHtml(result);
            result.AppendLine("</body>");
            result.AppendLine("</html>");
            return result.ToString();
        }

        public virtual void AppendHtml(StringBuilder html)
        {
        }
    }

    public class WhiteSpace : Token
    {
        public WhiteSpace(char c) : base(c.ToString())
        {
        }
        public WhiteSpace(string text) : base(text)
        {
        }

        public override string ToString()
        {
            return "WS";
        }
    }

    public class StringToken : Token
    {
        public StringToken(string text) : base(text)
        {
        }

        public override void AppendHtml(StringBuilder html)
        {
            html.Append(Text.Substring(1, Text.Length - 2));
        }
    }

    public class NumberToken : Token
    {
        public NumberToken(string text) : base(text) 
        {
        }

        public override void AppendHtml(StringBuilder html)
        {
            html.Append(Text);
        }
    }

    public class PropertyToken : Token
    {
        private string _ident;
        private Token _value;
        public PropertyToken(Token ident, Token value) : base("")
        {
            _ident = ident.Text;
            _value = value;
        }

        public override string ToString()
        {
            return _ident + " = " + _value;
        }

        public override void AppendHtml(StringBuilder html)
        {
            if(string.Compare(_ident, "Caption", true) == 0)
            {
                _value.AppendHtml(html);
            }
        }
    }

    public abstract class ParentToken : Token
    {
        private TokenList _children;
        public TokenList Children
        {
            get { return _children; }
        }public ParentToken(string text) : base(text)
        {
            _children = new TokenList();
        }

        public override void Print(int indent)
        {
            base.Print(indent);
            foreach(Token child in Children)
            {
                child.Print(indent + 1);
            }
        }

        public override void AppendHtml(StringBuilder html)
        {
            base.AppendHtml(html);
            foreach(Token child in Children)
            {
                child.AppendHtml(html);
            }
        }
    }

    public class ObjectToken : ParentToken
    {
        private string _name;
        private string _type;
        public ObjectToken(Token name, Token type) : base("")
        {
            _name = name.Text;
            _type = type.Text;
        }

        public override string ToString()
        {
            return _name + ": " + _type;
        }

        public override void AppendHtml(StringBuilder html)
        {
            string tagname = GetTagName();
            html.AppendFormat("<{0}>\n", tagname);
            base.AppendHtml(html);
            html.AppendFormat("</{0}>\n", tagname);
        }

        private string GetTagName()
        {
            string tagname = "div";
            if(string.Compare("TLabel", _type, true) == 0)
            {
                tagname = "span";
            }
            else if(string.Compare("TTextBox", _type, true) == 0 || string.Compare("TTypeEdit", _type, true) == 0)
            {
                tagname = "input";
            }
            return tagname;
        }
    }

    public class TokenList : List<Token>
    {
        public void Add(StringBuilder buffer)
        {
            Add(buffer.ToString());
        }

        public void Add(char c)
        {
            Add(c.ToString());
        }

        public void Add(string token)
        {
            Add(new Token(token));
        }

    }
}