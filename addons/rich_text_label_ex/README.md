# <img src="icon.png" width="32" alt="addon icon"> RichTextLabelEx for Godot Engine 4
A custom node of RichTextLabel for external images in BBCode tags.

*This addon was made based on
[godot_richtext_with_dynamic_images](https://github.com/fahrstuhl/godot_richtext_with_dynamic_images).
Thank you fahrstuhl!*

![screenshot](screenshots/screenshot.png)

## How to install (plugin version)

### (1) Download ZIP file
\[ Code \](green button) &gt; Download ZIP  
*(If you want all files, please use git clone)*

### (2) Copy files
Copy from (unzipped file)/addons/rich_text_label_ex/*  
to (your project)/addons/rich_text_label_ex/*

### (3) Activate plugin
Project &gt; Project Settings &gt; Plugins &gt; RichTextLabelEx &gt; Enable

## How to install (not plugin version)

### (1) Download ZIP file
same as above

### (2) Copy files
Copy from (unzipped file)/addons/rich_text_label_ex/  
rich_text_label_ex.gd  
RichTextLabelEx.svg  
to (your project)/(anywhere but addons)/

## How to use
Add/Create a New Node &gt; RichTextLabelEx  
You can use external images in BBCode tags!

```
[img]user://user_path.png[/img]
[img]E:/absolute_path.png[/img]
[img]relative_path.png[/img]
```

## Limitations
If you turn on bbcode_enabled in editor, turn on bbcode_enabled_deferred instead.  
But you don't need to use bbcode_enabled_deferred in your script.

### Settings for running and exporting
![settings_for_running](screenshots/settings_for_running.png)

### Settings for real-time editing on the editor
![settings_for_editing](screenshots/settings_for_editing.png)
