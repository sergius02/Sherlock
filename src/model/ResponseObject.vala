public class Sherlock.ResponseObject {

    public string status { get; set; }
    public string country { get; set; }
    public string countryCode { get; set; }
    public string region { get; set; }
    public string regionName { get; set; }
    public string city { get; set; }
    public string zip { get; set; }
    public string lat { get; set; }
    public string lon { get; set; }
    public string timezone { get; set; }
    public string isp { get; set; }
    public string org { get; set; }
    public string as { get; set; }
    public string query { get; set; }

    public ResponseObject (Json.Object root_object) {
        this.status = root_object.get_string_member("status");
        this.country = root_object.get_string_member("country");
        this.countryCode = root_object.get_string_member("countryCode");
        this.region = root_object.get_string_member("region");
        this.regionName = root_object.get_string_member("regionName");
        this.city = root_object.get_string_member("city");
        this.zip = root_object.get_string_member("zip");
        this.lat = root_object.get_double_member("lat").to_string();
        this.lon = root_object.get_double_member("lon").to_string();
        this.timezone = root_object.get_string_member("timezone");
        this.isp = root_object.get_string_member("isp");
        this.org = root_object.get_string_member("org");
        this.as = root_object.get_string_member("as");
        this.query = root_object.get_string_member("query");
    }

}