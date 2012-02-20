## jdic-macos-tray


This is a simple-low level menubar integration for Java using a compiled native library. Java6 already has cross-platform tray support, however the MacOS implementation doesn't allow the usage of [template images](http://www.proppe.org/blog/2007/12/01/nsimage-templates/), which makes the menu bar icon stand out badly.

In order to overcome that limitation `jdic-macos-tray` uses a compiled native library to directly access the Cocoa API. It's based on the original [jdic project](http://java.net/projects/jdic/), which now seems to be dead - I just ripped off the minimal set of classes needed for the menu bar functionality and made some modifications since the original implementation used Swing JPopupMenus, which looked and behaved badly.

For alternatives, take a look at [SWT](http://www.eclipse.org/swt/).

## Building

Checkout the source, then call make:

    make

That's it. Check the `dist` folder.

## Usage

First get an instance of the system tray:

    MacSystemTrayService tray = MacSystemTrayService.getInstance();

Create a status item / tray icon, optionally passing in an `ActionListener`:

    MacTrayIconService icon = new MacTrayIconService();

Set a caption or an image and add to the system tray:

    icon.setCaption("App menu");

	// alternatively
	icon.setIcon(...);
    
	tray.addTrayIcon(icon, 0);

Now add some items to the status item:

	icon.addItem("Item 0", new ActionListener() {...});
	icon.addItem("Item 1", new ActionListener() {...});
	icon.addItem("Item 2", new ActionListener() {...});

Removing items is equally as easy:

	icon.removeItem(2);

## License

[GPL](http://www.gnu.org/copyleft/gpl.html)

