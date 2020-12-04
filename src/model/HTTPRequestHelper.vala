/**
This is just a helper class to send HTTP Request to the IP-API (http://ip-api.com/json/) rest
*/
public class Sherlock.HTTPRequestHelper {

    private string base_url = "http://ip-api.com/json/";
    public string result;
    private Json.Node root;
    private uint response_code;

    /**
    Send a request to the API

    string ip: IP to search, if IP is empty the API returns the current device IP info
    */
    public Sherlock.ResponseObject generate_http_request (string ip) {
        var session = new Soup.Session ();
        var message = new Soup.Message ("GET", this.base_url + ip);

        this.response_code = session.send_message (message);

        var parser = new Json.Parser ();
        Json.Object root_object = null;

        result = "";
        for (int i = 0; i < message.response_body.length; i++) {
            this.result += ((char)message.response_body.data[i]).to_string ();
        }

        try {
            if (result == "") {
                result = "{}";
            }

            parser.load_from_data (this.result, -1);

            root = parser.get_root ();
            root_object = root.get_object ();
        } catch (GLib.Error e) {
            stderr.printf (_("Error parsing JSON"));
        }

        return new Sherlock.ResponseObject (root_object, response_code);
    }

    public string get_result () {
        if (this.response_code == 200) {
            Json.Generator generator = new Json.Generator ();
            generator.set_root (root);

            generator.pretty = true;
            return generator.to_data (null);
        } else {
            return @"{\"status\":\"Error code: $response_code\"}";
        }
    }

}
