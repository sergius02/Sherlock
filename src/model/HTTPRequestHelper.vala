/**
This is just a helper class to send HTTP Request to the IP-API (http://ip-api.com/json/) rest
*/
public class Sherlock.HTTPRequestHelper {

    private string baseURL = "http://ip-api.com/json/";
    public string result;
    private Json.Node root;

    /**
    Send a GET request to the API to obtain the current device IP info
    */
    public Sherlock.ResponseObject getDeviceIP () {
        return generateHTTPRequest ("");
    }

    /**
    Send a GET request to the API to obtain all info from the IP
    */
    public Sherlock.ResponseObject searchIPInfo (string ip) {
        return generateHTTPRequest (ip);
    }

    /**
    Send a request to the API

    string ip: IP to search, if IP is empty the API returns the current device IP info
    */
    private Sherlock.ResponseObject generateHTTPRequest (string ip) {
        var session = new Soup.Session ();
        var message = new Soup.Message ("GET", this.baseURL + ip);

        session.send_message (message);

        result = "";
        for(int i = 0; i < message.response_body.length; i++) {
            this.result += ((char)message.response_body.data[i]).to_string();
        }

        var parser = new Json.Parser ();
        try {
            parser.load_from_data (this.result, -1);
        } catch (GLib.Error e) {
            stderr.printf("Error al parsear el JSON");
        }

        root = parser.get_root();
        Json.Object root_object = root.get_object();
        return new Sherlock.ResponseObject (root_object);
    }

    public string get_result() {
        Json.Generator generator = new Json.Generator();
        generator.set_root (root);

        generator.pretty = true;
        return generator.to_data(null);
    }

}