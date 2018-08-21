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

        public virtual Html ToHtml(string styleFilename = null)
        {
            if(styleFilename == null)
            {
                styleFilename = "style.css";
            }
            Html result = "html";
            Html head = result.Add("head"); 
            head.Add("title").AddText("dfmhtml");
            Html baseLink = head.Add("link");
            baseLink["rel"] = "stylesheet";
            baseLink["type"] = "text/css";
            baseLink["href"] = "base.css";
            
            Html link = head.Add("link");
            link["rel"] = "stylesheet";
            link["type"] = "text/css";
            link["href"] = styleFilename;
            

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

    public class BinaryToken : Token
    {
        private string _name;
        public BinaryToken() : base("")
        {

        }

        private List<byte> _bytes = new List<byte>();

        public void AppendData(Token token)
        {
            string text = token.Text;
            int index = 0;
            if(_bytes.Count == 0)
            {
                _name = "";
                byte b = Convert.ToByte(text.Substring(index, 2), 16);
                index += 2;
                while(b > 0)
                {
                    _name += (char) Convert.ToByte(text.Substring(index, 2), 16);
                    index += 2;
                    b--;
                }
                if(string.Compare(_name, "TJpegImage", true) == 0)
                {
                    // 8 bytes used for something
                    index += 8;
                }
                else if (string.Compare(_name, "TBitmap", true) == 0)
                {

                }
            }
            while(index < text.Length)
            {
                _bytes.Add(Convert.ToByte(text.Substring(index, 2), 16));
                index += 2;
            }
        }

        public string GetValue()
        {
            string result = "data:image/";
            if(string.Compare(_name, "TJpegImage", true) == 0)
            {
                result += "jpg";
            }
            else 
            {
                result += "png";
            }
            result += ";base64,";
            return result + Convert.ToBase64String(_bytes.ToArray());
        }
    }

    public class IdentToken : Token
    {
        private string _name;
        public string Name 
        {
            get { return _name; }
        }
        public IdentToken(Token t) : base("")
        {
            _name = t.Text;

        }

        public void Append(IdentToken t)
        {
            _name += "." + t.Name;
        }

        public override string ToString()
        {
            return _name;
        }
    }

    public class PropertyToken : Token
    {
        private string _ident;
        private Token _value;
        public Token Value
        {
            get { return _value; }
        }
        public PropertyToken(IdentToken ident, Token value) : base("")
        {
            _ident = ident.Name;
            _value = value;
        }

        public override string ToString()
        {
            return _ident + " = " + _value;
        }

        public override void AppendHtml(Html htmlElement)
        {
            if(Is("Caption"))
            {
                _value.AppendHtml(htmlElement);
            }
            else if(Is("align"))
            {
                if((_value as IdentToken).Name == "alTop")
                {
                    htmlElement.SetStyle("position", "relative");
                    htmlElement.SetStyle("width", "100%");
                }
                else if((_value as IdentToken).Name == "alBottom")
                {
                    htmlElement.SetStyle("bottom", "0px");
                    htmlElement.SetStyle("left", "0px");
                    htmlElement.SetStyle("right", "0px");
                }
            }
            else if(Is("Left") || Is("top") || Is("right") || Is("bottom") || Is("height") || Is("width"))
            {
                htmlElement.SetStyle(_ident.ToLower(), _value.Text);
            }
            else if(Is("Color"))
            {
                htmlElement.SetStyle("background-color", "var(--color-" + _value.ToString() + ")");
            }
        }

        public bool Is(string name)
        {
            return string.Compare(_ident, name, true) == 0;
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
            if(Is("TGroupBox"))
            {
                // Move text to the box
                // InsertHtml("span").AddText(this.Text);
            }
        }

        private PropertyToken GetProperty(string name)
        {
            PropertyToken result = null;
            int index = 0;
            while(index < Children.Count && result == null)
            {
                if(Children[index] is PropertyToken && (Children[index] as PropertyToken).Is(name))
                {
                    result = Children[index] as PropertyToken;
                }
                else
                {
                    index++;
                }
            }
            return result;
        }

        private Html GetHtmlElement(Html parent)
        {
            Html result = null;
            if(Is("TLabel"))
            {
                result = parent.Add("span");
            }
            else if(Is("TMemo"))
            {
                result = parent.Add("textarea");
            }
            else if(Is("TTextBox") || Is("TTypeEdit"))
            {
                result = parent.Add("input");
                result["type"] = "text";
            }
            else if(Is("TCheckBox"))
            {
                result = parent.Add("input");
                result["type"] = "checkbox";
            }
            else if(Is("TRadioButton"))
            {
                result = parent.Add("input");
                result["type"] = "radio";
                result["name"] = "_rdio" + parent.GetHashCode().ToString();
            }
            else if(Is("TComboBox"))
            {
                result = parent.Add("select");
            }
            else if(Is("TToolButton") || Is("TSpeedButton") || Is("TButton"))
            {
                result = parent.Add("button");
            }
            else if(Is("TImage"))
            {
                result = parent.Add("img");
                PropertyToken imageData = GetProperty("Picture.Data");
                if(imageData != null)
                {
                    result["src"] = (imageData.Value as BinaryToken).GetValue();
                }
            }
            else
            {
                result = parent.Add("div");
                if(Is("TGroupBox"))
                {
                    result.SetStyle("border", "1px solid black");
                }
            }
            result.Style.Add("position", "absolute");
                
            return result;
        }

        private bool Is(string name)
        {
            return string.Compare(_type, name, true) == 0;
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