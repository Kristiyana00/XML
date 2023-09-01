import java.io.File;
import java.io.IOException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class Main {
    public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException, TransformerConfigurationException, TransformerException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setValidating(false);
        DocumentBuilder builder = dbf.newDocumentBuilder();
        InputSource source = new InputSource("channel.xml");
        Document doc = builder.parse(source);
        processTree(doc);
        
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer writer = tf.newTransformer();
        writer.setOutputProperty(OutputKeys.ENCODING, "utf-8");
        writer.transform(new DOMSource(doc), new StreamResult(new File("channel2.xml")));
    }
    
    private static void processTree(Document doc){
        NodeList linkList = doc.getElementsByTagName("link");
        NodeList itemList = doc.getElementsByTagName("item");
        
        for (int i = itemList.getLength() - 1; i >= 10; i--) {
            Element item = (Element) itemList.item(i);
            item.getParentNode().removeChild(item);
        }
        
        for (int i = linkList.getLength() - 1; i >= 0; i--) {
            Element link = (Element) linkList.item(i);
            Element item = (Element) link.getParentNode();
            
            if ("item".equals(item.getNodeName())) {
                item.setAttribute("link", link.getTextContent().trim());
                item.removeChild(link);
            }
        }
        
        Element sponsor = doc.createElement("sponsor");
        sponsor.setTextContent("IBM");
        doc.getElementsByTagName("channel").item(0).appendChild(sponsor);
    }
}
