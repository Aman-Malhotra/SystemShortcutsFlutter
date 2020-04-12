package com.example.systemshortcutsexample;

import android.os.Bundle;

import com.example.systemshortcuts.SystemShortcutsPlugin;

import io.flutter.app.FlutterActivity;

public class EmbeddingV1Activity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SystemShortcutsPlugin.registerWith(registrarFor("com.example.systemshortcuts.SystemShortcutsPlugin"));
    }
}