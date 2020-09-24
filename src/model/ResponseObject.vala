public class Sherlock.ResponseObject {

    public string status;
    public string country;
    public string countryCode;
    public string region;
    public string regionName;
    public string city;
    public string zip;
    public string lat;
    public string lon;
    public string timezone;
    public string isp;
    public string org;
    public string as;
    public string query;

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