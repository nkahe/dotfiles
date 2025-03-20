# Custom keyboard layout using XKB

Customizes nordic keyboard layout to suite better for programming in Linux.
Works under X or XWayland.

If want set system wide copy settings file `custom` to:
```
/usr/share/X11/xkb/symbols/custom
```

In

```
/usr/share/X11/xkb/rules/evdev.lst
```
add following line if it doesn't exist:
```
custom          A user-defined custom Layout
```
This file:
```
/usr/share/X11/xkb/rules/evdev.xml
```

Should have following like configuration if it doesn't exist under
<layoutList> tag.

```xml
    <layout>
      <configItem>
	      <name>custom</name>
        <shortDescription>custom</shortDescription>
        <description>A user-defined custom Layout</description>
        <languageList>
          <iso639Id>und</iso639Id>
        </languageList>
      </configItem>
      <variantList/>
    </layout>
```

Set system wide
```sh
setxkbmap -layout custom
```

Set only for user
```sh
setxkbmap -I$HOME/.config/xkb custom
```

If using DE, needs to be set in there also.
Needs relog.
