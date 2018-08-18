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

        public virtual Html ToHtml()
        {
            Html result = "html";
            result.Add("head").Add("title").AddText("dfmhtml");
            AppendHtml(result.Add("body"));
            
            return result;
        }

        public virtual void AppendHtml(Html htmlElement)
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

        public override void AppendHtml(Html htmlElement)
        {
            htmlElement.AddText(Text.Substring(1, Text.Length - 2));
        }
    }

    public class NumberToken : Token
    {
        public NumberToken(string text) : base(text) 
        {
        }

        public override void AppendHtml(Html htmlElement)
        {
            htmlElement.AddText(Text);
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

        public override void AppendHtml(Html htmlElement)
        {
            if(string.Compare(_ident, "Caption", true) == 0)
            {
                _value.AppendHtml(htmlElement);
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

        public override void AppendHtml(Html htmlElement)
        {
            base.AppendHtml(htmlElement);
            foreach(Token child in Children)
            {
                child.AppendHtml(htmlElement);
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

        public override void AppendHtml(Html htmlElement)
        {
            htmlElement = GetHtmlElement(htmlElement);
            htmlElement["id"] = _name;
            htmlElement["class"] = _type;
            base.AppendHtml(htmlElement);
        }

        private Html GetHtmlElement(Html parent)
        {
            Html result = null;
            if(string.Compare("TLabel", _type, true) == 0)
            {
                result = parent.Add("span");
            }
            else if(string.Compare("TTextBox", _type, true) == 0 || string.Compare("TTypeEdit", _type, true) == 0)
            {
                result = parent.Add("input");
                result["type"] = "text";
            }
            else if(string.Compare("TCheckBox", _type, true) == 0)
            {
                result = parent.Add("input");
                result["type"] = "checkbox";
            }
            else if(string.Compare("TComboBox", _type, true) == 0)
            {
                result = parent.Add("select");
            }
            else if(string.Compare("TToolButton", _type, true) == 0 || string.Compare("TSpeedButton", _type, true) == 0)
            {
                result = parent.Add("button");
            }
            else
            {
                result = parent.Add("div");
            }
            return result;
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
            else if(string.Compare("TComboBox", _type, true) == 0)
            {
                tagname = "select";
            }
            else if(string.Compare("TToolButton", _type, true) == 0 || string.Compare("TSpeedButton", _type, true) == 0)
            {
                tagname = "button";
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