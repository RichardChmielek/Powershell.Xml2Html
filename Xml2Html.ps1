$source = @"
using System;
using System.IO;
using System.Xml;
using System.Xml.Xsl;

public class Xml2Html
{
  public static string Transform(string inputXml, string xslt)
  {
    var transform = new XslCompiledTransform();
    using(var reader = XmlReader.Create(new StringReader(xslt)))
    {
      transform.Load(reader);
    }
    var results = new StringWriter();
    using(var reader = XmlReader.Create(new StringReader(inputXml)))
    {
        transform.Transform(reader, null, results);
    }
    return results.ToString();
  }
}
"@
Add-Type -TypeDefinition $source -PassThru | Out-Null