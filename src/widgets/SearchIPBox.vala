public class Sherlock.SearchIPBox : Sherlock.Box {

    private Gtk.Grid grid_info;

    private Gtk.Button button_search_ip;

    private Gtk.Entry entry_ip;

    public SearchIPBox (Sherlock.Application application) {
        this.application = application;

        init_ui ("searchIP");

        this.grid_info = application.builder.get_object ("searchIP_GridInfo") as Gtk.Grid;
        grid_info.visible = false;
        this.button_revealer.visible = false;

        this.button_search_ip = application.builder.get_object ("searchIP_ButtonSearchIP") as Gtk.Button;
        button_search_ip.clicked.connect (() => {
            this.entry_ip = application.builder.get_object ("searchIP_EntryIP") as Gtk.Entry;
            this.grid_info.visible = true;
            this.button_revealer.visible = true;
            fill_labels (this.entry_ip.get_text ());
        });
    }

}
