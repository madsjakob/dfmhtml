using System.Collections.Generic;
using System.IO;

namespace dfmhtml
{
    public class Html
    {
        private string _elementName;
        private string _text = null;
        private Dictionary<string, string> _attributes = new Dictionary<string, string>();
        private HtmlList _children = new HtmlList();
        public Html() : this("div")
        {

        }

        public Html(string elementName)
        {
            _elementName = elementName;
        }

        public static implicit operator Html(string elementName)
        {
            return new Html(elementName);
        }

        public string this[string name]
        {
            get 
            {
                string result = null;
                if(_attributes.ContainsKey(name))
                {
                    result = _attributes[name];
                }
                return result;
            }
            set
            {
                if(_attributes.ContainsKey(name))
                {
                    _attributes[name] = value;
                }
                else
                {
                    _attributes.Add(name, value);
                }
            }
        }

        public Html this[int index]
        {
            get 
            {
                Html result = null;
                if(index < _children.Count)
                {
                    result = _children[index];
                }
                return result;
            }
        }

        private Dictionary<string, string> _style = new Dictionary<string, string>();
        public Dictionary<string,string> Style
        {
            get { return _style; }
        }

        public void SetStyle(string name, string value)
        {
            if(value == null && _style.ContainsKey(name))
            {
                _style.Remove(name);
            }
            else if(!_style.ContainsKey(name))
            {
                _style.Add(name, value);
            }
            else
            {
                _style[name] = value;
            }
        }

        public Html Add(string name)
        {
            Html result = name;
            _children.Add(result);
            return result;
        }

        public void AddText(string text)
        {
            _text = text;
        }

        public void Save(string filename, string styleFilename = null)
        {
            if(styleFilename == null)
            {
                styleFilename = "style.css";
            }
            using(StreamWriter sw = new StreamWriter(filename))
            {
                AddHtml(sw, 0);
            }
            using(StreamWriter sw = new StreamWriter(styleFilename))
            {
                AddStyle(sw, 0);
            }
        }

        private void AddHtml(StreamWriter sw, int level)
        {
            string indent = new string(' ', level * 2);
            sw.Write(indent);
            sw.Write("<");
            sw.Write(_elementName);
            foreach(string key in _attributes.Keys)
            {
                if(!string.IsNullOrWhiteSpace(_attributes[key]))
                {
                    sw.Write(" {0}=\"{1}\"", key, _attributes[key]);
                }
            }
            sw.Write(">");
            if(!string.IsNullOrWhiteSpace(_text))
            {
                sw.Write(_text);
            }
            if(_children.Count > 0)
            {
                sw.WriteLine();
                foreach(Html element in _children)
                {
                    element.AddHtml(sw, level + 1);
                }
                sw.Write(indent);
            }
            sw.Write("</");
            sw.Write(_elementName);
            sw.WriteLine(">");
        }

        private void AddStyle(StreamWriter sw, int level)
        {
            if(_style.Count > 0 && !string.IsNullOrWhiteSpace(this["id"]))
            {
                sw.Write("#{0}", this["id"]);
                sw.WriteLine(" {");
                foreach(string key in _style.Keys)
                {
                    sw.WriteLine("{0}: {1};", key, _style[key]);
                }
                sw.WriteLine("}");
                sw.WriteLine();
            }

            foreach(Html element in _children)
            {
                element.AddStyle(sw, level + 1);
            }
        }
    }

    public class HtmlList : List<Html>
    {

    }
}