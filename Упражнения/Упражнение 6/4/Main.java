import java.io.IOException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class Main {
    private static boolean skipNL;
    public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setValidating(false);
        DocumentBuilder builder = dbf.newDocumentBuilder();
        InputSource source = new InputSource("channel.xml");
        Document doc = builder.parse(source);
        System.out.println(printXML(doc.getDocumentElement()));
    }
    
    private static String printXML(Node rootNode){
        String tab = "";
        skipNL = false;
        
        return printXML(rootNode, tab);
    }
    
    private static String printXML(Node rootNode, String tab){
        String print = "";
        if (rootNode.getNodeType() == Node.ELEMENT_NODE) {
            print += "\n" + tab + "<" + rootNode.getNodeName();
            NamedNodeMap attributes = rootNode.getAttributes();
            
            for (int i = 0; i < attributes.getLength(); i++) {
                Attr attr = (Attr) attributes.item(i);
                
                if (attr != null) {
                    print += "" + attr.getNodeName() + "=\"" + attr.getNodeValue() + "\"";
                }
            }
            
            print += ">";
        }
        
        NodeList nl = rootNode.getChildNodes();
        
        if (nl.getLength() > 0) {
            for (int i = 0; i < nl.getLength(); i++) {
                print += printXML(nl.item(i), tab + "");
            }
        } else {
            if (rootNode.getNodeValue() != null) {
                print = rootNode.getNodeValue();
            }
            
            skipNL = true;
        }
        
        if (rootNode.getNodeType() == Node.ELEMENT_NODE) {
            if (!skipNL) {
                print += "\n" + tab;
            }
            
            skipNL = false;
            print += "</" + rootNode.getNodeName() + ">";
        }
        
        return print;
    }
}