public class Sherlock.DeviceIPBox : Sherlock.Box {

    public DeviceIPBox (Sherlock.Application application) {
        this.application = application;
        
        initUI ("deviceIP");

        this.image_ip = application.builder.get_object ("deviceIP_ImageIP") as Gtk.Image;
        this.label_ip = application.builder.get_object ("deviceIP_LabelIP") as Gtk.Label;
        this.button_ip = application.builder.get_object ("deviceIP_ButtonIP") as Gtk.Button;
        setCopyButtonAction(this.button_ip, this.label_ip, "IP");
        
        fillLabels ("");
    }
    
}