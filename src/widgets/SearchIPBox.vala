public class Sherlock.SearchIPBox : Sherlock.Box {

    public SearchIPBox (Gtk.Builder builder, Gtk.Clipboard clipboard) {
        this.builder = builder;
        this.clipboard = clipboard;

        initUI ("searchIP");

        var gridinfo = builder.get_object ("searchIP_GridInfo") as Gtk.Grid;
        gridinfo.visible = false;
        this.button_buttonrevealer.visible = false;

        var button_searchip = builder.get_object ("searchIP_ButtonSearchIP") as Gtk.Button;
        button_searchip.clicked.connect( () => {
            var entryip = builder.get_object ("searchIP_EntryIP") as Gtk.Entry;
            gridinfo.visible = true;
            this.button_buttonrevealer.visible = true;
            fillLabels (entryip.get_text ());
        });
    }

}